// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Parking extends StatelessWidget {
  final int? totalAmount;
  final List<String>? slot;
  final String? parkingName;
  final String? locationName;
  const Parking({
    Key? key,
    this.totalAmount = 0,
    this.parkingName,
    this.locationName,
    this.slot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
                  title: const Text('Parking Name'),
                  subtitle: Text(parkingName ?? ""),
                  // trailing: Icon(Icons.favorite_rounded),
                ),
                // Divider(height: 0),
                ListTile(
                  // leading: CircleAvatar(child: Text('B')),
                  title: const Text('Location'),
                  subtitle: Text(locationName ?? ""),
                  // //    'Longer supporting text to demonstrate how the text wraps and how the leading and trailing widgets are centered vertically with the text.'),
                  // trailing: Icon(Icons.favorite_rounded),
                ),
                ListTile(
                  // leading: CircleAvatar(child: Text('B')),
                  title: const Text('Slots'),
                  subtitle: Wrap(
                    direction: Axis.horizontal,
                    runSpacing: 4,
                    spacing: 4,
                    children: List.generate(
                      slot?.length ?? 0,
                      (index) => FittedBox(
                        child: Text(
                          "${slot?[index]}, ",
                        ),
                      ),
                    ).toList(),
                  ),
                ),
                ListTile(
                  // leading: CircleAvatar(child: Text('B')),
                  title: const Text('Total Price'),
                  subtitle: Text(totalAmount.toString()),
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
              child: const Text(
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
