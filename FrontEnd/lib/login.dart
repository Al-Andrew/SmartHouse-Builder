import 'dart:convert';

import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:homepage/global_variables.dart';
import 'package:homepage/main.dart';
import 'package:http/http.dart';

class Login extends StatefulWidget {
  const Login();

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

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
                    child: LoginForm(
                        formKey: _formKey,
                        emailTextController: _emailTextController,
                        passwordTextController: _passwordTextController)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailTextController,
    required TextEditingController passwordTextController,
  })  : _formKey = formKey,
        _emailTextController = emailTextController,
        _passwordTextController = passwordTextController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;

  Future login(String emailOrUser, password) async {
    final headers = {"Content-type": "application/json"};

    if (emailOrUser.contains("@")) {
      var body = jsonEncode({'emailUser': emailOrUser, 'passUser': password});

      Response response = await post(
          Uri.parse(
              'https://smart-house-builder.azurewebsites.net/api/user/login'),
          body: body,
          headers: headers);

      print(response.body);

      if (response.statusCode == 200) {
        if (response.body == "-2") {
          print("E-mail not found");
        } else {
          userID = int.parse(response.body);
          isUserLogged = true;
          print("Login succesfully");
        }
      } else {
        print('failed');
      }
    } else {
      var body = jsonEncode({'nameUser': emailOrUser, 'passUser': password});

      Response response = await post(
          Uri.parse(
              'https://smart-house-builder.azurewebsites.net/api/user/login'),
          body: body,
          headers: headers);

      print(response.body);

      if (response.statusCode == 200) {
        if (response.body == "-1") {
          print("Username not found");
        } else {
          userID = int.parse(response.body);
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
    return Form(
      key: _formKey,
      child: Column(children: [
        CustomTextForm(
            errorMessage2: '*Please enter your Username/E-mail',
            labelText2: 'Enter Username/E-mail',
            hintText2: 'Username/E-mail',
            TextController: _emailTextController),
        CustomTextForm(
            errorMessage2: '*Please enter your password',
            labelText2: 'Enter Password',
            hintText2: 'Password',
            TextController: _passwordTextController),
        const SizedBox(height: 40),
        const SelectableText(
            'SmartHouseBuilder does not'
            '\nsell your personal information',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'BebasNeuePro', fontSize: 30)),
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
                  backgroundColor: const Color.fromARGB(255, 191, 241, 255),
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
    );
  }
}

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    Key? key,
    required TextEditingController TextController,
    required errorMessage2,
    required labelText2,
    required hintText2,
  })  : errorMessage = errorMessage2,
        labelText = labelText2,
        hintText = hintText2,
        _TextController = TextController,
        super(key: key);

  final TextEditingController _TextController;
  final String errorMessage;
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        elevation: 10.0,
        shadowColor: Colors.black,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return errorMessage;
            }
            return null;
          },
          controller: _TextController,
          minLines: 2,
          maxLines: 2,
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
              //Error styles
              errorStyle: const TextStyle(
                  color: Color.fromRGBO(3, 31, 255, 1), fontSize: 15),
              focusedErrorBorder: DecoratedInputBorder(
                  shadow: const [
                    BoxShadow(
                      color: Colors.blue,
                      blurRadius: 20,
                    )
                  ],
                  child: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 81, 255), width: 2.0))),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 126, 223), width: 2.0),
              ),
              // fill color
              filled: true,
              fillColor: Colors.white,
              //Outlines
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 5.0)),
              //Text
              labelText: labelText,
              labelStyle: const TextStyle(
                  color: Color.fromARGB(255, 90, 90, 90),
                  fontFamily: 'BebasNeuePro',
                  fontSize: 30,
                  fontWeight: FontWeight.w300),
              hintText: hintText),
        ),
      ),
    );
  }
}
