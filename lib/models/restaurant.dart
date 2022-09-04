import 'dart:convert';

import 'menus.dart';

ListRestaurant listRestaurantFromJson(String str) =>
    ListRestaurant.fromJson(json.decode(str));

String localRestaurantToJson(ListRestaurant data) => json.encode(data.toJson());

class ListRestaurant {
  List<Restaurant> restaurants;

  ListRestaurant({
    required this.restaurants,
  });

  factory ListRestaurant.fromJson(Map<String, dynamic> json) => ListRestaurant(
      restaurants: List<Restaurant>.from(
          json['restaurants'].map((element) => Restaurant.fromJson(element))));

  Map<String, dynamic> toJson() => {
        "restaurants": List<dynamic>.from(
            restaurants.map((restaurant) => restaurant.toJson()))
      };
}

class Restaurant {
  Restaurant(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.rating,
      required this.menus});

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menus menus;
  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      pictureId: json["pictureId"],
      city: json["city"],
      rating: json["rating"].toDouble(),
      menus: Menus.fromJson(json["menus"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
        "menus": menus.toJson(),
      };
}
