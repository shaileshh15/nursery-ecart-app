import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nersery_app/screens/payment_page.dart';
import 'package:page_transition/page_transition.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String selectedAddress = "Home Address"; // Default selection
  bool isCustomAddress = false; // Flag to track custom address input
  final TextEditingController addressController = TextEditingController(); // Controller for custom address

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Address Section
            Text("Select or Enter Address", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // Address Options
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              child: Column(
                children: [
                  RadioListTile(
                    title: Text("🏠 Home - 123, Street Name, City"),
                    value: "Home Address",
                    groupValue: selectedAddress,
                    onChanged: (value) {
                      setState(() {
                        selectedAddress = value.toString();
                        isCustomAddress = false; // Reset custom address input
                      });
                    },
                  ),
                  Divider(),
                  RadioListTile(
                    title: Text("🏢 Office - 456, Business Park, City"),
                    value: "Office Address",
                    groupValue: selectedAddress,
                    onChanged: (value) {
                      setState(() {
                        selectedAddress = value.toString();
                        isCustomAddress = false;
                      });
                    },
                  ),
                  Divider(),
                  RadioListTile(
                    title: Text("✍️ Enter a New Address"),
                    value: "Custom Address",
                    groupValue: selectedAddress,
                    onChanged: (value) {
                      setState(() {
                        selectedAddress = value.toString();
                        isCustomAddress = true; // Show input field
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Custom Address Input Field
            if (isCustomAddress)
              TextField(
                controller: addressController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Enter your full address...",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

            const Spacer(),

            // Proceed to Payment Button
            ElevatedButton(
              onPressed: () {
                String finalAddress = isCustomAddress ? addressController.text.trim() : selectedAddress;

                if (finalAddress.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please enter a valid address.")),
                  );
                  return;
                }

                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: PaymentPage(selectedAddress: finalAddress),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Center(
                child: Text("Proceed to Payment", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



