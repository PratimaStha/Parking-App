//import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:flutter_parking/pages/profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_parking/pages/search.dart';

import '../models/location.model.dart';
import 'booked.dart';
//import 'location.dart';

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
          //  print(Location());
          //Console.log('location.dart');
          //  print(index);
        },
        tabs: [
          GButton(icon: Icons.location_on, text: 'Near By'),
          GButton(icon: Icons.bookmark_added, text: 'Booked'),
          //  GButton(icon: Icons.search, text: 'Search'),
          GButton(icon: Icons.man_2_rounded, text: 'Profile'),
        ],
      ),
      body: IndexedStack(
        index: bottomindex,
        children: [
          ModelLocation(),
          selectslot(),
          //    Search(),
          // Register(),
        ],
      ),
    );
  }
}
