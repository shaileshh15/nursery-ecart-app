
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nersery_app/screens/order_summary.dart';
import 'package:page_transition/page_transition.dart';

class PaymentPage extends StatefulWidget {
  final String selectedAddress;
  const PaymentPage({Key? key, required this.selectedAddress}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPayment = "Credit/Debit Card"; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          'Payment Options',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double paddingValue = width > 600 ? 40 : 16; // Adjust padding for tablets

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingValue, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Address Section (To confirm before payment)
                  Text("Shipping to:", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(widget.selectedAddress, style: GoogleFonts.poppins(fontSize: 16)),

                  const SizedBox(height: 20),

                  // Payment Section
                  Text("Choose Payment Method", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),

                  // Payment Options
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 3,
                    child: Column(
                      children: [
                        RadioListTile(
                          title: Row(
                            children: [
                              Icon(Icons.credit_card, color: Colors.blueAccent),
                              SizedBox(width: 10),
                              Expanded(child: Text("Credit/Debit Card", overflow: TextOverflow.ellipsis)),
                            ],
                          ),
                          value: "Credit/Debit Card",
                          groupValue: selectedPayment,
                          onChanged: (value) {
                            setState(() {
                              selectedPayment = value.toString();
                            });
                          },
                        ),
                        Divider(),
                        RadioListTile(
                          title: Row(
                            children: [
                              Icon(Icons.account_balance_wallet, color: Colors.green),
                              SizedBox(width: 10),
                              Expanded(child: Text("UPI (Google Pay, PhonePe)", overflow: TextOverflow.ellipsis)),
                            ],
                          ),
                          value: "UPI",
                          groupValue: selectedPayment,
                          onChanged: (value) {
                            setState(() {
                              selectedPayment = value.toString();
                            });
                          },
                        ),
                        Divider(),
                        RadioListTile(
                          title: Row(
                            children: [
                              Icon(Icons.money, color: Colors.orange),
                              SizedBox(width: 10),
                              Expanded(child: Text("Cash on Delivery", overflow: TextOverflow.ellipsis)),
                            ],
                          ),
                          value: "Cash on Delivery",
                          groupValue: selectedPayment,
                          onChanged: (value) {
                            setState(() {
                              selectedPayment = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Confirm Order Button
                  Center(
                    child: SizedBox(
                      width: width > 600 ? 400 : double.infinity, // Adjust button width for larger screens
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: OrderSummaryPage(selectedAddress: widget.selectedAddress, selectedPayment: selectedPayment),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade700,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Center(
                          child: Text("Review Order", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
