
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nersery_app/screens/cart_provider.dart';
import 'package:nersery_app/screens/order_success_page.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class OrderSummaryPage extends StatelessWidget {
  final String selectedAddress;
  final String selectedPayment;

  const OrderSummaryPage({Key? key, required this.selectedAddress, required this.selectedPayment}) : super(key: key);

  Future<void> placeOrder(BuildContext context) async {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final cartItems = cartProvider.cartItems;
    double totalAmount = cartItems.fold(0.0, (sum, item) => sum + item['plant'].price * item['quantity']);

    String orderId = "#ORD${Random().nextInt(999999)}"; 
    String userId = "USER_123"; 

    Map<String, dynamic> orderData = {
      "orderId": orderId,
      "userId": userId,
      "address": selectedAddress,
      "paymentMethod": selectedPayment,
      "totalAmount": totalAmount,
      "orderTime": Timestamp.now(),
      "items": cartItems.map((item) => {
        "plantName": item['plant'].plantName,
        "quantity": item['quantity'],
        "price": item['plant'].price,
        "imageURL": item['plant'].imageURL
      }).toList(),
    };

    await FirebaseFirestore.instance.collection("orders").doc(orderId).set(orderData);
    cartProvider.clearCart();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const OrderSuccessPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;
    double totalAmount = cartItems.fold(0.0, (sum, item) => sum + item['plant'].price * item['quantity']);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          'Order Summary',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("📍 Shipping Address:", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
            Text(selectedAddress, style: GoogleFonts.poppins(fontSize: 16)),

            const SizedBox(height: 10),

            Text("💳 Payment Method:", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
            Text(selectedPayment, style: GoogleFonts.poppins(fontSize: 16)),

            const SizedBox(height: 20),

            Text("🛒 Ordered Products:", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartItems[index];
                  final plant = cartItem['plant'];
                  final quantity = cartItem['quantity'];
                  final totalPrice = plant.price * quantity;

                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.asset(plant.imageURL, width: 50, height: 50, fit: BoxFit.cover),
                      title: Text(plant.plantName, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                      subtitle: Text("Quantity: $quantity  |  Total: ₹${totalPrice.toStringAsFixed(2)}"),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            Text("💰 Total Amount: ₹${totalAmount.toStringAsFixed(2)}", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18)),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => placeOrder(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Center(
                child: Text("Place Order", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
