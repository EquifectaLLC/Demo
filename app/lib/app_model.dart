import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'horse_model.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:math';

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
    _startTimer();
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
        hip: 1,
        catalog: getCatalogImage(1),
        photo: getHorseImage(1),
        stats: getStatsImage(1),
        xray: getXrayImage(1),
        sireName: 'More Than Ready (1997)',
        mareName: 'Moondance (2014)',
        favorite: false),
    HorseModel(
        hip: 2,
        catalog: getCatalogImage(2),
        photo: getHorseImage(2),
        stats: getStatsImage(2),
        xray: getXrayImage(2),
        sireName: 'Quality Road (2006)',
        mareName: 'Treasure Trail (2006)',
        favorite: false),
    HorseModel(
        hip: 3,
        catalog: getCatalogImage(3),
        photo: getHorseImage(3),
        stats: getStatsImage(3),
        xray: getXrayImage(3),
        sireName: 'Uncle Mo (2008)',
        mareName: 'Surfside Tiara (2013)',
        favorite: false),
  ];

  List<HorseModel> get horses => _horses;
  
  List<HorseModel> get favorites => _horses.where((x) => x.favorite == true).toList();

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


  static AssetImage getHorseImage(index) => AssetImage('assets/horses/horse-$index.png');
  static AssetImage getCatalogImage(index) => AssetImage('assets/horses/catalog-$index.jpg');
  static AssetImage getStatsImage(index) => AssetImage('assets/horses/stats-$index.jpg');
  static AssetImage getXrayImage(index) => AssetImage('assets/horses/xray-$index.jpg');

}
