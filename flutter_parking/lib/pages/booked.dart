import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_parking/pages/payment.dart';

class selectslot extends StatefulWidget {
  const selectslot({super.key});

  @override
  State<selectslot> createState() => _selectslotState();
}

class _selectslotState extends State<selectslot> {
  var countseatleft = 3 * 4;
  //var countSeatCenter = 4 * 10;
  var countseatright = 3 * 4;
  var listSeatLeft = [];
  //var listSeatCenter = [];
  var listSeatRight = [];

  @override
  void initState() {
    initseatvaluetolist(
        isListSeatLeft: true,
        //isListSeatCenter: false,
        isListSeatRight: false,
        count: countseatleft,
        side: "l");
    // initseatvaluetolist(
    //     isListSeatLeft: false,
    //     //isListSeatCenter: true,
    //     isListSeatRight: false,
    //     //count: countSeatCenter,
    //     side: "c");
    initseatvaluetolist(
        isListSeatLeft: false,
        //isListSeatCenter: false,
        isListSeatRight: true,
        count: countseatright,
        side: "r");
    setVisiblitySeat();
    super.initState();
  }

  initseatvaluetolist(
      {bool isListSeatLeft = true,
      bool isListSeatRight = true,
      //bool isListSeatCenter = true,
      count,
      side}) {
    var objectdata;
    for (int i = 0; i < count; i++) {
      objectdata = {
        "id": side + "${i + 1}",
        "isBooked": false,
        "isAvailable": true,
        "isSelected": false,
        "isVisible": true,
      };
      setState(() {
        if (isListSeatLeft) {
          listSeatLeft.add(objectdata);
        }
        // else if (isListSeatCenter) {
        //   listSeatCenter.add(objectdata);
        // }
        else {
          listSeatRight.add(objectdata);
        }
      });
    }
    debugPrint(listSeatLeft.toString());
    //debugPrint(listSeatCenter.toString());
    debugPrint(listSeatRight.toString());
  }

  setVisiblitySeat() {
    setState(() {
      listSeatLeft[1]["isVisible"] = false; // left column index 0
      listSeatLeft[4]["isVisible"] = false; // left column index 1
      listSeatLeft[7]["isVisible"] = false;
      listSeatLeft[10]["isVisible"] = false; // left column index 0
      listSeatRight[1]["isVisible"] = false; // right column index 1
      listSeatRight[4]["isVisible"] = false; // right column index 2
      listSeatRight[7]["isVisible"] = false;
      listSeatRight[10]["isVisible"] = false;
      //listSeatCenter[4]["isVisible"] = false; // right column index 5
    });
    //this function to set where's the position of the seat that should be invisible
  }

  setSelectedToBooked() {
    listSeatLeft.forEach((seat) {
      if (seat["isSelected"]) {
        setState(() {
          seat["isBooked"] = true;
        });
      }
    });
    // listSeatCenter.forEach((seat) {
    //   if (seat["isSelected"]) {
    //     setState(() {
    //       seat["isBooked"] = true;
    //     });
    //   }
    // });

    listSeatRight.forEach((seat) {
      if (seat["isSelected"]) {
        setState(() {
          seat["isBooked"] = true;
        });
      }
    });
    //this function to loop every side of seat, from selected to booked, u also can this function to send to u'r serves side
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.black12,
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                child: Text("view slot"),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: Row(children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Booked",
                          ),
                        ),
                      ]),
                    )),
                    Expanded(
                        child: Container(
                      child: Row(children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Selected",
                          ),
                        ),
                      ]),
                    )),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                "Available",
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                // width: 150,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: Row(children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Slot for Car",
                            style: TextStyle(
                              color: Color.fromARGB(255, 138, 10, 1),
                              fontSize: 15,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ]),
                    )),
                    Expanded(
                        child: Container(
                      child: Row(children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Slot for bike/Scooter",
                            style: TextStyle(
                              color: Color.fromARGB(255, 138, 10, 1),
                              fontSize: 15,
                              //  fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ]),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
                // width: 150,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                //height: 100,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text('Slot for car'),
                    SizedBox(
                      //  height: 100,
                      width: 20,
                    ),

                    widgetSeat(listSeatLeft, false),

                    // Expanded(
                    //   child: widgetSeat(listSeatCenter, true),
                    // ),
                    SizedBox(
                      width: 130,
                    ),
                    widgetSeat(listSeatRight, false),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              const TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Number of Slots ',
                  //  hintText: 'Number of Slots',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              const TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Total ',
                  // hintText: 'No of Slots',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ), // background
                // onPrimary: Colors.yellow,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Parking();
                      },
                    ),
                  );
                  //    setSelectedToBooked();
                  // Parking();
                },
                child: Text(
                  "Buy Slots",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // int num = 0;
  Widget widgetSeat(List dataSeat, bool isCenter) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.93,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isCenter ? 4 : 3,
          childAspectRatio: isCenter ? 1 : 1,
        ),
        itemCount: dataSeat.length,
        itemBuilder: (BuildContext context, int index) {
          return Visibility(
            visible: dataSeat[index]["isVisible"],
            child: GestureDetector(
              onTap: () {
                setState(() {
                  dataSeat[index]["isSelected"] =
                      !dataSeat[index]["isSelected"];

                  //num++;
                });
              },
              child: Container(
                child: Text("${index + 1}"),
                margin: EdgeInsets.all(5),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: dataSeat[index]["isBooked"]
                      ? Colors.red
                      : dataSeat[index]["isSelected"]
                          ? Colors.green
                          : Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
