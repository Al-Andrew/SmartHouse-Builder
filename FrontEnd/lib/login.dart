import 'dart:convert';

import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:homepage/global_variables.dart';
import 'package:homepage/main.dart';
import 'package:http/http.dart';
import 'package:crypto/crypto.dart';
import 'package:string_validator/string_validator.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  late bool isNameEmailMatched = true;
  late bool isPasswordMatched = true;

  Future login(String emailOrUser, password) async {
    final headers = {"Content-type": "application/json"};

    var byteHasedPassword = utf8.encode(password);
    String hasedPassword = sha256.convert(byteHasedPassword).toString();

    if (emailOrUser.contains("@")) {
      var body =
          jsonEncode({'emailUser': emailOrUser, 'passUser': hasedPassword});

      Response response = await post(
          Uri.parse(
              'https://smart-house-builder.azurewebsites.net/api/user/login'),
          body: body,
          headers: headers);

      print(response.body);

      if (response.statusCode == 200) {
        if (response.body == "-2") {
          isNameEmailMatched = false;
          print("E-mail not found");
        } else if (response.body == "-3") {
          isPasswordMatched = true;
          print("Passwords don't match");
        } else {
          isNameEmailMatched = true;
          userID = int.parse(response.body);
          isUserLogged = true;
          print("Login succesfully");
        }
      } else {
        print('failed');
      }
    } else {
      var body =
          jsonEncode({'nameUser': emailOrUser, 'passUser': hasedPassword});

      Response response = await post(
          Uri.parse(
              'https://smart-house-builder.azurewebsites.net/api/user/login'),
          body: body,
          headers: headers);

      print(response.body);

      if (response.statusCode == 200) {
        if (response.body == "-1") {
          isNameEmailMatched = false;
          print("Username not found");
        } else if (response.body == "-3") {
          isPasswordMatched = false;
          print("Passwords don't match");
        } else {
          userID = int.parse(response.body);
          userName = emailOrUser;
          isUserLogged = true;
          print("Login succesfully");
        }
      } else {
        print('failed');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.cyan,
                Colors.blueAccent,
              ],
            ),
            borderRadius: BorderRadius.circular(0)),
        height: 1100,
        width: 800,
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    width: 600,
                    height: 1000,
                    child: Form(
                      key: _formKey,
                      child: Column(children: [
                        //1
                        Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: SizedBox(
                            height: 90,
                            child: Material(
                              borderRadius: BorderRadius.circular(12),
                              elevation: 10.0,
                              shadowColor: Colors.black,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '*Please enter your Username/E-mail';
                                  }
                                  if (!isAlphanumeric(value) &&
                                      !value.toString().contains('@')) {
                                    return '*The username/email contains unknown symbols';
                                  }
                                  if (value.length < 4) {
                                    return '*The username/email is too short';
                                  }
                                  if (isNameEmailMatched == false) {
                                    isNameEmailMatched = true;
                                    return '*The username/e-mail was not found';
                                  }
                                  return null;
                                },
                                controller: _emailTextController,
                                minLines: 1,
                                maxLength: 30,
                                style: const TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    counterStyle: const TextStyle(
                                      height: double.minPositive,
                                    ),
                                    counterText: "",
                                    //Error styles
                                    errorStyle: const TextStyle(
                                        color: Color.fromRGBO(3, 31, 255, 1),
                                        fontSize: 15),
                                    focusedErrorBorder: DecoratedInputBorder(
                                        shadow: const [
                                          BoxShadow(
                                            color: Colors.blue,
                                            blurRadius: 20,
                                          )
                                        ],
                                        child: const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 0, 81, 255),
                                                width: 2.0))),
                                    errorBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 0, 126, 223),
                                          width: 2.0),
                                    ),
                                    // fill color
                                    filled: true,
                                    fillColor: Colors.white,
                                    //Outlines
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 5.0)),
                                    //Text
                                    labelText: 'Enter Username/E-mail',
                                    labelStyle: const TextStyle(
                                        color: Color.fromARGB(255, 90, 90, 90),
                                        fontFamily: 'BebasNeuePro',
                                        fontSize: 30,
                                        fontWeight: FontWeight.w300),
                                    hintText: 'Username/E-mail'),
                              ),
                            ),
                          ),
                        ),
                        //2
                        Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: SizedBox(
                            height: 90,
                            child: Material(
                              borderRadius: BorderRadius.circular(12),
                              elevation: 10.0,
                              shadowColor: Colors.black,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '*Please enter your Password';
                                  }
                                  if (value.length < 8) {
                                    return '*The password is too short';
                                  }
                                  if (isPasswordMatched == false) {
                                    isPasswordMatched = true;
                                    return '*The password does not match';
                                  }
                                  return null;
                                },
                                controller: _passwordTextController,
                                obscureText: true,
                                style: const TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    //Error styles
                                    errorStyle: const TextStyle(
                                        color: Color.fromRGBO(3, 31, 255, 1),
                                        fontSize: 15),
                                    focusedErrorBorder: DecoratedInputBorder(
                                        shadow: const [
                                          BoxShadow(
                                            color: Colors.blue,
                                            blurRadius: 20,
                                          )
                                        ],
                                        child: const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 0, 81, 255),
                                                width: 2.0))),
                                    errorBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 0, 126, 223),
                                          width: 2.0),
                                    ),
                                    // fill color
                                    filled: true,
                                    fillColor: Colors.white,
                                    //Outlines
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 5.0)),
                                    //Text
                                    labelText: 'Enter Password',
                                    labelStyle: const TextStyle(
                                        color: Color.fromARGB(255, 90, 90, 90),
                                        fontFamily: 'BebasNeuePro',
                                        fontSize: 30,
                                        fontWeight: FontWeight.w300),
                                    hintText: 'Password'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        const SelectableText(
                            'SmartHouseBuilder does not'
                            '\nsell your personal information',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'BebasNeuePro', fontSize: 30)),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 80,
                          width: 240,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  primary: Colors.black,
                                  padding: const EdgeInsets.all(12.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  backgroundColor:
                                      const Color.fromARGB(255, 191, 241, 255),
                                  textStyle: const TextStyle(
                                      fontFamily: 'BebasNeuePro',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30)),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  login(_emailTextController.text.toString(),
                                      _passwordTextController.text.toString());
                                }
                                if (isUserLogged == true) {
                                  lastSelectedIndex = 0;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const MyApp(
                                                selectedIndex: 0,
                                              )));
                                }
                              },
                              child: const Text(
                                'LOGIN',
                                textAlign: TextAlign.center,
                              )),
                        )
                      ]),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
