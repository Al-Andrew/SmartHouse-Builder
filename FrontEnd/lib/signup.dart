import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp();

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isForgetPasswordClicked = false;
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
                Colors.cyanAccent,
                Colors.blueAccent,
              ],
            ),
            borderRadius: BorderRadius.circular(15)),
        height: 450,
        width: 450,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'Log in',
              style: TextStyle(
                  fontSize: 40,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..color = Colors.blue[700]!,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                SizedBox(
                    width: 300,
                    height: 300,
                    child: isForgetPasswordClicked != true
                        ? LoginForm(
                            formKey: _formKey,
                            emailTextController: _emailTextController,
                            passwordTextController: _passwordTextController)
                        : const Text(' ')),
                TextButton.icon(
                    icon: const Icon(Icons.portrait_rounded),
                    style: TextButton.styleFrom(
                        primary: Colors.indigo,
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {
                      setState(() {
                        if (!isForgetPasswordClicked) {
                          isForgetPasswordClicked = true;
                        } else {
                          isForgetPasswordClicked = false;
                        }
                      });
                    },
                    label: Text(isForgetPasswordClicked
                        ? 'Log in'
                        : 'Forgot Password')),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'SmartHouseBuilder does not sell '
                  'your personal information!',
                  style: TextStyle(fontSize: 10),
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
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
          padding: const EdgeInsets.all(15.0),
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
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                backgroundColor: Colors.grey,
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },
            child: const Text('SIGN IN'))
      ]),
    );
  }
}
