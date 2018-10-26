import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'horse_model.dart';

getImage(index) {
  return Image.network(
    'https://loremflickr.com/350/500/keeneland/all?random=$index',
    fit: BoxFit.fill,
  );
}

getHorseImage(index) {
  return Image.network(
    'https://dummyimage.com/350x500/ff/115740.png&text=Photo+-+${index}',
//    'https://loremflickr.com/350/500/horse/all?random=$index',
    fit: BoxFit.fill,
  );
}

getCatalogImage(index) {
  return Image.network(
    'https://dummyimage.com/350x500/ff/115740.png&text=Catalog+-+${index}',
//    'https://loremflickr.com/350/500/catalog/all?random=$index',
    fit: BoxFit.fill,
  );
}

getStatsImage(index) {
  return Image.network(
    'https://dummyimage.com/350x500/ff/115740.png&text=Stats+-+${index}',
//    'https://loremflickr.com/350/500/stats/all?random=$index',
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

  void setFavorite(bool value) {
    horses[horseIndex].setFavorite(value);
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
    HorseModel(name: 'Izzy', cost: 900000.0, hip: 1, catalog: getCatalogImage(1), photo: getHorseImage(1), stats: getStatsImage(1), favorite: false),
    HorseModel(name: 'Sam', cost: 600000.0, hip: 2, catalog: getCatalogImage(2), photo: getHorseImage(2), stats: getStatsImage(2), favorite: false),
    HorseModel(name: 'Goob', cost: 300000.0, hip: 2, catalog: getCatalogImage(3), photo: getHorseImage(3), stats: getStatsImage(3), favorite: false),
  ];

  List<HorseModel> get horses => _horses;
  set horses(value) {
    _horses = value;
    notifyListeners();
  }
}
