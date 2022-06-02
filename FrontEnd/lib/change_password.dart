import 'dart:convert';
import 'dart:io';

import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:homepage/global_variables.dart';
import 'package:homepage/myAccountButtonBack.dart';
import 'package:http/http.dart';
import 'package:crypto/crypto.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _newPasswordTextController =
      TextEditingController();
  final TextEditingController _newPasswordagainTextController =
      TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();

  late bool isOldPasswordMatched = true;

  Future<void> changePassword(String oldPassword, String newPassword) async {
    var byteHasedOldPassword = utf8.encode(oldPassword);
    String hasedOldPassword = sha256.convert(byteHasedOldPassword).toString();

    var byteHasedNewPassword = utf8.encode(newPassword);
    String hasedNewPassword = sha256.convert(byteHasedNewPassword).toString();

    final queryParameters = {
      'userId': '$userID',
      'oldPass': hasedOldPassword,
      'newPass': hasedNewPassword,
    };
    final uri = Uri.http('smart-house-builder.azurewebsites.net',
        '/api/user/changePass', queryParameters);
    var headers = {
      HttpHeaders.authorizationHeader: 'Token $String',
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    Response response = await put(uri, headers: headers);

    if (response.statusCode == 200) {
      if (response.body == "-1") {
        isOldPasswordMatched = false;
        print("Old password isn't the same");
      } else {
        isOldPasswordMatched = true;
        print("Old Pass Worked");
      }
    } else {
      print('The response failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(fit: StackFit.loose, children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 8),
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
            height: 1100,
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
                      height: 1070,
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
                                      return '*Please enter your old password';
                                    }
                                    if (isOldPasswordMatched == false) {
                                      isOldPasswordMatched = true;
                                      return '*Old password is not the same';
                                    }
                                    return null;
                                  },
                                  controller: _oldPasswordController,
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
                                            color: Color.fromARGB(
                                                255, 0, 126, 223),
                                            width: 2.0),
                                      ),
                                      // fill color
                                      filled: true,
                                      fillColor: Colors.white,
                                      //Outlines
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 5.0)),
                                      //Text
                                      labelText: 'Enter your old password',
                                      labelStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 90, 90, 90),
                                          fontFamily: 'BebasNeuePro',
                                          fontSize: 30,
                                          fontWeight: FontWeight.w300),
                                      hintText: 'Old Password'),
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
                                      return '*Please enter your new password';
                                    }
                                    if (value.length < 8) {
                                      return '*Your password needs at least 8 characters';
                                    }
                                    return null;
                                  },
                                  controller: _newPasswordTextController,
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
                                            color: Color.fromARGB(
                                                255, 0, 126, 223),
                                            width: 2.0),
                                      ),
                                      // fill color
                                      filled: true,
                                      fillColor: Colors.white,
                                      //Outlines
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 5.0)),
                                      //Text
                                      labelText: 'Enter your new password',
                                      labelStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 90, 90, 90),
                                          fontFamily: 'BebasNeuePro',
                                          fontSize: 30,
                                          fontWeight: FontWeight.w300),
                                      hintText: 'New Password'),
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
                                      return '*Please enter your new password (again)';
                                    }
                                    if (value !=
                                        _newPasswordTextController.text) {
                                      return '*Your passwords do not match';
                                    }
                                    if (value.length < 8) {
                                      return '*Your password needs at least 8 characters';
                                    }
                                    return null;
                                  },
                                  controller: _newPasswordagainTextController,
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
                                            color: Color.fromARGB(
                                                255, 0, 126, 223),
                                            width: 2.0),
                                      ),
                                      // fill color
                                      filled: true,
                                      fillColor: Colors.white,
                                      //Outlines
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 5.0)),
                                      //Text
                                      labelText:
                                          'Enter your new password (again)',
                                      labelStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 90, 90, 90),
                                          fontFamily: 'BebasNeuePro',
                                          fontSize: 30,
                                          fontWeight: FontWeight.w300),
                                      hintText: 'New Password (again)'),
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
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    backgroundColor: const Color.fromARGB(
                                        255, 191, 241, 255),
                                    textStyle: const TextStyle(
                                        fontFamily: 'BebasNeuePro',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    changePassword(_oldPasswordController.text,
                                        _newPasswordTextController.text);
                                  }
                                },
                                child: const Text(
                                  'CHANGE PASSWORD',
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
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 8),
          child: MyAccountButtonBack(
            context: context,
            width: 40,
            height: 40,
            route: "/",
          ),
        ),
      ]),
    );
  }
}
