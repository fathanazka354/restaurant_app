import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restoran_app/screen/home_page/widget/error_page.dart';
import 'package:restoran_app/screen/home_page/widget/list_content.dart';
import 'package:restoran_app/component/style.dart';

import '../../models/restaurant.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Restaurant> restaurants = [];
  Future<List<Restaurant>> getAllRestaurant() async {
    final String response =
        await rootBundle.loadString('assets/restaurant.json');
    final jsonData = await json.decode(response);
    var data = jsonData['restaurants'] as List<dynamic>;
    setState(() {
      restaurants = data.map((e) => Restaurant.fromJson(e)).toList();
    });
    return restaurants;
  }

  @override
  void initState() {
    super.initState();
    getAllRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    Widget bottomNav() {
      return BottomNavigationBar(
        elevation: 20,
        backgroundColor: const Color.fromARGB(255, 219, 219, 219),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 24,
              ),
              label: 'Favorite')
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurant App',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryColor,
      ),
      bottomNavigationBar: bottomNav(),
      body: const RestaurantListPage(),
    );
  }
}

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/home';
  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future:
          DefaultAssetBundle.of(context).loadString('assets/restaurant.json'),
      builder: (context, snapshot) {
        try {
          final ListRestaurant listRestaurant =
              listRestaurantFromJson(snapshot.data!);
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) => ListContent(
                  context: context,
                  restaurant: listRestaurant.restaurants[index]),
              itemCount: listRestaurant.restaurants.length,
            );
          }
        } catch (e) {
          return ErrorPage(
            context: context,
          );
        }
        return ErrorPage(
          context: context,
        );
      },
    );
  }
}
