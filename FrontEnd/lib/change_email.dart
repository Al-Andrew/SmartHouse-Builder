import 'dart:io';

import 'package:control_style/control_style.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:homepage/global_variables.dart';
import 'package:homepage/myAccountButtonBack.dart';
import 'package:http/http.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({Key? key}) : super(key: key);

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _newEmailTextController = TextEditingController();
  final TextEditingController _newEmailagainTextController =
      TextEditingController();
  final TextEditingController _oldEmailController = TextEditingController();

  late bool isOldEmailMatched = true;

  Future<void> ChangeEmail(String oldEmail, String newEmail) async {
    final queryParameters = {
      'userId': '$userID',
      'oldEmail': oldEmail,
      'newEmail': newEmail,
    };
    final uri = Uri.http('smart-house-builder.azurewebsites.net',
        '/api/user/changeEmail', queryParameters);
    var headers = {
      HttpHeaders.authorizationHeader: 'Token $String',
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    Response response = await put(uri, headers: headers);

    if (response.statusCode == 200) {
      if (response.body == "-1") {
        isOldEmailMatched = false;
        print("Old E-mail isn't the same");
      } else {
        isOldEmailMatched = true;
        print("Old E-mail Worked");
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
                                      return '*Please enter your old e-mail';
                                    }
                                    if (isOldEmailMatched == false) {
                                      isOldEmailMatched = true;
                                      return '*Old e-mail is not the same';
                                    }
                                    return null;
                                  },
                                  controller: _oldEmailController,
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
                                      labelText: 'Enter your old e-mail',
                                      labelStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 90, 90, 90),
                                          fontFamily: 'BebasNeuePro',
                                          fontSize: 30,
                                          fontWeight: FontWeight.w300),
                                      hintText: 'Old E-mail'),
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
                                      return '*Please enter your new e-mail';
                                    }
                                    if (EmailValidator.validate(value) ==
                                        false) {
                                      return '*The e-mail is not valid';
                                    }
                                    return null;
                                  },
                                  controller: _newEmailTextController,
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
                                      labelText: 'Enter your new e-mail',
                                      labelStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 90, 90, 90),
                                          fontFamily: 'BebasNeuePro',
                                          fontSize: 30,
                                          fontWeight: FontWeight.w300),
                                      hintText: 'New E-mail'),
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
                                      return '*Please enter your new e-mail (again)';
                                    }
                                    if (value != _newEmailTextController.text) {
                                      return '*Your e-mails do not match';
                                    }
                                    if (EmailValidator.validate(value) ==
                                        false) {
                                      return '*The e-mail is not valid';
                                    }
                                    return null;
                                  },
                                  controller: _newEmailagainTextController,
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
                                          'Enter your new e-mail (again)',
                                      labelStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 90, 90, 90),
                                          fontFamily: 'BebasNeuePro',
                                          fontSize: 30,
                                          fontWeight: FontWeight.w300),
                                      hintText: 'New e-mail (again)'),
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
                                    ChangeEmail(_oldEmailController.text,
                                        _newEmailTextController.text);
                                  }
                                },
                                child: const Text(
                                  'CHANGE E-MAIL',
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
