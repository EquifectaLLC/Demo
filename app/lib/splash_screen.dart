import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
          Spacer(),
          Image.asset(
            'assets/logo-branded-tall.png',
            scale: 1.75,
          ),
          Text('SALES',
              style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontFamily: 'Times New Roman',
                  color: Colors.white.withOpacity(.85),
                  fontSize: 24.0)),
          Spacer(),
          Spacer(),
          Text('powered by',
              style: TextStyle(color: Colors.white.withOpacity(.85))),
          Image.asset(
            'assets/logo-equifecta.png',
            scale: 2.5,
          ),
          Spacer(),
        ]));
  }
}

