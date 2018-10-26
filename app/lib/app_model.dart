import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'horse_model.dart';

getImage(index) {
  return Image.network(
    'https://loremflickr.com/350/500/keeneland/all?random=$index',
    fit: BoxFit.fill,
  );
}

enum BrowseView {
  images,
  stats,
  catalogs
}

class AppModel extends Model {
  var _fullScreen = false;
  get fullScreen => _fullScreen;

  var _horseIndex = 0;
  get horseIndex => _horseIndex;
  set horseIndex(index) { _horseIndex = index; notifyListeners(); }

  var _browseView = BrowseView.images;
  get browseView => _browseView;
  set browseView(view) { _browseView = view; notifyListeners(); }

  void toggleFullScreen() {
    _fullScreen = !_fullScreen;
    notifyListeners();
  }

  HorseModel get horse => horses[horseIndex];
  set horse(horse) {
    horses[horseIndex] = horse;
    horses[horseIndex].notifyListeners();
    notifyListeners();
  }

  List<HorseModel> get horses => <HorseModel>[
    HorseModel(name: 'Izzy', cost: 900000.0, hip: 1, catalog: getImage(0), photo: getImage(1), stats: getImage(2), favorite: false),
    HorseModel(name: 'Sam', cost: 600000.0, hip: 2, catalog: getImage(3), photo: getImage(4), stats: getImage(5), favorite: false),
    HorseModel(name: 'Goob', cost: 300000.0, hip: 2, catalog: getImage(6), photo: getImage(7), stats: getImage(8), favorite: false),
  ];
}
