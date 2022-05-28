import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

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
            ) ,
            borderRadius: BorderRadius.circular(0)),
        height: 500,
        width: 500,
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    width: 400,
                    height: 400,
                    child:
                    LoginForm(
                        formKey: _formKey,
                        emailTextController: _emailTextController,
                        passwordTextController: _passwordTextController)
                ),
                Container(
                    padding: const EdgeInsets.all(20.0),
                    child: const SelectableText(
                        ' SmartHouseBuilder does not sell '
                            'your personal information!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'BebasNeuePro', fontSize: 20))
                )
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

  void login(String email , password) async {

    try{

      Response response = await post(
          Uri.parse('https://smart-house-builder.azurewebsites.net/api/user'),
          body: {
            'emailUser' : email,
            'passUser' : password
          }
      );

      if(response.statusCode == 200){

        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');

      }else {
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '*Please enter your username/e-mail';
              }
              return null;
            },
            controller: _emailTextController,
            decoration: InputDecoration(
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                    const BorderSide(color: Colors.black, width: 2.0)),
                labelText: 'Enter Username/E-mail',
                labelStyle: const TextStyle(color: Colors.black),
                hintText: 'Username/E-mail'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '*Please enter your password';
                }
                return null;
              },
              controller: _passwordTextController,
              obscureText: true,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide:
                      const BorderSide(color: Colors.black, width: 2.0)),
                  labelText: 'Enter password',
                  labelStyle: const TextStyle(color: Colors.black),
                  hintText: 'Password')),
        ),
        TextButton(
            style: TextButton.styleFrom(
                primary: Colors.black,
                padding: const EdgeInsets.all(12.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Colors.lightBlueAccent,
                textStyle:
                const TextStyle(fontFamily: 'BebasNeuePro',
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },
            child: const Text('Login'))
      ]),
    );
  }
}