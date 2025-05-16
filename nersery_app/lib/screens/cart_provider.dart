
import 'package:flutter/material.dart';
import 'package:nersery_app/models/plants.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Plant plant, int quantity) {
    bool itemExists = _cartItems.any((item) => item['plant'].plantId == plant.plantId);

    if (itemExists) {
      _cartItems.firstWhere((item) => item['plant'].plantId == plant.plantId)['quantity'] += quantity;
    } else {
      _cartItems.add({'plant': plant, 'quantity': quantity});
    }
    notifyListeners();
  }

  void removeFromCart(String plantId) {
    _cartItems.removeWhere((item) => item['plant'].plantId == plantId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
