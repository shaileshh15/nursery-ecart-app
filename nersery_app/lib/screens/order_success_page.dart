import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:nersery_app/screens/home_page.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String orderId = "#ORD${Random().nextInt(999999)}"; 

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ Success Icon
              Icon(Icons.check_circle, color: Colors.green, size: 100),
              const SizedBox(height: 20),

              // 🎉 Success Message
              Text("Order Placed Successfully!", 
                style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green.shade800),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              // 📦 Order ID
              Text("Your Order ID: $orderId", 
                style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // 🔙 Back to Home Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false, // Clears all previous routes
                  );
                  // Assuming you have a ValueNotifier<bool> called isDarkModeNotifier


                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                ),
                child: Text("Back to Home", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
