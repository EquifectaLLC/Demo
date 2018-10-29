import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'app_model.dart';
import 'theme.dart';
import 'package:photo_view/photo_view.dart';

class ZoomScreen extends ScopedModelDescendant<AppModel> {
  @override
  ScopedModelDescendantBuilder<AppModel> get builder =>
      (context, child, model) => Scaffold(
            backgroundColor: theme.buttonColor,
            appBar: AppBar(
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    FlatButton(
//                        onPressed: () => model.horseIndex = model.horses.length-1,
                        onPressed: () => {},
                        child: Text('HIP# ${model.currentHip}',
                            style: TextStyle(fontSize: 20.0))),
                    Spacer(),
                    FlatButton(
//                        onPressed: () => model.horseIndex = model.horses.length-1,
                        onPressed: () => {},
                        child: Text(model.horse.sireName,
                            style: TextStyle(fontSize: 12.0))),
                    Spacer(),
                  ]),
            ),
            // body: Container(
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage('assets/background-small-darker-blur.png'),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            //   child: PhotoView(
            body: PhotoView(
              imageProvider: model.getCurrentImage().image,
              backgroundColor: theme.buttonColor,
            ),
            // ),
//            floatingActionButton: new FloatingActionButton(
//
//              onPressed: () {
//                var other = !model.horse.favorite;
//                model.setFavorite(other);
//              },
//              tooltip: 'Favorite',
//              backgroundColor: theme.buttonColor,
//              foregroundColor: Colors.white,
//              child: model.horse.favorite ? Icon(Icons.star) : Icon(Icons.star_border),
////              child: Icon(Icons.star_border),
//            ),
//            bottomNavigationBar: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Spacer(),
//                RaisedButton.icon(
//                  icon: Icon(Icons.assessment),
//                  label: Text('Stats'),
//                  onPressed: () => model.browseView = BrowseView.stats,
//                ),
//                Spacer(),
//                RaisedButton.icon(
//                  icon: Icon(Icons.photo),
//                  label: Text('Photo'),
//                  onPressed: () => model.browseView = BrowseView.images,
//                ),
//                Spacer(),
//                RaisedButton.icon(
//                  icon: Icon(Icons.library_books),
//                  label: Text('Catalog'),
//                  onPressed: () => model.browseView = BrowseView.catalogs,
//                ),
//                Spacer(),
//                IconButton(
//                  icon: Icon(Icons.fullscreen),
//                  onPressed: () => model.toggleFullScreen(),
//                ),
//                Spacer(),
//              ],
//            ),
          );
}
