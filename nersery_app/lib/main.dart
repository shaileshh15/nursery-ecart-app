

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nersery_app/admin/Admin_Page.dart';
import 'package:nersery_app/admin/admin_home_page.dart';
import 'package:nersery_app/admin/admin_login_page.dart';
import 'package:nersery_app/screens/cart_provider.dart';
import 'package:nersery_app/screens/home_page.dart';
import 'package:nersery_app/screens/notification_page.dart';
import 'package:nersery_app/screens/onboarding_screen.dart';
import 'package:nersery_app/screens/privacy_policy_screen.dart';
import 'package:nersery_app/screens/profile_page.dart';
import 'package:nersery_app/screens/wishlist_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), 
      minTextAdapt: true,
      splitScreenMode: true, 
      builder: (context, child) {
        return MaterialApp(
          title: 'Nursery App',
          home: OnboardingScreen(), 
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
        );
      },
    );
  }
}
