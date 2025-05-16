import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantCareScheduleScreen extends StatefulWidget {
  const PlantCareScheduleScreen({Key? key}) : super(key: key);

  @override
  _PlantCareScheduleScreenState createState() =>
      _PlantCareScheduleScreenState();
}

class _PlantCareScheduleScreenState extends State<PlantCareScheduleScreen> {
  TimeOfDay wateringTime = TimeOfDay(hour: 8, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Plant Care Schedule",
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Set your plant care reminders (e.g., watering, fertilizing)",
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.alarm, color: Colors.green.shade600),
              title: Text(
                "Watering Time",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              subtitle: Text(
                "${wateringTime.format(context)}",
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
              ),
              onTap: () async {
                TimeOfDay? selectedTime = await showTimePicker(
                  context: context,
                  initialTime: wateringTime,
                );
                if (selectedTime != null) {
                  setState(() {
                    wateringTime = selectedTime;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle Save Care Schedule
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Care schedule saved!")),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Save Schedule",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
