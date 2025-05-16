import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nersery_app/admin/admin_login_page.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  void logoutAdmin(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AdminLoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          'Admin - Orders',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            onPressed: () => logoutAdmin(context),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double paddingValue = width > 600 ? 40 : 16;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingValue, vertical: 10),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("orders")
                  .orderBy("orderTime", descending: true)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      "No orders found!",
                      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var order = snapshot.data!.docs[index];
                    var items = order["items"] as List<dynamic>;

                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Order ID & Timestamp
                            Text("📦 Order ID: ${order["orderId"]}",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            Text("🕒 ${order["orderTime"].toDate()}",
                                style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey)),
                            const SizedBox(height: 10),

                            
                            Text("📍 Address: ${order["address"]}",
                                style: GoogleFonts.poppins(fontSize: 14)),
                            Text("💳 Payment: ${order["paymentMethod"]}",
                                style: GoogleFonts.poppins(fontSize: 14)),
                            Text("💰 Total: \$${order["totalAmount"].toStringAsFixed(2)}",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold, color: Colors.green)),

                            const SizedBox(height: 10),

                            // Ordered Items
                            Text("🛒 Items Ordered:",
                                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),

                            Column(
                              children: items.map((item) {
                                return ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      item["imageURL"] ?? "",
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return const Icon(Icons.image_not_supported,
                                            size: 50, color: Colors.grey);
                                      },
                                    ),
                                  ),
                                  title: Text(item["plantName"],
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                      "Quantity: ${item["quantity"]}  |  Price: \$${item["price"]}"),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
