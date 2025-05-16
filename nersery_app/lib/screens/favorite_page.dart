
import 'package:flutter/material.dart';
import 'package:nersery_app/models/plants.dart';

class FavoritePage extends StatelessWidget {
  final List<Plant> favoritedPlants;

  const FavoritePage({Key? key, required this.favoritedPlants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: ListView.builder(
        itemCount: favoritedPlants.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoritedPlants[index].plantName),
            leading: Image.asset(favoritedPlants[index].imageURL),
          );
        },
      ),
    );
  }
}