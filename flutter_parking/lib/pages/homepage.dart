import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../models/location.model.dart';
import 'booked.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: Colors.black,
        color: Colors.white,
        tabBackgroundColor: Colors.white,
        gap: 10,
        onTabChange: (index) {
          setState(() {
            bottomindex = index;
          });
        },
        tabs: const [
          GButton(icon: Icons.location_on, text: 'Near By'),
          GButton(icon: Icons.bookmark_added, text: 'Booked'),
          //  GButton(icon: Icons.search, text: 'Search'),
          GButton(icon: Icons.man_2_rounded, text: 'Profile'),
        ],
      ),
      body: IndexedStack(
        index: bottomindex,
        children: const [
          ModelLocation(),
          selectslot(),
          //    Search(),
          // Register(),
        ],
      ),
    );
  }
}
