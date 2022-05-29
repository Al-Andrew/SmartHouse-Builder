import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class HouseLeaderboard extends StatefulWidget {
  const HouseLeaderboard({
    Key? key,
  }) : super(key: key);

  @override
  State<HouseLeaderboard> createState() => _HouseLeaderboardState();
}

class _HouseLeaderboardState extends State<HouseLeaderboard> {
  String dropdownValue = 'TOP HOUSES OF THE DAY';

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      ColoredBox(
          color: Color.fromARGB(222, 0, 1, 16),
          child: Row(children: [
            DecoratedBox(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 6, 10, 19),
                    border: Border.all(color: Colors.black38, width: 3),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: <BoxShadow>[
                      //apply shadow on Dropdown button
                      BoxShadow(
                          color:
                              Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                          blurRadius: 5)
                    ]),
                child: Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    elevation: 6,
                    alignment: AlignmentDirectional.bottomStart,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: 'BarlowCondensed',
                        fontWeight: FontWeight.bold),
                    underline: Container(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    icon: Padding(
                        //Icon at tail, arrow bottom is default icon
                        padding: EdgeInsets.only(left: 20),
                        child: Icon(Icons.arrow_circle_down_sharp)),
                    iconEnabledColor: Colors.white, //Icon color

                    dropdownColor: Color.fromARGB(
                        202, 27, 47, 59), //dropdown background color
                    items: <String>[
                      'TOP HOUSES OF THE DAY',
                      'TOP HOUSES OF THE WEEK',
                      'TOP HOUSES OF THE MONTH',
                      'TOP HOUSES OF THE YEAR'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ))
          ])),
      ColoredBox(
          color: Color.fromARGB(222, 0, 1, 16),
          child: Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 200,
              alignment: Alignment.center,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(240, 1, 2, 28),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 5.0,
                              spreadRadius: 1.0)
                        ]),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Text("Plan 1"),
                            subtitle: Text("FrentescuCezar"),
                          ),
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Image.asset(
                                "images/plan3.png",
                                alignment: Alignment.center,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(240, 1, 2, 28),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 5.0,
                              spreadRadius: 1.0)
                        ]),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Text("Plan 2"),
                            subtitle: Text("Georgiana"),
                          ),
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Image.asset(
                                "images/plan2.png",
                                alignment: Alignment.center,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(240, 1, 2, 28),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 5.0,
                              spreadRadius: 1.0)
                        ]),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Text("Plan 3"),
                            subtitle: Text("Andrada"),
                          ),
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Image.asset(
                                "images/plan3.png",
                                alignment: Alignment.center,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(240, 1, 2, 28),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 5.0,
                              spreadRadius: 1.0)
                        ]),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Text("Plan 4"),
                            subtitle: Text("Kati"),
                          ),
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Image.asset(
                                "images/plan4.png",
                                alignment: Alignment.center,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(240, 1, 2, 28),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 5.0,
                              spreadRadius: 1.0)
                        ]),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Text("Plan 5"),
                            subtitle: Text("Adina"),
                          ),
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Image.asset(
                                "images/plan3.png",
                                alignment: Alignment.center,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(240, 1, 2, 28),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 5.0,
                              spreadRadius: 1.0)
                        ]),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Text("Plan 6"),
                            subtitle: Text("Mariuca"),
                          ),
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Image.asset(
                                "images/plan2.png",
                                alignment: Alignment.center,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(240, 1, 2, 28),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 5.0,
                              spreadRadius: 1.0)
                        ]),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Text("Plan 7"),
                            subtitle: Text("Ionel246"),
                          ),
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Image.asset(
                                "images/plan3.png",
                                alignment: Alignment.center,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(240, 1, 2, 28),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 5.0,
                              spreadRadius: 1.0)
                        ]),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Text("Plan 8"),
                            subtitle: Text("Ioana135"),
                          ),
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Image.asset(
                                "images/plan2.png",
                                alignment: Alignment.center,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(240, 1, 2, 28),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 5.0,
                              spreadRadius: 1.0)
                        ]),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Text("Plan 9"),
                            subtitle: Text("Ionel123"),
                          ),
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Image.asset(
                                "images/plan3.png",
                                alignment: Alignment.center,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(240, 1, 2, 28),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 5.0,
                              spreadRadius: 1.0)
                        ]),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Text("Plan 10"),
                            subtitle: Text("Alin456"),
                          ),
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Image.asset(
                                "images/plan4.png",
                                alignment: Alignment.center,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(240, 1, 2, 28),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 5.0,
                              spreadRadius: 1.0)
                        ]),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            title: Text("Plan 11"),
                            subtitle: Text("Ione246"),
                          ),
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Image.asset(
                                "images/plan3.png",
                                alignment: Alignment.center,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              )))
    ]);
  }
}
