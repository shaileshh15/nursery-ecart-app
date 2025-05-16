
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:nersery_app/screens/contact_support.dart';

// class SupportFaqScreen extends StatefulWidget {
//   const SupportFaqScreen({Key? key}) : super(key: key);

//   @override
//   _SupportFaqScreenState createState() => _SupportFaqScreenState();
// }

// class _SupportFaqScreenState extends State<SupportFaqScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final List<Map<String, String>> _messages = [];

//   // Simulate a basic AI chatbot response
//   void _sendMessage() {
//     final userMessage = _controller.text;
//     if (userMessage.isEmpty) return;

//     setState(() {
//       _messages.add({
//         'sender': 'user',
//         'message': userMessage,
//       });

//       // Simulate AI response
//       _messages.add({
//         'sender': 'bot',
//         'message': _getBotResponse(userMessage),
//       });
//     });

//     _controller.clear();
//   }

//   String _getBotResponse(String userMessage) {
//     if (userMessage.contains('plant care')) {
//       return 'To take care of your plant, ensure it gets enough sunlight, water regularly, and use the right soil.';
//     } else if (userMessage.contains('unhealthy plant')) {
//       return 'Check if your plant is receiving the right amount of water, sunlight, and check for pests.';
//     } else {
//       return 'I\'m sorry, I didn\'t quite understand that. Please try asking something else.';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Support / FAQ",
//           style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.greenAccent, // Green for nature
//         elevation: 4,
//       ),
//       body: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//           return SingleChildScrollView(  // Makes the whole body scrollable
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Title Section for FAQ
//                 Text(
//                   "Frequently Asked Questions",
//                   style: GoogleFonts.poppins(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 // FAQ list
//                 ListTile(
//                   title: Text("How do I take care of my plants?", style: GoogleFonts.poppins(fontSize: 18)),
//                   subtitle: Text(
//                     "Here are some general care tips: Water regularly, ensure proper sunlight, and use appropriate soil.",
//                     style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
//                   ),
//                 ),
//                 ListTile(
//                   title: Text("What should I do if my plant looks unhealthy?", style: GoogleFonts.poppins(fontSize: 18)),
//                   subtitle: Text(
//                     "Check for water levels, sunlight, and pests. If the problem persists, contact support.",
//                     style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 // Chatbot UI - ListView for chat messages
//                 Container(
//                   constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.5),  // Limiting max height for chatbot section
//                   child: ListView.builder(
//                     shrinkWrap: true,  // Ensures ListView takes only the space it needs
//                     itemCount: _messages.length,
//                     itemBuilder: (context, index) {
//                       final message = _messages[index];
//                       return Align(
//                         alignment: message['sender'] == 'user'
//                             ? Alignment.centerRight
//                             : Alignment.centerLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8.0),
//                           child: Container(
//                             padding: const EdgeInsets.all(12.0),
//                             decoration: BoxDecoration(
//                               color: message['sender'] == 'user'
//                                   ? Colors.greenAccent
//                                   : Colors.grey[200],
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                             child: Text(
//                               message['message']!,
//                               style: GoogleFonts.poppins(fontSize: 16),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),

//                 const SizedBox(height: 16), // Add some space between chat and input

//                 // Input field to send messages
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 16.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextField(
//                           controller: _controller,
//                           decoration: InputDecoration(
//                             hintText: 'Ask me something...',
//                             hintStyle: GoogleFonts.poppins(fontSize: 16),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.send, color: Colors.greenAccent),
//                         onPressed: _sendMessage,
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Center the "Contact Support" button at the bottom
//                 Center(
//                   child: Padding(
//                     padding: const EdgeInsets.only(bottom: 16.0),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Navigate to Contact Support screen
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const ContactSupportScreen()),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.greenAccent,
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                       ),
//                       child: Text("Contact Support", style: GoogleFonts.poppins(color: Colors.white)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportFaqScreen extends StatefulWidget {
  const SupportFaqScreen({Key? key}) : super(key: key);

  @override
  _SupportFaqScreenState createState() => _SupportFaqScreenState();
}

class _SupportFaqScreenState extends State<SupportFaqScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  void _sendMessage() {
    final userMessage = _controller.text;
    if (userMessage.isEmpty) return;

    setState(() {
      _messages.add({
        'sender': 'user',
        'message': userMessage,
      });

      _messages.add({
        'sender': 'bot',
        'message': _getBotResponse(userMessage),
      });
    });

    _controller.clear();
  }

  String _getBotResponse(String userMessage) {
    if (userMessage.contains('plant care')) {
      return 'To take care of your plant, ensure it gets enough sunlight, water regularly, and use the right soil.';
    } else if (userMessage.contains('unhealthy plant')) {
      return 'Check if your plant is receiving the right amount of water, sunlight, and check for pests.';
    } else {
      return 'I\'m sorry, I didn\'t quite understand that. Please try asking something else.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Support / FAQ",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.greenAccent,
        elevation: 4,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Frequently Asked Questions",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  title: Text("How do I take care of my plants?", style: GoogleFonts.poppins(fontSize: 18)),
                  subtitle: Text(
                    "Here are some general care tips: Water regularly, ensure proper sunlight, and use appropriate soil.",
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
                  ),
                ),
                ListTile(
                  title: Text("What should I do if my plant looks unhealthy?", style: GoogleFonts.poppins(fontSize: 18)),
                  subtitle: Text(
                    "Check for water levels, sunlight, and pests. If the problem persists, contact support.",
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.5),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      return Align(
                        alignment: message['sender'] == 'user'
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: message['sender'] == 'user'
                                  ? Colors.greenAccent
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              message['message']!,
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'Ask me something...',
                            hintStyle: GoogleFonts.poppins(fontSize: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send, color: Colors.greenAccent),
                        onPressed: _sendMessage,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
