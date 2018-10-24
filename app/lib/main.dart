import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:custom_splash_screen/custom_splash_screen.dart';

const keenelandGreen = Color(0xFF115740);

void main() => runApp(MobileApp());

class MobileApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keeneland',
      theme: ThemeData(
        splashColor: keenelandGreen,
        accentColor: Colors.white,
        primaryColor: keenelandGreen,
        canvasColor: keenelandGreen,
        brightness: Brightness.dark,

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        // primarySwatch: MaterialColor(keenelandGreen.value, const {
        //   50: keenelandGreen,
        //   100: keenelandGreen,
        //   200: keenelandGreen,
        //   300: keenelandGreen,
        //   400: keenelandGreen,
        //   500: keenelandGreen,
        //   600: keenelandGreen,
        //   700: keenelandGreen,
        //   800: keenelandGreen,
        //   900: keenelandGreen,
        // }),
      ),
      debugShowCheckedModeBanner: false,
      home: CustomSplashScreen(
        backgroundColor: keenelandGreen,
        loadingSplash: SplashPage(),
        errorSplash: ErrorPage(),
        seconds: 3,
        navigateAfterSeconds: HomePage(),
      ),
    );
  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "ERROR",
        style: TextStyle(fontSize: 25.0, color: Colors.red),
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      'graphics/logo-branded-tall.png',
      scale: 1.75,
    ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: keenelandGreen,
      appBar: AppBar(
          // title: Text('Keenland'),
          title:
              Image.asset('graphics/logo-branded-wide.png', fit: BoxFit.cover)),
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('graphics/background-small.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: null /* add child content content here */,
      ),
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(title: Text('Home'), icon: Icon(Icons.home)),
        BottomNavigationBarItem(
            title: Text('Book'), icon: Icon(Icons.library_books))
      ]),
    );
  }
}
