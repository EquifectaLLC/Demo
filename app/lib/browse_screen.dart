import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'app_model.dart';
import 'theme.dart';

class BrowseScreen extends ScopedModelDescendant<AppModel> {
  @override
  ScopedModelDescendantBuilder<AppModel> get builder =>
      (context, child, model) => Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
//                        onPressed: () => model.horseIndex = model.horses.length-1,
                        onPressed: () => {},
                        child: Text('HIP# ${model.horse.hip}',
                            style: TextStyle(fontSize: 20.0))),
                    FlatButton(
//                        onPressed: () => model.horseIndex = model.horses.length-1,
                        onPressed: () => {},
                        child: Text(model.horse.sireName,
                            style: TextStyle(fontSize: 12.0))),
                    Spacer(),
                  ]),
            ),
            body: Container(
              // color: theme.buttonColor,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background-small-darker-blur.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Swiper(
                onTap: (index) {
                  model.navigateTo(context, '/zoom');
                  // model.router.navigateTo(context, '/zoom');
                  // Navigator.pushNamed(context, '/zoom');
                },
                itemBuilder: (BuildContext context, int index) {
                  return model.getImage(index);
                },
                itemCount: model.horses.length,
                itemWidth: double.infinity,
                itemHeight: double.infinity,
                layout: model.fullScreen
                    ? SwiperLayout.DEFAULT
                    : SwiperLayout.TINDER,
                onIndexChanged: (index) {
                  model.horseIndex = index;
                },
                index: model.horseIndex,
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
              child: model.horse.favorite
                  ? Icon(Icons.star)
                  : Icon(Icons.star_border),
//              child: Icon(Icons.star_border),
            ),
            bottomNavigationBar: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                RaisedButton.icon(
                  icon: Icon(Icons.assessment),
                  label: Text('X-Rays'),
                  onPressed: () => model.browseView = BrowseView.stats,
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
