
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import for Font Awesome icons

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "About",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.greenAccent,
        elevation: 4,
      ),
      body: LayoutBuilder(builder: (BuildContext context , BoxConstraints constraints){
         return SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
      
            // Title - About the App
            Text(
              "About the App",
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
      
            // Description of the App
            Text(
              "This app is designed to make your gardening experience easier and more enjoyable. Whether you’re a seasoned plant parent or just starting your plant journey, we offer tools to help you grow healthy and happy plants. From reminders for watering and fertilizing to easy cataloging of your plant collection, our app simplifies plant care.",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black54,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
      
            // Additional Features
            Text(
              "Features:",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            _buildFeatureCard("Plant Care Reminders", "Set custom reminders to take care of your plants like watering, fertilizing, and more."),
            _buildFeatureCard("Catalog Your Plants", "Keep track of all your plants with their details, care schedules, and growth milestones."),
            _buildFeatureCard("Plant Purchase & Order", "Explore a variety of plants available for purchase and have them delivered to your doorstep."),
            _buildFeatureCard("Community Support", "Connect with other plant lovers, share tips, and get expert advice."),
            const SizedBox(height: 20),
      
            // Developed By Section
            Text(
              "Developed by:",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "GreenThumb Innovations",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Version: 1.0.0",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
      
            // Contact Information Section
            Text(
              "Contact Us:",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Email: GreenThumbInnovations.com",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Phone: +1 234 567 890",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
      
            // Social Media Links Section (Optional)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialMediaIcon(FontAwesomeIcons.facebook, "https://facebook.com"),
                const SizedBox(width: 20),
                _buildSocialMediaIcon(FontAwesomeIcons.instagram, "https://instagram.com"),
                const SizedBox(width: 20),
                _buildSocialMediaIcon(FontAwesomeIcons.twitter, "https://twitter.com"),
              ],
            ),
            const SizedBox(height: 20),
      
            // Privacy Policy Button
            Center(
              child: TextButton(
                onPressed: () {
                  // Navigate to the Privacy Policy or Terms & Conditions screen
                  Navigator.pushNamed(context, '/privacy_policy');
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(
                  "Privacy Policy",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
      }
    )
    );
  }

  // Method to create a Feature Card
  Widget _buildFeatureCard(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build social media icons
  Widget _buildSocialMediaIcon(IconData icon, String url) {
    return IconButton(
      icon: FaIcon(icon, size: 30, color: Colors.greenAccent), // Using FaIcon to display Font Awesome icons
      onPressed: () {
        // You can add functionality to open the social media URLs
        print("Opening $url");
      },
    );
  }
}



