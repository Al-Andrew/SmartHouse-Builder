// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:homepage/main.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../global_variables.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(156, 234, 234, 234),
        body: SafeArea(child: LayoutBuilder(builder: ((context, constraints) {
          //
          //
          //
          //
          //
          //DESKTOP

          if (constraints.maxWidth > 700) {
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height - 50,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 250, 250, 250),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 50,
                          offset:
                              const Offset(0, 50), // changes position of shadow
                        ),
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                          height:
                              MediaQuery.of(context).size.height * 10 / 100),
                      GradientText(
                        'Welcome,\n' + userName + '!',
                        style: const TextStyle(
                            fontSize: 50,
                            color: Colors.cyan,
                            fontFamily: 'BarlowCondensed'),
                        textAlign: TextAlign.center,
                        colors: const [
                          Colors.cyanAccent,
                          Colors.cyan,
                          Colors.indigo,
                          //add mroe colors here.
                        ],
                      ),
                      SizedBox(
                          height:
                              MediaQuery.of(context).size.height * 20 / 100),
                      const SelectableText('Your Account Settings',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'BebasNeuePro', fontSize: 28)),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 6 / 100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                InkWell(
                                    onTap: () {
                                      lastSelectedIndex = 8;
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const MyApp(
                                                    selectedIndex: 8,
                                                  )));
                                    },
                                    child: const Image(
                                      image: AssetImage(
                                          'assets/change_password.png'),
                                      height: 70,
                                      width: 70,
                                    )),
                                InkWell(
                                  onTap: () {
                                    lastSelectedIndex = 8;
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const MyApp(
                                                  selectedIndex: 8,
                                                )));
                                  },
                                  child: const Text('Change \nyour password',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'BebasNeuePro',
                                          fontSize: 25)),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 100),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  lastSelectedIndex = 9;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const MyApp(
                                                selectedIndex: 9,
                                              )));
                                },
                                child: const Image(
                                  image: AssetImage('assets/change_email.png'),
                                  height: 70,
                                  width: 70,
                                  // fit: BoxFit.fitHeight,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  lastSelectedIndex = 9;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const MyApp(
                                                selectedIndex: 9,
                                              )));
                                },
                                child: const Text('Change \nyour e-mail',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'BebasNeuePro',
                                        fontSize: 25)),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );

            //
            //
            //
            //
            //
            //
            //
            // PHONE

          } else {
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height - 50,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 250, 250, 250),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 50,
                          offset:
                              const Offset(0, 50), // changes position of shadow
                        ),
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                          height:
                              MediaQuery.of(context).size.height * 10 / 100),
                      GradientText(
                        'Welcome,\n' + userName + '!',
                        style: const TextStyle(
                            fontSize: 35,
                            color: Colors.cyan,
                            fontFamily: 'BarlowCondensed'),
                        textAlign: TextAlign.center,
                        colors: const [
                          Colors.cyanAccent,
                          Colors.cyan,
                          Colors.indigo,
                        ],
                      ),
                      SizedBox(
                          height:
                              MediaQuery.of(context).size.height * 20 / 100),
                      const SelectableText('Your Account Settings',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'BebasNeuePro', fontSize: 24)),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 6 / 100),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                InkWell(
                                    onTap: () {
                                      lastSelectedIndex = 8;
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const MyApp(
                                                    selectedIndex: 8,
                                                  )));
                                    },
                                    child: const Image(
                                      image: AssetImage(
                                          'assets/change_password.png'),
                                      height: 50,
                                      width: 50,
                                    )),
                                InkWell(
                                  onTap: () {
                                    lastSelectedIndex = 8;
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const MyApp(
                                                  selectedIndex: 8,
                                                )));
                                  },
                                  child: const Text('Change \nyour password',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'BebasNeuePro',
                                          fontSize: 24)),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 100),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  lastSelectedIndex = 9;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const MyApp(
                                                selectedIndex: 9,
                                              )));
                                },
                                child: const Image(
                                  image: AssetImage('assets/change_email.png'),
                                  height: 50,
                                  width: 50,
                                  // fit: BoxFit.fitHeight,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  lastSelectedIndex = 9;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const MyApp(
                                                selectedIndex: 9,
                                              )));
                                },
                                child: const Text('Change \nyour e-mail',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'BebasNeuePro',
                                        fontSize: 24)),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        }))));
  }
}
