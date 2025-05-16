import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantEquipmentPage extends StatelessWidget {
  final List<Map<String, String>> equipmentList = [
    {"name": "Watering Can", "image": "assets/images/watering_can.png", "price": "₹250"},
    {"name": "Pruning Shears", "image": "assets/images/pruning_shears.png", "price": "₹400"},
    {"name": "Plant Pots", "image": "assets/images/plant_pot.png", "price": "₹350"},
    {"name": "Organic Fertilizer", "image": "assets/images/fertilizer.png", "price": "₹200"},
  ];

  PlantEquipmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plant Equipment", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 0.8,
          ),
          itemCount: equipmentList.length,
          itemBuilder: (context, index) {
            final item = equipmentList[index];

            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Image.asset(item["image"]!, fit: BoxFit.cover)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(item["name"]!, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                  ),
                  Text(item["price"]!, style: GoogleFonts.poppins(color: Colors.green)),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
