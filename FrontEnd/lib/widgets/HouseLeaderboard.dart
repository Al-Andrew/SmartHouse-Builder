import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class HouseLeaderboard extends StatelessWidget {
  const HouseLeaderboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 300,
        alignment: Alignment.center,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 160,
              height: 160,
              child: Card(
                child: Wrap(
                  children: <Widget>[
                    Image.asset("images/plan1.jpg",
                        alignment: Alignment.center),
                    ListTile(
                      title: Text("Plan 1"),
                      subtitle: Text("FrentescuCezar"),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 160,
              height: 160,
              child: Card(
                child: Wrap(
                  children: <Widget>[
                    Image.asset("images/plan2.png",
                        alignment: Alignment.center),
                    ListTile(
                      title: Text("Plan 2"),
                      subtitle: Text("Georgiana"),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 160,
              height: 160,
              child: Card(
                child: Wrap(
                  children: <Widget>[
                    Image.asset("images/plan3.png",
                        alignment: Alignment.center),
                    ListTile(
                      title: Text("Plan 3"),
                      subtitle: Text("Adina"),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 160,
              height: 160,
              child: Card(
                child: Wrap(
                  children: <Widget>[
                    Image.asset("images/plan4.png",
                        alignment: Alignment.center),
                    ListTile(
                      title: Text("Plan 4"),
                      subtitle: Text("Andrada"),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 160,
              height: 160,
              child: Card(
                child: Wrap(
                  children: <Widget>[
                    Image.asset("images/plan1.jpg",
                        alignment: Alignment.center),
                    ListTile(
                      title: Text("Plan 5"),
                      subtitle: Text("Mariuca"),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 160,
              height: 160,
              child: Card(
                child: Wrap(
                  children: <Widget>[
                    Image.asset("images/plan4.png",
                        alignment: Alignment.center),
                    ListTile(
                      title: Text("Plan 6"),
                      subtitle: Text("Kati"),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 160,
              height: 160,
              child: Card(
                child: Wrap(
                  children: <Widget>[
                    Image.asset("images/plan2.png",
                        alignment: Alignment.center),
                    ListTile(
                      title: Text("Plan 7"),
                      subtitle: Text("Andreea123"),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 160,
              height: 160,
              child: Card(
                child: Wrap(
                  children: <Widget>[
                    Image.asset("images/plan3.png",
                        alignment: Alignment.center),
                    ListTile(
                      title: Text("Plan 8"),
                      subtitle: Text("Ioana456"),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 160,
              height: 160,
              child: Card(
                child: Wrap(
                  children: <Widget>[
                    Image.asset("images/plan1.jpg",
                        alignment: Alignment.center),
                    ListTile(
                      title: Text("Plan 9"),
                      subtitle: Text("Marius789"),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 160,
              height: 160,
              child: Card(
                child: Wrap(
                  children: <Widget>[
                    Image.asset("images/plan4.png",
                        alignment: Alignment.center),
                    ListTile(
                      title: Text("Plan 10"),
                      subtitle: Text("Ion135"),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 160,
              height: 160,
              child: Card(
                child: Wrap(
                  children: <Widget>[
                    Image.asset("images/plan3.png",
                        alignment: Alignment.center),
                    ListTile(
                      title: Text("Plan 11"),
                      subtitle: Text("Ione246"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
