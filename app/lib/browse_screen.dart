import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'app_model.dart';
import 'theme.dart';

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
                    Spacer(),
                    FlatButton(
                        onPressed: () => model.horseIndex = model.horses.length-1,
                        child: Text('HIP# ${model.currentHip}',
                        style: TextStyle(fontSize: 20.0))),
                    Spacer(),
                    FlatButton(
                        onPressed: () => model.horseIndex = model.horses.length-1,
                        child: Text(model.currentBidFormatted,
                        style: TextStyle(fontSize: 20.0))),
                    Spacer(),
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
                      return model.horses[index].catalog;
                      break;
                    case BrowseView.images:
                      return model.horses[index].photo;
                      break;
                    case BrowseView.stats:
                      return model.horses[index].stats;
                      break;
                  }
                  return model.horses[index].photo;
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
                var other = !model.horse.favorite;
                model.setFavorite(other);
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
