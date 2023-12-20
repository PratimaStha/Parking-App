import 'package:flutter/material.dart';

class Parking extends StatefulWidget {
  const Parking({super.key});

  @override
  State<Parking> createState() => _ParkingState();
}

class _ParkingState extends State<Parking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  // leading: CircleAvatar(child: Text('A')),
                  title: Text('Parking Name'),
                  subtitle: Text('ftfj'),
                  // trailing: Icon(Icons.favorite_rounded),
                ),
                // Divider(height: 0),
                ListTile(
                  // leading: CircleAvatar(child: Text('B')),
                  title: Text('Location'),
                  subtitle: Text("yuftufjg"),
                  // //    'Longer supporting text to demonstrate how the text wraps and how the leading and trailing widgets are centered vertically with the text.'),
                  // trailing: Icon(Icons.favorite_rounded),
                ),
                ListTile(
                  // leading: CircleAvatar(child: Text('B')),
                  title: Text('Slots'),
                  subtitle: Text("1 3 4"),
                ),
                ListTile(
                  // leading: CircleAvatar(child: Text('B')),
                  title: Text('Total Price'),
                  subtitle: Text("500"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ), // background

              onPressed: () {},
              child: Text(
                "Payment through khalti",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      // SizedBox(height: 10),

      // SizedBox(
      //   height: 10
      // ),
    );
  }
}
