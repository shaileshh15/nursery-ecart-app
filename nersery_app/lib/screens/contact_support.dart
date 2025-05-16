

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactSupportScreen extends StatefulWidget {
  const ContactSupportScreen({Key? key}) : super(key: key);

  @override
  _ContactSupportScreenState createState() => _ContactSupportScreenState();
}

class _ContactSupportScreenState extends State<ContactSupportScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Contact Support",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;

            return Form(
              key: _formKey,
              child: ListView(
                children: [
                  _buildResponsiveTextField(
                    controller: _nameController,
                    label: "Your Name",
                    hint: "Enter your full name",
                    icon: Icons.person,
                    isEmail: false,
                    screenWidth: screenWidth,
                  ),
                  const SizedBox(height: 16),

                  _buildResponsiveTextField(
                    controller: _emailController,
                    label: "Your Email",
                    hint: "Enter your email address",
                    icon: Icons.email,
                    isEmail: true,
                    screenWidth: screenWidth,
                  ),
                  const SizedBox(height: 16),

                  _buildResponsiveTextField(
                    controller: _messageController,
                    label: "Message",
                    hint: "Enter your message or issue",
                    icon: Icons.message,
                    isEmail: false,
                    screenWidth: screenWidth,
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20),

                  _buildSubmitButton(screenWidth),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildResponsiveTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required bool isEmail,
    required double screenWidth,
    int maxLines = 1,
  }) {
    double fieldWidth = screenWidth > 600 ? screenWidth * 0.5 : screenWidth;

    return Container(
      width: fieldWidth,
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: const TextStyle(color: Colors.black),
          hintStyle: const TextStyle(color: Colors.black54),
          prefixIcon: Icon(icon, color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter your $label";
          }
          if (isEmail && !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
            return "Please enter a valid email address";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildSubmitButton(double screenWidth) {
    double buttonWidth = screenWidth > 600 ? screenWidth * 0.5 : screenWidth;

    return Container(
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState?.validate() ?? false) {
            await _submitForm();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Your message has been sent")),
            );
            _nameController.clear();
            _emailController.clear();
            _messageController.clear();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text("Send Message", style: GoogleFonts.poppins(color: Colors.white)),
      ),
    );
  }

  Future<void> _submitForm() async {
    try {
      await _firestore.collection('support_messages').add({
        'name': _nameController.text,
        'email': _emailController.text,
        'message': _messageController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error sending message: $e")),
      );
    }
  }
}
