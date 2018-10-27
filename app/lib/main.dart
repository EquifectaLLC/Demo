import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:custom_splash_screen/custom_splash_screen.dart';
import 'theme.dart';
import 'app_model.dart';
import 'error_screen.dart';
import 'splash_screen.dart';
import 'home_screen.dart';
import 'browse_screen.dart';
import 'zoom_screen.dart';

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
          initialRoute: '/',
          routes: {
            // When we navigate to the "/" route, build the FirstScreen Widget
            '/': (context) => CustomSplashScreen(
            backgroundColor: theme.backgroundColor,
            loadingSplash: SplashScreen(),
            errorSplash: ErrorScreen(),
            seconds: 3,
            navigateAfterSeconds: HomeScreen(),
          ),
            '/browse': (context) => BrowseScreen(),
            '/zoom': (context) => ZoomScreen(),
          },
        ));
  }
}
