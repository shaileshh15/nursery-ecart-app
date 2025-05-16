
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nersery_app/screens/home_page.dart'; // Import the HomePage

class NotificationsPage extends StatefulWidget {
  NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<Map<String, String>> notifications = [
    {"message": "Your plant needs watering! 🌱", "time": "2023-10-01", "status": "unread"},
    {"message": "A new collection is available! 🌿", "time": "2023-10-05", "status": "read"},
    {"message": "Flash sale on garden plants! 🏷️", "time": "2023-09-28", "status": "unread"},
    {"message": "Check out our best sellers! 🌵", "time": "2023-09-15", "status": "read"},
    {"message": "Exclusive discount for you! 🎉", "time": "2023-08-22", "status": "read"},
    {"message": "New tips on plant care have been added! 🌼", "time": "2023-08-15", "status": "unread"},
    {"message": "Join our gardening workshop next Saturday! 🌻", "time": "2023-07-30", "status": "read"},
    {"message": "Your order has been shipped! 📦", "time": "2023-07-10", "status": "read"},
    {"message": "Don't miss our upcoming sale! 🏷️", "time": "2023-06-01", "status": "unread"},
    {"message": "Your feedback is important to us! 📝", "time": "2023-05-20", "status": "read"},
  ];

  // Function to toggle read/unread status
  void toggleReadStatus(int index) {
    setState(() {
      notifications[index]['status'] = notifications[index]['status'] == 'unread' ? 'read' : 'unread';
    });
  }

  // Function to delete a notification
  void deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  // Function to dismiss all notifications
  void dismissAll() {
    setState(() {
      notifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List<Map<String, String>>> groupedNotifications = {};

    // Group notifications by date
    for (var notification in notifications) {
      String date = notification['time']!.substring(0, 10);
      if (!groupedNotifications.containsKey(date)) {
        groupedNotifications[date] = [];
      }
      groupedNotifications[date]?.add(notification);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Default back button
          onPressed: () {
            // Navigate to the HomePage when the back button is pressed
           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
            return HomePage();

           }));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever, color: Colors.red),
            onPressed: dismissAll, // Dismiss all notifications
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: groupedNotifications.keys.map((date) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    date,
                    style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                ...groupedNotifications[date]!.map((notification) {
                  int index = notifications.indexOf(notification);
                  bool isUnread = notification['status'] == 'unread';

                  return Dismissible(
                    key: Key(notification['message']!),
                    background: Container(color: Colors.red),
                    onDismissed: (_) {
                      deleteNotification(index);
                    },
                    child: GestureDetector(
                      onTap: () => toggleReadStatus(index),
                      child: Card(
                        elevation: 3,
                        margin: const EdgeInsets.only(bottom: 10),
                        color: isUnread ? Colors.yellow.shade100 : Colors.white,
                        child: ListTile(
                          leading: Icon(
                            Icons.notifications,
                            color: isUnread ? Colors.green : Colors.grey,
                          ),
                          title: Text(
                            notification['message']!,
                            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            "Received: ${notification['time']}",
                            style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                          ),
                          trailing: Wrap(
                            spacing: 10.0,
                            children: [
                              // Mark as read/unread button
                              IconButton(
                                icon: Icon(
                                  isUnread ? Icons.mark_email_read : Icons.mark_email_unread,
                                  color: Colors.blue,
                                ),
                                onPressed: () => toggleReadStatus(index),
                              ),
                              // Action button to "View More"
                              IconButton(
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  // You can navigate to a detailed view here
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Viewing details for: ${notification['message']}")),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
