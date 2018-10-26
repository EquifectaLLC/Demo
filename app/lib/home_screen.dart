import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'app_model.dart';
import 'theme.dart';

class HomeScreen extends ScopedModelDescendant<AppModel> {
  @override
  ScopedModelDescendantBuilder<AppModel> get builder =>
      (context, child, model) => Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
              title: Image.asset('assets/logo-branded-wide.png',
                  fit: BoxFit.cover)),
          body: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('assets/background-small.png'),
                fit: BoxFit.cover,
              ),
            ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            RaisedButton.icon(
              icon: Icon(Icons.view_carousel),
              label: Text('Browse'),
              onPressed: () {
                Navigator.pushNamed(context, '/browse');
              },
            ),
            Spacer(),
            RaisedButton.icon(
              icon: Icon(Icons.search),
              label: Text('Search'),
              onPressed: () {},
            ),
            Spacer(),
            RaisedButton.icon(
              icon: Icon(Icons.star),
              label: Text('Favorites'),
              onPressed: () {},
            ),
            Spacer(),
          ],
        ),
      );
}
