import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:nersery_app/screens/NotificationsSettingsScreen.dart';
import 'package:nersery_app/screens/privacy_policy_screen.dart';
import 'package:nersery_app/screens/supportFaqScreen.dart';
import 'package:nersery_app/screens/terms&conditions.dart';
import 'package:nersery_app/screens/about_screen.dart';  
import 'package:url_launcher/url_launcher.dart';  

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  User? user;
  String profileImageUrl = "";
  String userEmail = "Loading...";
  bool isLoading = true;
  String userName = "";

  
  final String privacyPolicyUrl = 'https://yourwebsite.com/privacy-policy'; // Replace with actual URL

  @override
  void initState() {
    super.initState();
    _initializeUser();
  }

  Future<void> _initializeUser() async {
    user = _auth.currentUser;
    if (user == null) {
      debugPrint("No user is signed in.");
      setState(() {
        isLoading = false;
      });
      return;
    }
    await _createUserDataIfNotExists();
    await _loadUserData();
  }

  Future<void> _createUserDataIfNotExists() async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection("users").doc(user!.uid).get();

      if (!userDoc.exists) {
        debugPrint("Creating new user document...");
        await _firestore.collection("users").doc(user!.uid).set({
          "email": user!.email ?? "No Email",
          "profileImage": "",
        });
      }
    } catch (e) {
      debugPrint("Error creating user data: $e");
    }
  }

  Future<void> _loadUserData() async {
    try {
      if (user == null) return;

      DocumentSnapshot userData =
          await _firestore.collection("users").doc(user!.uid).get();

      if (!userData.exists) {
        debugPrint("User document does not exist.");
        return;
      }

      debugPrint("Fetched user data: ${userData.data()}");

      setState(() {
        userName = user?.displayName ?? "";
        userEmail = user!.email ?? "No Email";
        profileImageUrl = userData.get("profileImage") ?? "";
        isLoading = false;
      });
    } catch (e) {
      debugPrint("Error loading user data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _pickAndUploadImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() => isLoading = true);
      File imageFile = File(pickedFile.path);

      try {
        // Upload the image to Firebase Storage
        Reference ref = _storage.ref().child("profile_pictures/${user!.uid}");
        UploadTask uploadTask = ref.putFile(imageFile);
        TaskSnapshot taskSnapshot = await uploadTask;

        // Get the download URL for the uploaded image
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();

        // Store the image URL in Firestore
        await _firestore.collection("users").doc(user!.uid).set(
          {"profileImage": downloadUrl},
          SetOptions(merge: true),
        );

        // Update the UI with the new image URL
        setState(() {
          profileImageUrl = downloadUrl;
          isLoading = false;
        });
      } catch (e) {
        setState(() => isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Image upload failed")));
      }
    }
  }

  // Function to open Privacy Policy URL
  Future<void> _launchPrivacyPolicy() async {
    if (await canLaunch(privacyPolicyUrl)) {
      await launch(privacyPolicyUrl);
    } else {
      throw 'Could not open the privacy policy page';
    }
  }

  Future<void> _logout() async {
    await _auth.signOut();
    Navigator.pushReplacementNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          userName.isEmpty ? "Profile" : userName,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey[100],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Profile Picture Section
                Center(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.grey[300],
                            backgroundImage: profileImageUrl.isNotEmpty
                                ? NetworkImage(profileImageUrl)
                                : const AssetImage("assets/images/placeholder.jpg") as ImageProvider,
                          ),
                          GestureDetector(
                            onTap: _pickAndUploadImage,
                            child: const CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.blueAccent,
                              child: Icon(Icons.camera_alt, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // User Email
                      Text(
                        userEmail,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 18, color: Colors.black54),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),

                // Profile Name Section
                if (userName.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      userName,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                const SizedBox(height: 20),

                // Profile Options Cards
                _buildOptionCard(
                  Icons.help_outline,
                  "Support / FAQ",
                  "Get help and view frequently asked questions",
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SupportFaqScreen()),
                  ),
                ),
                const SizedBox(height: 15),
                _buildOptionCard(
                  Icons.info_outline,
                  "About",
                  "Learn more about the app",
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutScreen()),
                  ),
                ),
                const SizedBox(height: 15),
                _buildOptionCard(
                  Icons.notifications,
                  "Notifications Settings",
                  "Customize your notification preferences",
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotificationsSettingsScreen()),
                  ),
                ),
                const SizedBox(height: 15),
                _buildOptionCard(
                  Icons.gavel,
                  "Terms & Conditions",
                  "View the legal terms and conditions",
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TermsConditionsScreen()),
                  ),
                ),
                const SizedBox(height: 15),
               
                _buildOptionCard(
                  Icons.notifications,
                  "Privacy Policy",
                  "Learn how we protect your privacy",
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()),
                  ),
                ),
                const SizedBox(height: 30),

                // Logout Button
                ElevatedButton(
                  onPressed: _logout,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    minimumSize: Size(constraints.maxWidth * 0.7, 50),
                  ),
                  child: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOptionCard(
      IconData icon, String title, String subtitle, VoidCallback? onTap) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black54),
        title: Text(
          title,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.black45),
        ),
        onTap: onTap,
      ),
    );
  }
}
