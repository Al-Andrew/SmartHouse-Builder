import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:homepage/login.dart';
import 'package:homepage/register.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
   Widget build(BuildContext){
    return DefaultTabController(
      length: 2,
      child: SingleChildScrollView(
        child: Padding(
      padding:const EdgeInsets.symmetric(horizontal:20,vertical: 20 ),
        child:Column(
          children: [
            SizedBox(height: 15),
            Container(
              height: 38,
              decoration:BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.cyan,
                      Colors.blueAccent,
                    ],
                  ),
                    borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: TabBar(
                    indicator:BoxDecoration(color: Colors.white30, borderRadius: BorderRadius.circular(10.0)),
                    tabs:[
                      Tab(text: 'Register'),
                      Tab(text: 'Login')
                    ] ),
              ),
            ),
            SizedBox(
              height: 700,
              child: TabBarView(
                children: const <Widget> [
                  Register(),
                  Login()
                ],
              )
            )
          ],
        ),
        ),
      ),
    );
  }
  }