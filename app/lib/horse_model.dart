import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uuid/uuid.dart';

class HorseModel extends Model {
  String id = Uuid().v4();
  @required double bid;
  @required int hip;
  AssetImage photo;
  AssetImage stats;
  AssetImage catalog;
  AssetImage xray;
  bool favorite;
  String sireName;
  String mareName;

  HorseModel({
    this.favorite,
    this.bid,
    this.hip,
    this.photo,
    this.stats,
    this.catalog,
    this.sireName,
    this.mareName,
    this.xray,
  });
}
