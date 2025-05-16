
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nersery_app/screens/wishlist_provider.dart';

import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final wishlistItems = wishlistProvider.wishlistItems;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 2,
      ),
      body: wishlistItems.isEmpty
          ? Center(
              child: Text(
                "Your wishlist is empty!",
                style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            )
          : ListView.builder(
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final plant = wishlistItems[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  child: ListTile(
                    leading: Image.asset(plant.imageURL, width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(plant.plantName, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                    subtitle: Text("\$${plant.price.toStringAsFixed(2)}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        wishlistProvider.toggleWishlist(plant);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}

