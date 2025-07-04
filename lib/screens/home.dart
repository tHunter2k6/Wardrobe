import 'package:flutter/material.dart';
import 'package:wardrobe/screens/home_screen.dart';
import 'package:wardrobe/screens/create_outfit_screen.dart';
import 'package:wardrobe/screens/outfits_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

List<Widget> homeScreenItems = [
  HomeScreen(),
  //
  Outfits(),
  //
  MyOutfits(),
];

class HomeState extends State<Home> {
  //
  int _selectedIndex = 0;
  void pageNavigator(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeScreenItems[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 10.0,
          ),
          child: GNav(
            backgroundColor: Colors.grey.shade100,
            color: Colors.grey.shade600,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.grey.shade300,
            padding: const EdgeInsets.all(16),
            gap: 8,
            onTabChange: pageNavigator,
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.create,
                text: "Create",
              ),
              GButton(
                icon: Icons.crop_square_rounded,
                text: "Outfits",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
