import 'package:flutter/material.dart';
import 'package:restoran_app/screen/detail_page/detail_restaurant_page.dart';
import 'package:restoran_app/screen/home_page/home.dart';
import 'package:restoran_app/screen/splash.dart';
import 'package:restoran_app/component/style.dart';

import 'models/restaurant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: primaryColor,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.blue)),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        Home.routeName: (_) => const Home(),
        RestaurantListPage.routeName: (_) => const RestaurantListPage(),
        DetailRestaurantPage.routeName: (context) => DetailRestaurantPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
      },
    );
  }
}
