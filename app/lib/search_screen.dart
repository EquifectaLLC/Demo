import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'app_model.dart';
import 'theme.dart';

class SearchScreen extends ScopedModelDescendant<AppModel> {
  @override
  ScopedModelDescendantBuilder<AppModel> get builder =>
      (context, child, model) => Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(title: Text('Search')),
//                Image.asset('assets/logo-branded-wide.png', fit: BoxFit.cover)),
            body: Container(
              constraints: BoxConstraints.expand(),
              decoration: new BoxDecoration(
                image: DecorationImage(
//              image: AssetImage('assets/background-small-darker.png'),
                  image: AssetImage('assets/background-small-blur.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
//                    color: Colors.black.withAlpha(220),
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                        autofocus: false,
                        decoration: new InputDecoration(
                            fillColor: Colors.black.withAlpha(220),
                            filled: true,
                            border: OutlineInputBorder(),
                            contentPadding: new EdgeInsets.all(10.0),
                            hintText: "Search...",
                            suffixIcon: new IconButton(
                              icon: new Icon(Icons.search),
                              onPressed: () {},
                            ))),
                  ),
                  Expanded(
                    child: ListView.builder(
//                shrinkWrap: true,
//          padding: EdgeInsets.all(10.0),
                      itemExtent: 100.0,
                      itemCount: model.horses.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index > model.horses.length - 1) return null;

                        return Padding(
                          padding:
//                      EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                              EdgeInsets.only(
                                  top: index == 0 ? 0.0 : 5.0, bottom: 5.0),
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
                                          child: Text(
                                              '#${model.horses[index].hip}',
                                              style: TextStyle(
                                                  fontSize: 32.0,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(model.horses[index].sireName,
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  // fontWeight: FontWeight.w100,
                                                  // fontFamily: 'Times New Roman',
                                                  color: Colors.white)),
                                          Text(model.horses[index].mareName,
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  // fontWeight: FontWeight.w100,
                                                  // fontFamily: 'Times New Roman',
                                                  color: Colors.white)),
                                        ],
                                      )),
                                ),

//                              Container(
//                                  color: Colors.black.withAlpha(220),
//                                  padding: EdgeInsets.all(10.0),
//                                  child: Center(
//                                    child: IconButton(
//                                      onPressed: () {
//                                        var other =
//                                            !model.horses[index].favorite;
//                                        model.setFavorite(other);
//                                      },
//                                      tooltip: 'Favorite',
//                                      icon: model.horse.favorite
//                                          ? Icon(Icons.star)
//                                          : Icon(Icons.star_border),
////              child: Icon(Icons.star_border),
//                                    ),
//                                  )),
//                        ),
                              ]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
}
