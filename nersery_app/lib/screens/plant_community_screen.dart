

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlantCommunityPage extends StatefulWidget {
  const PlantCommunityPage({super.key});

  @override
  _PlantCommunityPageState createState() => _PlantCommunityPageState();
}

class _PlantCommunityPageState extends State<PlantCommunityPage> {
  final CollectionReference postsCollection = FirebaseFirestore.instance.collection('posts');

  Future<void> _addPost(String username, String plant, String caption, File? imageFile) async {
    String imageUrl = '';
    
    if (imageFile != null) {
      final storageRef = FirebaseStorage.instance.ref().child('plant_images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      await storageRef.putFile(imageFile);
      imageUrl = await storageRef.getDownloadURL();
    }

    await postsCollection.add({
      'username': username.isNotEmpty ? username : 'Anonymous',
      'plant': plant.isNotEmpty ? plant : 'Unknown Plant',
      'caption': caption,
      'image': imageUrl.isNotEmpty ? imageUrl : 'assets/images/placeholder.jpg',
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  void _showAddPostDialog() {
    String username = '';
    String plant = '';
    String caption = '';
    File? imageFile;

    Future<void> pickImage() async {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
      }
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Create a New Post', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) => username = value,
                decoration: const InputDecoration(hintText: 'Enter your username'),
              ),
              TextField(
                onChanged: (value) => plant = value,
                decoration: const InputDecoration(hintText: 'Enter plant name'),
              ),
              TextField(
                onChanged: (value) => caption = value,
                decoration: const InputDecoration(hintText: 'Write a caption'),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: pickImage,
                icon: const Icon(Icons.image),
                label: Text('Pick Image', style: GoogleFonts.poppins()),
              ),
              if (imageFile != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(imageFile!, height: 100, fit: BoxFit.cover),
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: GoogleFonts.poppins(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              _addPost(username, plant, caption, imageFile);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: Text('Post', style: GoogleFonts.poppins(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Plant Community',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: StreamBuilder(
        stream: postsCollection.orderBy('timestamp', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final posts = snapshot.data!.docs;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index].data() as Map<String, dynamic>;
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: const CircleAvatar(backgroundColor: Colors.green),
                      title: Text(post['username'], style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                      subtitle: Text(post['plant'], style: GoogleFonts.poppins(color: Colors.grey)),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: post['image'].startsWith('http')
                          ? Image.network(post['image'], height: 200, width: double.infinity, fit: BoxFit.cover)
                          : Image.asset(post['image'], height: 200, width: double.infinity, fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        post['caption'],
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddPostDialog,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
