// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class PrivacyPolicyScreen extends StatelessWidget {
//   const PrivacyPolicyScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'Privacy Policy',
//           style: GoogleFonts.poppins(
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.blueAccent,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       backgroundColor: Colors.grey[100],
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Title Section
//             Text(
//               'Introduction',
//               style: GoogleFonts.poppins(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'This privacy policy outlines how we collect, use, and protect your information when using our app.',
//               style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
//             ),
//             const SizedBox(height: 20),

//             // Section 1: Data Collection
//             Text(
//               '1. Data Collection',
//               style: GoogleFonts.poppins(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'We collect personal information such as your name, email, and profile picture when you register and use the app. We may also collect non-personal information like your usage behavior for improving the app.',
//               style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
//             ),
//             const SizedBox(height: 20),

//             // Section 2: Data Usage
//             Text(
//               '2. Data Usage',
//               style: GoogleFonts.poppins(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'The information we collect is used to improve the user experience, provide customer support, and notify you about updates and changes to our app.',
//               style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
//             ),
//             const SizedBox(height: 20),

//             // Section 3: Data Protection
//             Text(
//               '3. Data Protection',
//               style: GoogleFonts.poppins(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'We implement reasonable security measures to protect your personal information. However, please note that no method of electronic transmission is 100% secure.',
//               style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
//             ),
//             const SizedBox(height: 20),

//             // Section 4: Cookies
//             Text(
//               '4. Cookies',
//               style: GoogleFonts.poppins(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'We may use cookies to enhance your experience while using the app. These cookies help us remember your preferences and improve app performance.',
//               style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
//             ),
//             const SizedBox(height: 20),

//             // Section 5: Changes to the Privacy Policy
//             Text(
//               '5. Changes to the Privacy Policy',
//               style: GoogleFonts.poppins(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'We may update this privacy policy from time to time. We will notify users of any significant changes through the app or via email.',
//               style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
//             ),
//             const SizedBox(height: 20),

//             // Section 6: Contact Information
//             Text(
//               '6. Contact Information',
//               style: GoogleFonts.poppins(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'If you have any questions or concerns about this privacy policy, please contact us at support@yourapp.com.',
//               style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
//             ),
//             const SizedBox(height: 30),

//             // Footer Section
//             Center(
//               child: Text(
//                 'Last updated: January 2025',
//                 style: GoogleFonts.poppins(
//                   fontSize: 14,
//                   color: Colors.black38,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Privacy Policy',
         
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor:Colors.greenAccent, // Pastel blue
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Text(
              'Introduction',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'This privacy policy outlines how we collect, use, and protect your information when using our app.',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // Section 1: Data Collection
            Text(
              '1. Data Collection',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'We collect personal information such as your name, email, and profile picture when you register and use the app. We may also collect non-personal information like your usage behavior for improving the app.',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // Section 2: Data Usage
            Text(
              '2. Data Usage',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'The information we collect is used to improve the user experience, provide customer support, and notify you about updates and changes to our app.',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // Section 3: Data Protection
            Text(
              '3. Data Protection',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'We implement reasonable security measures to protect your personal information. However, please note that no method of electronic transmission is 100% secure.',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // Section 4: Cookies
            Text(
              '4. Cookies',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'We may use cookies to enhance your experience while using the app. These cookies help us remember your preferences and improve app performance.',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // Section 5: Changes to the Privacy Policy
            Text(
              '5. Changes to the Privacy Policy',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'We may update this privacy policy from time to time. We will notify users of any significant changes through the app or via email.',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // Section 6: Contact Information
            Text(
              '6. Contact Information',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'If you have any questions or concerns about this privacy policy, please contact us at support@yourapp.com.',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 30),

            // Footer Section
            Center(
              child: Text(
                'Last updated: January 2025',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black38,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
