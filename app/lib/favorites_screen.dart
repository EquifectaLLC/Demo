import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'app_model.dart';
import 'theme.dart';
import 'package:uuid/uuid.dart';

class FavoritesScreen extends ScopedModelDescendant<AppModel> {
  @override
  ScopedModelDescendantBuilder<AppModel> get builder => (context, child,
          model) =>
      Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
            title: Text('Favorites')),
//                Image.asset('assets/logo-branded-wide.png', fit: BoxFit.cover)),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: new BoxDecoration(
            image: DecorationImage(
//              image: AssetImage('assets/background-small-darker.png'),
              image: AssetImage('assets/background-small.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView.builder(
//                shrinkWrap: true,
//          padding: EdgeInsets.all(10.0),
            itemExtent: 100.0,
            itemCount: model.favorites.length,
            itemBuilder: (BuildContext context, int index) {
              if (index > model.favorites.length - 1) return null;

              return Dismissible(
                direction: DismissDirection.endToStart,
                background: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                Expanded(child: Container(
                color: theme.buttonColor.withAlpha(200),
                )),
                      Container(
                          padding: EdgeInsets.all(10.0),
                          color: theme.buttonColor.withAlpha(200),
                          child: Center(
                              child: Text(
                            'Remove',
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.white),
                          )))
                    ]),
                onDismissed: (direction) {
                  model.removeFavorite(index);
                },
                key: Key(model.favorites[index].id),
                child: Padding(
                  padding:
//                      EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                      EdgeInsets.only(top: index == 0 ? 0.0 : 5.0, bottom: 5.0),
//                  EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        model.getListImage(index),
//                        Expanded(
//                            child:
                        Container(
                          color: Colors.black.withAlpha(220),
                          child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Center(
                                  child: Text('#${model.favorites[index].hip}',
                                      style: TextStyle(
                                          fontSize: 36.0,
                                          fontWeight: FontWeight.w100,
                                          fontFamily: 'Times New Roman',
                                          color: Colors.white)))),
//                            decoration: BoxDecoration(color: Colors.white),
//                            decoration: BoxDecoration(
//                            ),
                        ),

                        Expanded(
                          child: Container(
                              color: Colors.black.withAlpha(220),
//                        constraints: BoxConstraints.expand(),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(model.favorites[index].sireName,
                                      style: TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w100,
                                          fontFamily: 'Times New Roman',
                                          color: Colors.white)),
                                  Text(model.favorites[index].mareName,
                                      style: TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w100,
                                          fontFamily: 'Times New Roman',
                                          color: Colors.white)),
                                ],
                              )),
                        ),
//                        ),
                      ]),
                ),
              );
            },
          ),
        ),
      );
}
