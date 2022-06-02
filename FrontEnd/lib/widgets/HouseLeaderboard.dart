import 'package:flutter/material.dart';

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
          color: const Color.fromARGB(222, 0, 1, 16),
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 200,
              alignment: Alignment.center,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(
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
                          const ListTile(
                            title: Text("Plan 1"),
                            subtitle: Text("FrentescuCezar"),
                          ),
                          Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: const Image(
                                image: AssetImage('plan3.png'),
                                alignment: Alignment.center,
                                height: 110,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(
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
                          const ListTile(
                            title: Text("Plan 2"),
                            subtitle: Text("Georgiana"),
                          ),
                          Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: const Image(
                                image: AssetImage('plan2.png'),
                                alignment: Alignment.center,
                                height: 110,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(
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
                          const ListTile(
                            title: Text("Plan 3"),
                            subtitle: Text("Andrada"),
                          ),
                          Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: const Image(
                                image: AssetImage('plan3.png'),
                                alignment: Alignment.center,
                                height: 110,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(
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
                          const ListTile(
                            title: Text("Plan 4"),
                            subtitle: Text("Kati"),
                          ),
                          Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: const Image(
                                image: AssetImage('plan4.png'),
                                alignment: Alignment.center,
                                height: 110,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(
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
                          const ListTile(
                            title: Text("Plan 5"),
                            subtitle: Text("Adina"),
                          ),
                          Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: const Image(
                                image: AssetImage('plan3.png'),
                                alignment: Alignment.center,
                                height: 110,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(
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
                          const ListTile(
                            title: Text("Plan 6"),
                            subtitle: Text("Mariuca"),
                          ),
                          Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: const Image(
                                image: AssetImage('plan2.png'),
                                alignment: Alignment.center,
                                height: 110,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(
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
                          const ListTile(
                            title: Text("Plan 7"),
                            subtitle: Text("Ionel246"),
                          ),
                          Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: const Image(
                                image: AssetImage('plan3.png'),
                                alignment: Alignment.center,
                                height: 110,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(
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
                          const ListTile(
                            title: Text("Plan 8"),
                            subtitle: Text("Ioana135"),
                          ),
                          Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: const Image(
                                image: AssetImage('plan2.png'),
                                alignment: Alignment.center,
                                height: 110,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(
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
                          const ListTile(
                            title: Text("Plan 9"),
                            subtitle: Text("Ionel123"),
                          ),
                          Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: const Image(
                                image: AssetImage('plan3.png'),
                                alignment: Alignment.center,
                                height: 110,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(
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
                          const ListTile(
                            title: Text("Plan 10"),
                            subtitle: Text("Alin456"),
                          ),
                          Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: const Image(
                                image: AssetImage('plan4.png'),
                                alignment: Alignment.center,
                                height: 110,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(
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
                          const ListTile(
                            title: Text("Plan 11"),
                            subtitle: Text("Ione246"),
                          ),
                          Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: const Image(
                                image: AssetImage('plan3.png'),
                                alignment: Alignment.center,
                                height: 110,
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
