import 'package:flutter/material.dart';
import 'package:homepage/about_us.dart';

import 'package:homepage/global_variables.dart';
import 'package:homepage/homepage.dart';
import 'package:homepage/market.dart';
import 'package:homepage/forum/Forum.dart';

import 'package:homepage/shb.dart';
import 'package:homepage/contact_us.dart';

import 'package:homepage/signup.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const MyApp(
    selectedIndex: 0,
  ));
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.selectedIndex}) : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Smart House Builder',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(
          title: 'Smart House Builder', selectedIndex: selectedIndex),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
    required this.selectedIndex,
  }) : super(key: key);

  final int selectedIndex;
  final String title;

  @override
  // ignore: no_logic_in_create_state
  State<MyHomePage> createState() => _MyHomePageState(selectedIndex);
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex;
  _MyHomePageState(this._selectedIndex);

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SHB(),
    Market(),
    const Forum(),
    const ContactUs(),
    const AboutUs(),
    SignUp(),
  ];

  void changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: LayoutBuilder(
          builder: ((context, constraints) {
            //USER IS NOT LOGGED ------ DESKTOP MODE
            //
            //
            //
            //
            if (!isUserLogged) {
              if (constraints.maxWidth > 700) {
                return Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                      toolbarHeight: 100,
                      backgroundColor: Colors.transparent,
                      title: TextButton(
                        onPressed: () => changeScreen(0),
                        child: const Image(
                          image: AssetImage('assets/logo_smart.png'),
                          height: 90,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      actions: [
                        ButtonBar(
                          children: [
                            TextButton(
                                style: TextButton.styleFrom(
                                    textStyle:
                                        const TextStyle(color: Colors.black)),
                                onPressed: () => changeScreen(0),
                                child: const Center(
                                  child: Text('Home'),
                                )),
                            TextButton(
                                style: TextButton.styleFrom(
                                    textStyle:
                                        const TextStyle(color: Colors.black)),
                                onPressed: () => changeScreen(6),
                                child: const Center(
                                  child: Text('Forum'),
                                )),
                            TextButton(
                                style: TextButton.styleFrom(
                                    textStyle:
                                        const TextStyle(color: Colors.black)),
                                onPressed: () => changeScreen(6),
                                child: const Center(
                                  child: Text('SHB'),
                                )),
                            TextButton(
                                style: TextButton.styleFrom(
                                    textStyle:
                                        const TextStyle(color: Colors.black)),
                                onPressed: () => changeScreen(6),
                                child: const Center(
                                  child: Text('Marketplace'),
                                )),
                            TextButton(
                                style: TextButton.styleFrom(
                                    textStyle:
                                        const TextStyle(color: Colors.black)),
                                onPressed: () => changeScreen(5),
                                child: const Center(
                                  child: Text('About'),
                                )),
                            TextButton(
                                style: TextButton.styleFrom(
                                    textStyle:
                                        const TextStyle(color: Colors.black)),
                                onPressed: () => changeScreen(4),
                                child: const Center(
                                  child: Text('Contact Us'),
                                )),
                            Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                        textStyle: const TextStyle(
                                            color: Colors.white)),
                                    onPressed: () => changeScreen(6),
                                    child: const Center(
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: 'BebasNeuePro'),
                                      ),
                                    ))),
                          ],
                        )
                      ],
                    ),
                    body: Scaffold(
                      body: Center(
                        child: _widgetOptions.elementAt(_selectedIndex),
                      ),
                    ));
              } else {
                // USER IS NOT LOGGED ------- MOBILE VERSION
                //
                //
                //
                //
                return Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                      toolbarHeight: 100,
                      backgroundColor: Colors.transparent,
                      title: TextButton(
                        onPressed: () => changeScreen(0),
                        child: const Image(
                          image: AssetImage('assets/logo_smart.png'),
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    endDrawer: Drawer(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          const DrawerHeader(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: Image(
                              image: AssetImage('assets/logo_smart_mini.png'),
                              height: 5,
                            ),
                          ),
                          ListTile(
                            title: const Center(
                                child: Text('Home',
                                    style: TextStyle(
                                        fontFamily: "BebasNeuePro",
                                        fontSize: 23))),
                            onTap: () {
                              Navigator.pop(context);
                              changeScreen(0);
                            },
                          ),
                          ListTile(
                            title: const Center(
                                child: Text('Forum',
                                    style: TextStyle(
                                        fontFamily: "BebasNeuePro",
                                        fontSize: 23))),
                            onTap: () {
                              Navigator.pop(context);
                              changeScreen(6);
                            },
                          ),
                          ListTile(
                            title: const Center(
                                child: Text('SHB',
                                    style: TextStyle(
                                        fontFamily: "BebasNeuePro",
                                        fontSize: 23))),
                            onTap: () {
                              Navigator.pop(context);
                              changeScreen(6);
                            },
                          ),
                          ListTile(
                            title: const Center(
                                child: Text('Marketplace',
                                    style: TextStyle(
                                        fontFamily: "BebasNeuePro",
                                        fontSize: 23))),
                            onTap: () {
                              Navigator.pop(context);
                              changeScreen(6);
                            },
                          ),
                          ListTile(
                            title: const Center(
                                child: Text('About',
                                    style: TextStyle(
                                        fontFamily: "BebasNeuePro",
                                        fontSize: 23))),
                            onTap: () {
                              Navigator.pop(context);
                              changeScreen(5);
                            },
                          ),
                          ListTile(
                            title: const Center(
                                child: Text('Contact Us',
                                    style: TextStyle(
                                        fontFamily: "BebasNeuePro",
                                        fontSize: 23))),
                            onTap: () {
                              Navigator.pop(context);
                              changeScreen(4);
                            },
                          ),
                          ListTile(
                            title: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color.fromARGB(255, 57, 128, 220),
                                        Colors.cyan,
                                        Color.fromARGB(255, 94, 227, 245)
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                        textStyle: const TextStyle(
                                            color: Colors.white)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      changeScreen(6);
                                    },
                                    child: const Center(
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontFamily: 'BebasNeuePro',
                                        ),
                                      ),
                                    ))),
                          ),
                        ],
                      ),
                    ),
                    body: Scaffold(
                      body: Center(
                        child: _widgetOptions.elementAt(_selectedIndex),
                      ),
                    ));
              }
            } else {
              // USER IS LOGGED ------- DESKTOP MODE
              //
              //
              //
              //
              if (constraints.maxWidth > 900) {
                return Scaffold(
                    resizeToAvoidBottomInset: false,
                    appBar: AppBar(
                      elevation: 0,
                      toolbarHeight: 100,
                      backgroundColor: Colors.transparent,
                      title: TextButton(
                        onPressed: () => changeScreen(0),
                        child: const Image(
                          image: AssetImage('assets/logo_smart.png'),
                          height: 90,
                        ),
                      ),
                      actions: [
                        ButtonBar(
                          children: [
                            TextButton(
                                style: TextButton.styleFrom(
                                    textStyle:
                                        const TextStyle(color: Colors.black)),
                                onPressed: () => changeScreen(0),
                                child: const Center(
                                  child: Text('Home'),
                                )),
                            TextButton(
                                style: TextButton.styleFrom(
                                    textStyle:
                                        const TextStyle(color: Colors.black)),
                                onPressed: () => changeScreen(3),
                                child: const Center(
                                  child: Text('Forum'),
                                )),
                            TextButton(
                                style: TextButton.styleFrom(
                                    textStyle:
                                        const TextStyle(color: Colors.black)),
                                onPressed: () => changeScreen(1),
                                child: const Center(
                                  child: Text('SHB'),
                                )),
                            TextButton(
                                style: TextButton.styleFrom(
                                    textStyle:
                                        const TextStyle(color: Colors.black)),
                                onPressed: () => changeScreen(2),
                                child: const Center(
                                  child: Text('Marketplace'),
                                )),
                            TextButton(
                                style: TextButton.styleFrom(
                                    textStyle:
                                        const TextStyle(color: Colors.black)),
                                onPressed: () => changeScreen(5),
                                child: const Center(
                                  child: Text('About'),
                                )),
                            TextButton(
                                style: TextButton.styleFrom(
                                    textStyle:
                                        const TextStyle(color: Colors.black)),
                                onPressed: () => changeScreen(4),
                                child: const Center(
                                  child: Text('Contact Us'),
                                )),
                            Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: InkWell(
                                  onTap: () {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          const AccountMenu(),
                                    );
                                  },
                                  child: const CircleAvatar(
                                    radius: 34,
                                    backgroundColor:
                                        Color.fromARGB(255, 91, 236, 255),
                                    child: CircleAvatar(
                                      radius: 31,
                                      backgroundImage: AssetImage(
                                          'assets/profile_picture2.png'),
                                    ),
                                  ), // Handle your callback
                                )),
                          ],
                        )
                      ],
                    ),
                    body: Scaffold(
                      body: Center(
                        child: _widgetOptions.elementAt(_selectedIndex),
                      ),
                    ));
              } else {
                // USER IS LOGGED ------- MOBILE MODE
                //
                //
                //
                //
                return Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                      toolbarHeight: 100,
                      backgroundColor: Colors.transparent,
                      title: TextButton(
                        onPressed: () => changeScreen(0),
                        child: const Image(
                          image: AssetImage('assets/logo_smart.png'),
                          isAntiAlias: true,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    endDrawer: Drawer(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          const DrawerHeader(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: Image(
                              image: AssetImage('assets/logo_smart_mini.png'),
                              height: 5,
                            ),
                          ),
                          ListTile(
                            title: const Center(
                                child: Text('Home',
                                    style: TextStyle(
                                        fontFamily: "BebasNeuePro",
                                        fontSize: 23))),
                            onTap: () {
                              Navigator.pop(context);
                              changeScreen(0);
                            },
                          ),
                          ListTile(
                            title: const Center(
                                child: Text('Forum',
                                    style: TextStyle(
                                        fontFamily: "BebasNeuePro",
                                        fontSize: 23))),
                            onTap: () {
                              Navigator.pop(context);
                              changeScreen(3);
                            },
                          ),
                          ListTile(
                            title: const Center(
                                child: Text('SHB',
                                    style: TextStyle(
                                        fontFamily: "BebasNeuePro",
                                        fontSize: 23))),
                            onTap: () {
                              Navigator.pop(context);
                              changeScreen(1);
                            },
                          ),
                          ListTile(
                            title: const Center(
                                child: Text('Marketplace',
                                    style: TextStyle(
                                        fontFamily: "BebasNeuePro",
                                        fontSize: 23))),
                            onTap: () {
                              Navigator.pop(context);
                              changeScreen(2);
                            },
                          ),
                          ListTile(
                            title: const Center(
                                child: Text('About',
                                    style: TextStyle(
                                        fontFamily: "BebasNeuePro",
                                        fontSize: 23))),
                            onTap: () {
                              Navigator.pop(context);
                              changeScreen(5);
                            },
                          ),
                          ListTile(
                            title: const Center(
                                child: Text('Contact Us',
                                    style: TextStyle(
                                        fontFamily: "BebasNeuePro",
                                        fontSize: 23))),
                            onTap: () {
                              Navigator.pop(context);
                              changeScreen(4);
                            },
                          ),
                          ListTile(
                            title: Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: InkWell(
                                  onTap: () {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          const AccountMenu(),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      const CircleAvatar(
                                        radius: 41,
                                        backgroundColor: Colors.blue,
                                        child: CircleAvatar(
                                          radius: 41,
                                          backgroundImage: AssetImage(
                                              'assets/profile_picture2.png'),
                                        ),
                                      ),
                                      Text(userName,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontFamily: "BebasNeuePro",
                                            fontSize: 25,
                                            color: Colors.cyan,
                                          ))
                                    ],
                                  ), // Handle your callback
                                )),
                          ),
                        ],
                      ),
                    ),
                    body: Scaffold(
                      body: Center(
                        child: _widgetOptions.elementAt(_selectedIndex),
                      ),
                    ));
              }
            }
          }),
        ),
      ),
    );
  }
}

class AccountMenu extends StatelessWidget {
  const AccountMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: SizedBox(
        height: 100,
        child: Column(
          children: [
            Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  // lastSelectedIndex = 7;
                  // Navigator.pushReplacement(
                  // context,
                  // MaterialPageRoute(
                  // builder: (context) => const MyApp(
                  // selectedIndex: 7,
                  // )));
                },
                child: Row(
                  children: const [
                    InkWell(
                      child: Image(
                        image: AssetImage('assets/user_icon.png'),
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text('My account',
                        style: TextStyle(fontSize: 16, color: Colors.blue))
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  isUserLogged = false;
                  lastSelectedIndex = 0;

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyApp(
                                selectedIndex: 0,
                              )));
                },
                child: Row(
                  children: const [
                    InkWell(
                      child: Image(
                        image: AssetImage('assets/log_out.png'),
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text('Log out',
                        style: TextStyle(fontSize: 16, color: Colors.blue))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
