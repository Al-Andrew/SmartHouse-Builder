import 'dart:convert';

import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:homepage/global_variables.dart';
import 'package:http/http.dart';

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
                  child: RegisterForm(
                      formKey: _formKey,
                      emailTextController: _emailTextController,
                      emailagainTextController: _emailagainTextController,
                      passwordTextController: _passwordTextController,
                      passwordagainTextController: _passwordagainTextController,
                      usernameTextController: _usernameTextController),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  RegisterForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailTextController,
    required TextEditingController passwordTextController,
    required TextEditingController emailagainTextController,
    required TextEditingController passwordagainTextController,
    required TextEditingController usernameTextController,
  })  : _formKey = formKey,
        _emailTextController = emailTextController,
        _passwordTextController = passwordTextController,
        _passwordagainTextController = passwordagainTextController,
        _emailagainTextController = emailagainTextController,
        _usernameTextController = usernameTextController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;
  final TextEditingController _passwordagainTextController;
  final TextEditingController _emailagainTextController;
  final TextEditingController _usernameTextController;

  String errorMesageForUsernameFromResponse = 'a';
  String errorMesageForPasswordFromResponse = 'b';
  String errorMesageForEmailFromResponse = 'c';

  Future register(String username, password, email) async {
    final headers = {"Content-type": "application/json"};

    var body = jsonEncode({
      'nameUser': username,
      'emailUser': email,
      'passUser': password,
    });

    Response response = await post(
        Uri.parse(
            'https://smart-house-builder.azurewebsites.net/api/user/register'),
        body: body,
        headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      if (response.body == "-1") {
        errorMesageForUsernameFromResponse = "Username is already taken";
        print("Username is already taken");
      } else if (response.body == "-2") {
        errorMesageForEmailFromResponse = "Email is already taken";
        print("Email is already taken");
      } else {
        userID = int.parse(response.body);
        isUserLogged = true;
        print("Login succesfully");
      }
    } else {
      print('The response failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        const SizedBox(height: 20),
        CustomTextForm(
          errorMessage2: '*Please enter your username',
          labelText2: 'Enter Username',
          hintText2: 'Username',
          TextController: _usernameTextController,
          errorMessageAfterHittingRegister2: errorMesageForUsernameFromResponse,
        ),
        CustomTextForm(
          errorMessage2: '*Please enter your password',
          labelText2: 'Enter password',
          hintText2: 'password',
          TextController: _passwordTextController,
          errorMessageAfterHittingRegister2: errorMesageForPasswordFromResponse,
        ),
        CustomTextForm(
          errorMessage2: '*Please enter your password again',
          labelText2: 'Enter password (again)',
          hintText2: 'Password',
          TextController: _passwordagainTextController,
          errorMessageAfterHittingRegister2: errorMesageForPasswordFromResponse,
        ),
        CustomTextForm(
          errorMessage2: '*Please enter your e-mail',
          labelText2: 'Enter e-mail',
          hintText2: 'E-mail',
          TextController: _emailTextController,
          errorMessageAfterHittingRegister2: errorMesageForEmailFromResponse,
        ),
        CustomTextForm(
          errorMessage2: '*Please enter your e-mail again',
          labelText2: 'Enter e-mail (again)',
          hintText2: 'E-mail',
          TextController: _emailagainTextController,
          errorMessageAfterHittingRegister2: errorMesageForEmailFromResponse,
        ),
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
                if (_passwordTextController.text.toString() !=
                    _passwordagainTextController.text.toString()) {
                  print(_passwordTextController.text.toString());
                  print(_passwordagainTextController.text.toString());

                  errorMesageForPasswordFromResponse =
                      'The passwords do not match';
                } else {
                  errorMesageForPasswordFromResponse = '';
                }

                if (_formKey.currentState!.validate()) {}
              },
              child: const Text(
                'CREATE ACCOUNT',
                textAlign: TextAlign.center,
              )),
        ),
      ]),
    );
  }
}

class CustomTextForm extends StatelessWidget {
  const CustomTextForm(
      {Key? key,
      required TextEditingController TextController,
      required errorMessage2,
      required labelText2,
      required hintText2,
      errorMessageAfterHittingRegister2})
      : errorMessage = errorMessage2,
        errorMessageAfterHittingRegister = errorMessageAfterHittingRegister2,
        labelText = labelText2,
        hintText = hintText2,
        _TextController = TextController,
        super(key: key);

  final TextEditingController _TextController;
  final String errorMessage;
  final String errorMessageAfterHittingRegister;
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
            if (errorMessageAfterHittingRegister != '') {
              return errorMessageAfterHittingRegister;
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
