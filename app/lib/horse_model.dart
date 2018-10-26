import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class HorseModel extends Model {
  @required String name;
  @required double cost;
  @required int hip;
  Image photo;
  Image stats;
  Image catalog;
  bool favorite;

  HorseModel({
    this.name,
    this.favorite,
    this.cost,
    this.hip,
    this.photo,
    this.stats,
    this.catalog,
  });

  setFavorite(bool value) {
    favorite = value;
    notifyListeners();
  }
}
