import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:scoped_model/scoped_model.dart';
import 'horse_model.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:math';


Image getHorseImage(index) {
  return Image.asset('assets/horses/horse-$index.png', fit: BoxFit.fill,);
//  var result = Image.network(
//    'https://dummyimage.com/350x500/ff/115740.png&text=Photo+-+$index',
////    'https://loremflickr.com/350/500/horse/all?random=$index',
//    fit: BoxFit.fill,
//  );

//  return result;
}

Image getCatalogImage(index) {
  return Image.asset('assets/horses/catalog-$index.jpg', fit: BoxFit.fill,);
//  var result = Image.network(
//    'https://dummyimage.com/350x500/ff/115740.png&text=Catalog+-+$index',
////    'https://loremflickr.com/350/500/catalog/all?random=$index',
//    fit: BoxFit.fill,
//  );

//  return result;
}

Image getStatsImage(index) {
  return Image.asset('assets/horses/catalog-$index.jpg', fit: BoxFit.fill,);
//  var result = Image.network(
//    'https://dummyimage.com/350x500/ff/115740.png&text=Stats+-+$index',
////    'https://loremflickr.com/350/500/stats/all?random=$index',
//    fit: BoxFit.fill,
//  );
//
//  return result;
}

enum BrowseView {
  images,
  stats,
  catalogs
}

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
  set browseView(view) { _browseView = view; notifyListeners(); }

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
    if(_currentDuration >= _maxBidSeconds) {
      _currentHip++;
      _currentBid = 0;
      _currentDuration = 0;
    }
    else {
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

  HorseModel get horse => horses[horseIndex];
  set horse(horse) {
    horses[horseIndex] = horse;
    notifyListeners();
  }

  // TODO: Cody, fill in this data from the pictures Thomas sent
  // TODO: We will want the images to reside in the assets folder so it looks snappy
  List<HorseModel> _horses = <HorseModel>[
    HorseModel(hip: 1, catalog: getCatalogImage(1), photo: getHorseImage(1), stats: getStatsImage(1), favorite: false),
    HorseModel(hip: 2, catalog: getCatalogImage(2), photo: getHorseImage(2), stats: getStatsImage(2), favorite: false),
    HorseModel(hip: 3, catalog: getCatalogImage(3), photo: getHorseImage(3), stats: getStatsImage(3), favorite: false),
  ];

  List<HorseModel> get horses => _horses;
  set horses(value) {
    _horses = value;
    notifyListeners();
  }
}
