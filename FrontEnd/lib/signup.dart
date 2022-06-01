import 'package:flutter/material.dart';
import 'package:homepage/login.dart';
import 'package:homepage/register.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext) {
    return DefaultTabController(
      length: 2,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 5, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Container(
                height: 38,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.cyan,
                        Colors.blueAccent,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20.0)),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: const Color.fromARGB(115, 178, 232, 255),
                        borderRadius: BorderRadius.circular(20.0)),
                    tabs: const [
                      Tab(
                          child: Text(
                        "Register",
                        style:
                            TextStyle(fontSize: 30, fontFamily: 'BebasNeuePro'),
                      )),
                      Tab(
                          child: Text(
                        "Login",
                        style:
                            TextStyle(fontSize: 30, fontFamily: 'BebasNeuePro'),
                      ))
                    ]),
              ),
              const SizedBox(
                  height: 1100,
                  child: TabBarView(
                    children: <Widget>[Register(), Login()],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
