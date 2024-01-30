import 'package:flutter/material.dart';

import '../pages/booked.dart';

class ModelLocation extends StatefulWidget {
  const ModelLocation({super.key});

  @override
  State<ModelLocation> createState() => _ModelLocationState();
}

class _ModelLocationState extends State<ModelLocation> {
  static List<Address> addresslist = [
    Address(address: 'Lamachaur, paschimanchal campus', name: 'abc parking'),
    Address(address: 'Lamachaur, GBS', name: 'GBS parking '),
    Address(address: 'New road, Bhatbhatini', name: 'Bhatbatini parking'),
    Address(address: 'chipleydunga, trade mall', name: 'trade mall'),
  ];

  List<Address> display_list = List.from(addresslist);
  void updateList(String value) {
    setState(() {
      display_list = addresslist
          .where((element) =>
              element.address.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        top: true,
        child: Scaffold(
          // appBar: AppBar(
          //   automaticallyImplyLeading: false,
          //   backgroundColor: Colors.black,
          // ),
          body: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) => updateList(value),
                decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none),
                    labelText: 'Search',
                    suffixIcon: const Icon(Icons.search)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                  child: Text(
                'Parking Area',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: display_list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(display_list[index].name),
                      subtitle: Text(display_list[index].address),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return selectslot(
                                locationName: addresslist[index].address,
                                parkingName: addresslist[index].name,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Address {
  String address;
  String name;
  Address({required this.address, required this.name});
}
