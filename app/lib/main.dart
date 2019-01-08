import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'theme.dart';
import 'app_model.dart';

void main() {
  runApp(MobileApp());
}

class MobileApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var model = new AppModel();
    return ScopedModel<AppModel>(
        model: model,
        child: MaterialApp(
          title: 'Keeneland',
          theme: theme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: model.router.generator,
          initialRoute: '/',
        ));
  }
}
