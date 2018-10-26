import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'app_model.dart';
import 'theme.dart';
import 'horse_model.dart';

class BrowseScreen extends ScopedModelDescendant<AppModel> {
  @override
  ScopedModelDescendantBuilder<AppModel> get builder =>
          (context, child, model) =>
          Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HIP: ${model.horse.hip}'),
                  ]
              ),
            ),
            body: Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage('assets/background-small-darker.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  switch (model.browseView) {
                    case BrowseView.catalogs:
                      return model.horse.catalog;
                      break;
                    case BrowseView.images:
                      return model.horse.photo;
                      break;
                    case BrowseView.stats:
                      return model.horse.stats;
                      break;
                  }
                  return model.horse.photo;
                },
                itemCount: model.horses.length,
                itemWidth: double.infinity,
                itemHeight: double.infinity,
                layout: model.fullScreen ? SwiperLayout.DEFAULT : SwiperLayout
                    .TINDER,
                onIndexChanged: (index) {
                  model.horseIndex = index;
                },
              ),
            ),
            floatingActionButton: new FloatingActionButton(
              onPressed: () {
                model.horse.favorite = !model.horse.favorite;
              },
              tooltip: 'Favorite',
              backgroundColor: theme.buttonColor,
              foregroundColor: Colors.white,
              child: model.horse.favorite ? Icon(Icons.star) : Icon(Icons.star_border),
//              child: Icon(Icons.star_border),
            ),
            bottomNavigationBar: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                RaisedButton.icon(
                  icon: Icon(Icons.assessment),
                  label: Text('Stats'),
                  onPressed: () => model.browseView = BrowseView.stats,
                ),
                Spacer(),
                RaisedButton.icon(
                  icon: Icon(Icons.photo),
                  label: Text('Photo'),
                  onPressed: () => model.browseView = BrowseView.images,
                ),
                Spacer(),
                RaisedButton.icon(
                  icon: Icon(Icons.library_books),
                  label: Text('Catalog'),
                  onPressed: () => model.browseView = BrowseView.catalogs,
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.fullscreen),
                  onPressed: () => model.toggleFullScreen(),
                ),
                Spacer(),
              ],
            ),
          );
}
