import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register();

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _emailagainTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _passwordagainTextController = TextEditingController();
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
            borderRadius: BorderRadius.circular(0)),
        height: 700,
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
                    height: 600,
                    child: LoginForm(
                        formKey: _formKey,
                        emailTextController: _emailTextController,
                        emailagainTextController: _emailagainTextController,
                        passwordTextController: _passwordTextController,
                        passwordagainTextController: _passwordagainTextController,
                        usernameTextController: _usernameTextController
                    ),

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
    required TextEditingController emailagainTextController,
    required TextEditingController passwordagainTextController,
    required TextEditingController usernameTextController,
  })  : _formKey = formKey,
        _emailTextController = emailTextController,
        _passwordTextController = passwordTextController,
        _passwordagainTextController= passwordagainTextController,
        _emailagainTextController = emailagainTextController,
        _usernameTextController = usernameTextController,

        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;
  final TextEditingController  _passwordagainTextController;
  final TextEditingController _emailagainTextController;
  final TextEditingController  _usernameTextController;


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
                return '*Please enter your username';
              }
              return null;
            },
            controller: _usernameTextController,
            decoration: InputDecoration(
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                    const BorderSide(color: Colors.black, width: 2.0)),
                labelText: 'Enter Username',
                labelStyle: const TextStyle(color: Colors.black),
                hintText: 'Username'),
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
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '*Please enter your password again';
              }
              return null;
            },
            controller: _passwordagainTextController,
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
                labelText: 'Enter password again',
                labelStyle: const TextStyle(color: Colors.black),
                hintText: 'Password'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '*Please enter your e-mail';
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
                labelText: 'Enter E-mail',
                labelStyle: const TextStyle(color: Colors.black),
                hintText: 'E-mail'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '*Please enter your e-mail again';
              }
              return null;
            },
            controller: _emailagainTextController,
            decoration: InputDecoration(
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                    const BorderSide(color: Colors.black, width: 2.0)),
                labelText: 'Enter E-mail again',
                labelStyle: const TextStyle(color: Colors.black),
                hintText: 'E-mail'),
          ),
        )
        ,
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
            child: const Text('CREATE ACCOUNT'))
      ]),
    );
  }
}