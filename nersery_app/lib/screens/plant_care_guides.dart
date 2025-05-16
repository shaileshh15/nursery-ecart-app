import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantCareGuidesPage extends StatelessWidget {
  final List<Map<String, String>> guides = [
    {"title": "How to Water Plants Correctly?", "content": "Water your plants in the early morning or evening..."},
    {"title": "Best Fertilizers for Indoor Plants", "content": "Use organic fertilizers like compost or vermicompost..."},
    {"title": "Common Plant Diseases & How to Prevent Them", "content": "Avoid overwatering and provide enough sunlight..."},
  ];

  PlantCareGuidesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plant Care Guides", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: guides.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                title: Text(guides[index]["title"]!, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                subtitle: Text(guides[index]["content"]!, style: GoogleFonts.poppins(color: Colors.black87)),
              ),
            );
          },
        ),
      ),
    );
  }
}
