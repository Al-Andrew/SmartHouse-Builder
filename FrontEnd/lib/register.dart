import 'dart:convert';

import 'package:control_style/control_style.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:homepage/global_variables.dart';
import 'package:homepage/main.dart';
import 'package:http/http.dart';
import 'package:crypto/crypto.dart';
import 'package:string_validator/string_validator.dart';

class Register extends StatefulWidget {
  const Register();

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _emailagainTextController =
      TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _passwordagainTextController =
      TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();

  late bool isUserAlreadyTaken = false;
  late bool isEmailAlreadyTaken = false;

  Future register(String username, password, email) async {
    final headers = {"Content-type": "application/json"};

    var byteHasedPassword = utf8.encode(password);
    String hasedPassword = sha256.convert(byteHasedPassword).toString();

    var body = jsonEncode({
      'nameUser': username,
      'emailUser': email,
      'passUser': hasedPassword,
    });

    Response response = await post(
        Uri.parse(
            'https://smart-house-builder.azurewebsites.net/api/user/register'),
        body: body,
        headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      if (response.body == "-1") {
        isUserAlreadyTaken = true;
        print("Username is already taken");
      } else if (response.body == "-2") {
        isEmailAlreadyTaken = true;
        print("Email is already taken");
      } else {
        userID = int.parse(response.body);
        hasUserRegisteredSuccessfully = true;
        print("Login succesfully");
      }
    } else {
      print('The response failed');
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
            borderRadius: BorderRadius.circular(20)),
        height: 1300,
        width: 700,
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 600,
                  height: 1250,
                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      const SizedBox(height: 20),
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
                                  return '*Please enter your username';
                                }
                                if (!isAlphanumeric(value)) {
                                  return '*Your username contains unknown symbols';
                                }
                                if (value.length > 20) {
                                  return '*Your username is too long';
                                }
                                if (value.length < 3) {
                                  return '*Your username is too short';
                                }
                                if (isUserAlreadyTaken == true) {
                                  isUserAlreadyTaken = false;
                                  return '*Username is already taken';
                                }
                                return null;
                              },
                              controller: _usernameTextController,
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
                                        color: Color.fromARGB(255, 0, 126, 223),
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
                                  labelText: 'Enter Username',
                                  labelStyle: const TextStyle(
                                      color: Color.fromARGB(255, 90, 90, 90),
                                      fontFamily: 'BebasNeuePro',
                                      fontSize: 30,
                                      fontWeight: FontWeight.w300),
                                  hintText: 'Username'),
                            ),
                          ),
                        ),
                      ),
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
                                  return '*Please enter your password';
                                }
                                if (value.length < 8) {
                                  return '*Your password needs at least 8 characters';
                                }
                                return null;
                              },
                              controller: _passwordTextController,
                              obscureText: true,
                              maxLength: 100,
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
                                        color: Color.fromARGB(255, 0, 126, 223),
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
                                  return '*Please enter your password (again)';
                                }
                                if (value != _passwordTextController.text) {
                                  return 'The passwords do not match';
                                }
                                if (value.length < 8) {
                                  return '*Your password needs at least 8 characters';
                                }
                                return null;
                              },
                              controller: _passwordagainTextController,
                              obscureText: true,
                              maxLength: 100,
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
                                        color: Color.fromARGB(255, 0, 126, 223),
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
                                  labelText: 'Enter Password (again)',
                                  labelStyle: const TextStyle(
                                      color: Color.fromARGB(255, 90, 90, 90),
                                      fontFamily: 'BebasNeuePro',
                                      fontSize: 30,
                                      fontWeight: FontWeight.w300),
                                  hintText: 'Password (again)'),
                            ),
                          ),
                        ),
                      ),
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
                                  return '*Please enter your e-mail';
                                }
                                if (EmailValidator.validate(value) == false) {
                                  return '*Your input is not an E-mail';
                                }
                                if (isEmailAlreadyTaken == true) {
                                  isEmailAlreadyTaken = false;
                                  return '*The e-mail is already taken';
                                }

                                return null;
                              },
                              controller: _emailTextController,
                              maxLength: 40,
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
                                        color: Color.fromARGB(255, 0, 126, 223),
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
                                  labelText: 'Enter E-mail',
                                  labelStyle: const TextStyle(
                                      color: Color.fromARGB(255, 90, 90, 90),
                                      fontFamily: 'BebasNeuePro',
                                      fontSize: 30,
                                      fontWeight: FontWeight.w300),
                                  hintText: 'E-mail'),
                            ),
                          ),
                        ),
                      ),
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
                                  return '*Please enter your e-mail (again)';
                                }
                                if (value != _emailTextController.text) {
                                  return 'The e-mails do not match';
                                }
                                if (EmailValidator.validate(value) == false) {
                                  return '*Your input is not an E-mail';
                                }
                                if (isEmailAlreadyTaken == true) {
                                  isEmailAlreadyTaken = false;
                                  return '*The e-mail is already taken';
                                }

                                return null;
                              },
                              controller: _emailagainTextController,
                              minLines: 1,
                              maxLength: 40,
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
                                        color: Color.fromARGB(255, 0, 126, 223),
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
                                  labelText: 'Enter E-mail (again)',
                                  labelStyle: const TextStyle(
                                      color: Color.fromARGB(255, 90, 90, 90),
                                      fontFamily: 'BebasNeuePro',
                                      fontSize: 30,
                                      fontWeight: FontWeight.w300),
                                  hintText: 'E-mail (again)'),
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
                                register(
                                    _usernameTextController.text.toString(),
                                    _passwordTextController.text.toString(),
                                    _emailTextController.text.toString());
                              }
                              if (hasUserRegisteredSuccessfully == true) {
                                hasUserRegisteredSuccessfully = false;
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
                              'CREATE ACCOUNT',
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
