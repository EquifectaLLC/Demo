import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:custom_splash_screen/custom_splash_screen.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const keenelandGreen = Color(0xFF115740);

void main() => runApp(MobileApp());

class MobileApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
        model: new AppModel(),
        child: MaterialApp(
          title: 'Keeneland',
          theme: ThemeData(
            splashColor: keenelandGreen,
            accentColor: Colors.white,
            primaryColor: keenelandGreen,
            canvasColor: keenelandGreen,
            brightness: Brightness.dark,
            backgroundColor: keenelandGreen,
            scaffoldBackgroundColor: Colors.grey.shade900,
          ),
          debugShowCheckedModeBanner: false,
          home: CustomSplashScreen(
            backgroundColor: keenelandGreen,
            loadingSplash: SplashPage(),
            errorSplash: ErrorPage(),
            seconds: 3,
            navigateAfterSeconds: HomePage(),
          ),
        ));
  }
}

class AppModel extends Model {
  int _selectedPageIndex = 0;
  int get selectedPageIndex => _selectedPageIndex;

  void selectPage(int index) {
    _selectedPageIndex = index;
    notifyListeners();
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
        child: Column(children: <Widget>[
      Spacer(),
      Image.asset(
        'graphics/logo-branded-tall.png',
        scale: 1.75,
      ),
      Text('SALES',
          style: TextStyle(
              fontWeight: FontWeight.w100,
              fontFamily: 'Times New Roman',
              color: Colors.white.withOpacity(.85),
              fontSize: 24.0)),
      Spacer(),
      Text('powered by',
          style: TextStyle(color: Colors.white.withOpacity(.85))),
      Image.asset(
        'graphics/logo-equifecta.png',
        scale: 2.5,
      ),
    ]));
  }
}

class HomePage extends ScopedModelDescendant<AppModel> {
  @override
  ScopedModelDescendantBuilder<AppModel> get builder =>
      (context, child, model) => Scaffold(
            backgroundColor: keenelandGreen,
            appBar: AppBar(
                // title: Text('Keenland'),
                title: Image.asset('graphics/logo-branded-wide.png',
                    fit: BoxFit.cover)),
            body: Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage('graphics/background-small.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: [
                  Container(
                    child: Center(child: Text('Home Page stuff...')),
                  ),
                  Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(
                        "https://loremflickr.com/350/500/keeneland/all?random=${index})",
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: 10,
                    itemWidth: double.infinity,
                    itemHeight: double.infinity,
                    layout: SwiperLayout.TINDER,
                  ),
                  new Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(
                        "https://loremflickr.com/350/500/keeneland/all?random=${index})",
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: 10,
                    pagination: new SwiperPagination(),
                    control: new SwiperControl(color: Colors.white),
                  ),
                  Container(color: keenelandGreen, child: SplashPage()),
                ][model.selectedPageIndex]),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: model.selectedPageIndex,
              onTap: (index) => model.selectPage(index),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    title: Text('Home'), icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    title: Text('Book'), icon: Icon(Icons.view_carousel)),
                BottomNavigationBarItem(
                    title: Text('Larger'), icon: Icon(Icons.library_books)),
                BottomNavigationBarItem(
                    title: Text('Splash'), icon: Icon(Icons.restore_page)),
              ],
            ),
          );
}

class BookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container();
  }
}
