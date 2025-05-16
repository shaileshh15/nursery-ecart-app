// // root_page.dart
// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:nersery_app/constants.dart';
// import 'package:nersery_app/models/plants.dart';
// import 'package:nersery_app/screens/cart_page.dart';
// import 'package:nersery_app/screens/favorite_page.dart';
// import 'package:nersery_app/screens/home_page.dart';
// import 'package:nersery_app/screens/profile_page.dart';
// import 'package:nersery_app/screens/scan_page.dart';

// import 'package:page_transition/page_transition.dart';

// class RootPage extends StatefulWidget {
//   const RootPage({Key? key}) : super(key: key);

//   @override
//   State<RootPage> createState() => _RootPageState();
// }

// class _RootPageState extends State<RootPage> {
//   List<Plant> favorites = [];
//   List<Plant> myCart = [];

//   int _bottomNavIndex = 0;

//   //List of the pages
//   List<Widget> _widgetOptions() {
//     return [
//       const HomePage(),
//       FavoritePage(favoritedPlants: favorites),
//       CartPage(addedToCartPlants: myCart),
//       const ProfilePage(),
//     ];
//   }

//   //List of the pages icons
//   List<IconData> iconList = [
//     Icons.home,
//     Icons.favorite,
//     Icons.shopping_cart,
//     Icons.person,
//   ];

//   //List of the pages titles
//   List<String> titleList = [
//     'Home',
//     'Favorite',
//     'Cart',
//     'Profile',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               titleList[_bottomNavIndex],
//               style: TextStyle(
//                 color: Constants.blackColor,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 24,
//               ),
//             ),
//             Icon(
//               Icons.notifications,
//               color: Constants.blackColor,
//               size: 30.0,
//             ),
//           ],
//         ),
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         elevation: 0.0,
//       ),
//       body: IndexedStack(
//         index: _bottomNavIndex,
//         children: _widgetOptions(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//               context,
//               PageTransition(
//                   child: const ScanPage(), type: PageTransitionType.bottomToTop));
//         },
//         child: Image.asset(
//           'assets/images/code-scan-two.png',
//           height: 30.0,
//         ),
//         backgroundColor: Constants.primaryColor,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: AnimatedBottomNavigationBar(
//         splashColor: Constants.primaryColor,
//         activeColor: Constants.primaryColor,
//         inactiveColor: Colors.black.withOpacity(.5),
//         icons: iconList,
//         activeIndex: _bottomNavIndex,
//         gapLocation: GapLocation.center,
//         notchSmoothness: NotchSmoothness.softEdge,
//         onTap: (index) {
//           setState(() {
//             _bottomNavIndex = index;
//             favorites = Plant.getFavoritedPlants();
//             myCart = Plant.addedToCartPlants();
//           });
//         },
//       ),
//     );
//   }
// }
