import 'package:flutter/material.dart';
import 'package:nersery_app/models/plants.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminPage extends StatefulWidget {
  final VoidCallback onPlantAdded;
  const AdminPage({Key? key, required this.onPlantAdded}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  String selectedCategory = 'Recommended';

  final List<String> _categories = ['Recommended', 'Indoor', 'Outdoor', 'Garden', 'Supplement'];

  void _addPlant() {
    if (_nameController.text.isNotEmpty && _priceController.text.isNotEmpty) {
      setState(() {
        Plant newPlant = Plant(
          plantId: (Plant.plantList.length + 1).toString(),
          plantName: _nameController.text,
          category: selectedCategory,
          price: double.parse(_priceController.text),
          imageURL: _imageUrlController.text.isNotEmpty
              ? _imageUrlController.text
              : 'assets/images/default_plant.png',
          description: "A beautiful plant for your home.",
        );

        Plant.plantList.add(newPlant);
        widget.onPlantAdded(); // Notify HomePage to update
      });

      _nameController.clear();
      _priceController.clear();
      _imageUrlController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Plant Name', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Price', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL (Leave empty for default asset)', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              value: selectedCategory,
              decoration: InputDecoration(border: OutlineInputBorder()),
              items: _categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value.toString();
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addPlant,
              child: Text('Add Plant'),
            ),
          ],
        ),
      ),
    );
  }
}
