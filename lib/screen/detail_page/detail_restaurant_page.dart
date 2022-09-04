import 'package:flutter/material.dart';
import 'package:restoran_app/models/restaurant.dart';
import 'package:restoran_app/screen/detail_page/widget/slide_makanan.dart';
import 'package:restoran_app/screen/detail_page/widget/slide_minuman.dart';

class DetailRestaurantPage extends StatelessWidget {
  static const String routeName = '/detail_page';
  const DetailRestaurantPage({Key? key, required this.restaurant})
      : super(key: key);

  final Restaurant restaurant;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text(restaurant.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(restaurant.pictureId),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_pin),
                      Text(restaurant.city)
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(restaurant.description),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    "Rating: ${restaurant.rating.toString()}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  const Text(
                    'Menu',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SlideMakanan(
                        restaurant: restaurant,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10),
                      child: SlideMinuman(
                        restaurant: restaurant,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
