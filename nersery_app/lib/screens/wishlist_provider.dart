import 'package:flutter/material.dart';
import 'package:nersery_app/models/plants.dart';

class WishlistProvider extends ChangeNotifier {
  final List<Plant> _wishlistItems = [];

  List<Plant> get wishlistItems => _wishlistItems;

  void toggleWishlist(Plant plant) {
    if (_wishlistItems.contains(plant)) {
      _wishlistItems.remove(plant);
    } else {
      _wishlistItems.add(plant);
    }
    notifyListeners(); 
  }
}



