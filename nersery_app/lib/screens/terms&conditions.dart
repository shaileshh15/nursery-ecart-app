
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Terms & Conditions",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.greenAccent,
        elevation: 4,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
        
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          
          double fontSizeTitle = screenWidth > 600 ? 30 : 24;
          double fontSizeContent = screenWidth > 600 ? 18 : 16;

          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Terms & Conditions",
                  style: GoogleFonts.poppins(
                    fontSize: fontSizeTitle,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "By using this app, you agree to our terms and conditions. Please read them carefully before using the app.",
                  style: GoogleFonts.poppins(fontSize: fontSizeContent, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                _buildSection("1. Acceptance of Terms", fontSizeContent),
                _buildSection(
                  "By using this app, you agree to abide by the terms and conditions set forth by the company. If you do not agree, please refrain from using this app.",
                  fontSizeContent,
                ),
                const SizedBox(height: 20),
                _buildSection("2. User Responsibilities", fontSizeContent),
                _buildSection(
                  "As a user, you are responsible for the content you post, the actions you take while using the app, and complying with applicable laws and regulations.",
                  fontSizeContent,
                ),
                const SizedBox(height: 20),
                _buildSection("3. Usage Restrictions", fontSizeContent),
                _buildSection(
                  "You are prohibited from using the app for illegal purposes, spamming, or engaging in activities that harm the app’s infrastructure or other users.",
                  fontSizeContent,
                ),
                const SizedBox(height: 20),
                _buildSection("4. Termination of Service", fontSizeContent),
                _buildSection(
                  "We reserve the right to suspend or terminate your account if you violate our terms and conditions or engage in harmful activities.",
                  fontSizeContent,
                ),
                const SizedBox(height: 20),
                _buildSection("5. Limitation of Liability", fontSizeContent),
                _buildSection(
                  "The app and its services are provided as-is, and we do not take responsibility for any direct or indirect damages arising from the use of the app.",
                  fontSizeContent,
                ),
                const SizedBox(height: 20),
                _buildSection("6. Changes to Terms", fontSizeContent),
                _buildSection(
                  "We reserve the right to update or modify these terms and conditions at any time. Users will be notified of significant changes.",
                  fontSizeContent,
                ),
                const SizedBox(height: 20),

           
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                       
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text("Accept", style: GoogleFonts.poppins(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  
  Widget _buildSection(String title, double fontSizeContent) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: fontSizeContent,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}
