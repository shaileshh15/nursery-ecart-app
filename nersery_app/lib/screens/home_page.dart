import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nersery_app/models/plants.dart';
import 'package:nersery_app/screens/Login_page.dart';
import 'package:nersery_app/screens/contact_support.dart';
import 'package:nersery_app/screens/detail_page.dart';
import 'package:nersery_app/screens/plant_community_screen.dart';
import 'package:nersery_app/screens/notification_page.dart';
import 'package:nersery_app/screens/profile_page.dart';
import 'package:nersery_app/screens/cart_page.dart';
import 'package:nersery_app/screens/wishlist_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();

  int selectedIndex = 0;
  int bottomNavIndex = 0;

  List<Plant> _plantList = Plant.plantList;
  List<Plant> filteredPlantList = [];
  List<String> _plantTypes = [
    'Recommended',
    'Indoor',
    'Outdoor',
    'Garden',
    'Supplement'
  ];

  @override
  void initState() {
    super.initState();
    filteredPlantList = _plantList;
    _searchController.addListener(_searchPlants);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void filterPlants(String category) {
    setState(() {
      List<Plant> categoryFiltered = category == 'Recommended'
          ? _plantList
          : _plantList
              .where((plant) =>
                  plant.category.toLowerCase() == category.toLowerCase())
              .toList();

      String query = _searchController.text.toLowerCase();
      filteredPlantList = query.isEmpty
          ? categoryFiltered
          : categoryFiltered
              .where((plant) => plant.plantName.toLowerCase().contains(query))
              .toList();
    });
  }

  void _searchPlants() {
    filterPlants(_plantTypes[selectedIndex]);
  }

  void _navigateToPage(int index) {
    if (index == bottomNavIndex) return;

    switch (index) {
      case 0:
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade, child: const HomePage()));
        break;
      case 1:
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade, child: const WishlistPage()));
        break;
      case 2:
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade, child: const CartPage()));
        break;
      case 3:
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade, child: ProfilePage()));
        break;
    }

    setState(() {
      bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.green, Colors.teal],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'BloomBuddy',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 6,
        shadowColor: Colors.grey.withOpacity(0.3),
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.menu, size: 28),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications,
                size: 28, color: Colors.blueAccent),
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: NotificationsPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.local_florist, color: Colors.teal),
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: PlantCommunityPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Profile Header with animation
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: 400,
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(milliseconds: 800),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white, // White border
                          width: 3.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor:
                            Colors.white, // Background color for padding effect
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/placeholder2.jpg",
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Welcome, John Doe",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Gardener Enthusiast",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // Use Expanded here to make the drawer scrollable
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // Drawer Menu Items with smooth transitions
                  ListTile(
                    leading: const Icon(Icons.home, color: Colors.green),
                    title: Text(
                      'Home',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const HomePage()),
                      );
                    },
                  ),
                  _buildDivider(),

                  ListTile(
                    leading: const Icon(Icons.favorite, color: Colors.red),
                    title: Text(
                      'Wishlist',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const WishlistPage()),
                      );
                    },
                  ),
                  _buildDivider(),

                  ListTile(
                    leading:
                        const Icon(Icons.shopping_cart, color: Colors.orange),
                    title: Text(
                      'Cart',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: const CartPage()),
                      );
                    },
                  ),
                  _buildDivider(),

                  ListTile(
                    leading:
                        const Icon(Icons.notifications, color: Colors.blue),
                    title: Text(
                      'Notifications',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: NotificationsPage()),
                      );
                    },
                  ),
                  _buildDivider(),

                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.purple),
                    title: Text(
                      'Profile',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: ProfilePage()),
                      );
                    },
                  ),
                  _buildDivider(),

                  // Log out option
                  ListTile(
                    leading: const Icon(Icons.exit_to_app, color: Colors.grey),
                    title: Text(
                      'Logout',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                   
                    onTap: () async {
  await FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(
    context,
    PageTransition(
      type: PageTransitionType.fade,
      child: const SignIn (), // Or SignupPage
    ),
  );
},

                  ),
                  _buildDivider(),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      const BoxShadow(color: Colors.black12, blurRadius: 4)
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search Plants...',
                      hintStyle: GoogleFonts.poppins(color: Colors.black45),
                      prefixIcon:
                          const Icon(Icons.search, color: Colors.black54),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _plantTypes.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            filterPlants(_plantTypes[index]);
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? Colors.black
                                : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: selectedIndex == index
                                ? [
                                    const BoxShadow(
                                        color: Colors.black26, blurRadius: 5)
                                  ]
                                : [],
                          ),
                          child: Center(
                            child: Text(
                              _plantTypes[index],
                              style: GoogleFonts.poppins(
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.only(bottom: 20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: filteredPlantList.length,
                    itemBuilder: (context, index) {
                      final plant = filteredPlantList[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: DetailPage(plant: plant),
                              type: PageTransitionType.bottomToTop,
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                16), // Add circular border radius
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            // ClipRRect ensures the image follows the border radius
                            borderRadius: BorderRadius.circular(16),
                            child: Column(
                              children: [
                                Image.asset(
                                  plant.imageURL,
                                  height: 140,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    plant.plantName,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.white,
        items: const [
          Icon(Icons.home),
          Icon(Icons.favorite),
          Icon(Icons.shopping_cart),
          Icon(Icons.person)
        ],
        onTap: _navigateToPage,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: const ContactSupportScreen(),
            ),
          );
        },
        backgroundColor: Colors.black, // Black background
        child:
            const Icon(Icons.support_agent, color: Colors.white), // White icon
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: Colors.grey,
      thickness: 0.5,
    );
  }
}
