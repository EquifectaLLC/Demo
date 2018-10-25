import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'app_model.dart';

class BrowseScreen extends ScopedModelDescendant<AppModel> {
  @override
  ScopedModelDescendantBuilder<AppModel> get builder =>
      (context, child, model) => Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                "https://loremflickr.com/350/500/keeneland/all?random=$index",
                fit: BoxFit.fill,
              );
            },
            itemCount: 10,
            itemWidth: double.infinity,
            itemHeight: double.infinity,
            layout: SwiperLayout.TINDER,
          );
}
