import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'horse_model.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:math';
import 'package:fluro/fluro.dart';
import 'favorites_screen.dart';
import 'search_screen.dart';
import 'browse_screen.dart';
import 'zoom_screen.dart';
import 'package:custom_splash_screen/custom_splash_screen.dart';
import 'splash_screen.dart';
import 'error_screen.dart';
import 'home_screen.dart';
import 'theme.dart';

enum BrowseView { images, stats, catalogs }

class AppModel extends Model {
  var _currentHip = 1;

  get currentHip => _currentHip;

  var _currentBid = 0;

  get currentBid => _currentBid;

  get currentBidFormatted => _formatCurrency.format(currentBid);

  var _formatCurrency = new NumberFormat('\$###,###,###');

  var _fullScreen = false;

  get fullScreen => _fullScreen;

  var _horseIndex = 0;

  get horseIndex => _horseIndex;

  set horseIndex(index) {
    if (index != _horseIndex) {
      _horseIndex = index;
      notifyListeners();
    }
  }

  var _browseView = BrowseView.images;

  get browseView => _browseView;

  set browseView(view) {
    _browseView = view;
    notifyListeners();
  }

  var _maxBidSeconds = 30;
  var _currentDuration = 0;
  var _lastBidSeconds = 0;
  var _bidsMade = 0;
  var _bidTime = 0;

  get averageBidSeconds => _bidTime / _bidsMade;

  AppModel() {
    // _startTimer();
    defineRoutes(router);
  }

  random(int max) => Random().nextInt(max);

  _startTimer() {
    var rand = random(5);
    _bidTime += rand;
    var duration = Duration(seconds: rand);
    _currentDuration += duration.inSeconds;
    _lastBidSeconds = rand;
    Timer(duration, _timerAction);
  }

  _timerAction() {
    if (_currentDuration >= _maxBidSeconds) {
      _currentHip++;
      _currentBid = 0;
      _currentDuration = 0;
    } else {
      _bidsMade++;
      _bidTime += _lastBidSeconds;
      _lastBidSeconds = 0;
      _currentBid += 100 * random(100);
    }
    notifyListeners();
    _startTimer();
  }

  void toggleFullScreen() {
    _fullScreen = !_fullScreen;
    notifyListeners();
  }

  void setFavorite(bool value) {
    horses[horseIndex].favorite = value;
    notifyListeners();
  }

  void setAllFavorites() {
    horses.forEach((x) => x.favorite = true);
    notifyListeners();
  }

  void removeFavorite(int index) {
    favorites[index].favorite = false;
    notifyListeners();
  }

  HorseModel get horse => horses[horseIndex];

  set horse(horse) {
    horses[horseIndex] = horse;
    notifyListeners();
  }

  List<HorseModel> _horses = <HorseModel>[
    HorseModel(
        hip: 26,
        catalog: getCatalogImage(1),
        photo: getHorseImage(1),
        // stats: getStatsImage(1),
        xray: getXrayImage(1),
        sireName: 'Tale of the Cat (1994)',
        mareName: 'Dean Henry (2005)',
        favorite: false),
    HorseModel(
        hip: 19,
        catalog: getCatalogImage(2),
        photo: getHorseImage(2),
        // stats: getStatsImage(2),
        xray: getXrayImage(2),
        sireName: 'Smart Strike (1992)',
        mareName: 'Storm Flag Flying (2000)',
        favorite: false),
    HorseModel(
        hip: 18,
        catalog: getCatalogImage(3),
        photo: getHorseImage(3),
        // stats: getStatsImage(3),
        xray: getXrayImage(3),
        sireName: 'Giant\'s Causeway (1997)',
        mareName: 'Russian Ballet (1988)',
        favorite: false),
    HorseModel(
        hip: 14,
        catalog: getCatalogImage(4),
        photo: getHorseImage(4),
        // stats: getStatsImage(3),
        xray: getXrayImage(4),
        sireName: 'Medaglia D\'Oro (1999)',
        mareName: 'Auntie Joy (2013)',
        favorite: false),
    HorseModel(
        hip: 11,
        catalog: getCatalogImage(5),
        photo: getHorseImage(5),
        // stats: getStatsImage(5),
        xray: getXrayImage(5),
        sireName: 'Bernardini (2003)',
        mareName: 'Uchitel (2007)',
        favorite: false),
  ];

  List<HorseModel> get horses => _horses;

  List<HorseModel> get favorites =>
      _horses.where((x) => x.favorite == true).toList();

  set horses(value) {
    _horses = value;
    notifyListeners();
  }

  Image getCurrentImage() {
    return getImage(_horseIndex);
  }

  Image getListImage(index) {
    return Image(image: horses[index].photo);
  }

  Image getImage(index) {
    switch (browseView) {
      case BrowseView.catalogs:
        return Image(image: horses[index].catalog);
        break;
      case BrowseView.images:
        return Image(image: horses[index].photo);
        break;
      case BrowseView.stats:
//        return Image(image: horses[index].stats);
        return Image(image: horses[index].xray);
        break;
    }
    return Image(image: horses[index].photo);
  }

  static AssetImage getHorseImage(index) =>
      AssetImage('assets/horses/photo-$index.jpg');
  static AssetImage getCatalogImage(index) =>
      AssetImage('assets/horses/catalog-$index.png');
  // static AssetImage getStatsImage(index) =>
  //     AssetImage('assets/horses/stats-$index.jpg');
  static AssetImage getXrayImage(index) =>
      AssetImage('assets/horses/xray-$index.jpg');

  final router = Router();
  void defineRoutes(Router router) {
    router.define("/browse",
        handler: Handler(handlerFunc: (context, params) => BrowseScreen()));
    router.define("/favorites",
        handler: Handler(handlerFunc: (context, params) => FavoritesScreen()));
    router.define("/search",
        handler: Handler(handlerFunc: (context, params) => SearchScreen()));
    router.define("/zoom",
        handler: Handler(handlerFunc: (context, params) => ZoomScreen()));
    router.define("/",
        handler: Handler(
            handlerFunc: (context, params) => CustomSplashScreen(
                  backgroundColor: theme.backgroundColor,
                  loadingSplash: SplashScreen(),
                  errorSplash: ErrorScreen(),
                  seconds: 3,
                  navigateAfterSeconds: HomeScreen(),
                )));
  }

  void navigateTo(BuildContext context, String path) {
    router.navigateTo(context, path, transition: TransitionType.fadeIn);
  }
}
