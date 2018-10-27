import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class HorseModel extends Model {
  @required double bid;
  @required int hip;
  AssetImage photo;
  AssetImage stats;
  AssetImage catalog;
  bool favorite;

  HorseModel({
    this.favorite,
    this.bid,
    this.hip,
    this.photo,
    this.stats,
    this.catalog,
  });
}
