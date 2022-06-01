import 'dart:convert';
import 'package:homepage/widgets/HomepageBuildSection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:http/http.dart' as http;

class ContactUs extends StatefulWidget {
  const ContactUs();

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerMessage = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
      //DESKTOP MODE
      //
      //
      //
      //
      //
      if (constraints.maxWidth > 900) {
        return SingleChildScrollView(
            child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              const HomepageBuildSection(),
              const SizedBox(height: 50),
              GradientText(
                'CONTACT US',
                style: const TextStyle(
                    fontSize: 50,
                    color: Colors.cyan,
                    fontFamily: 'BarlowCondensed'),
                colors: const [
                  Colors.cyanAccent,
                  Colors.cyan,
                  Colors.indigo,
                  //add mroe colors here.
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(top: 45),
                  width: MediaQuery.of(context).size.width * 6 / 10,
                  child: const SelectableText(
                      'We\'d love to hear from you! Whether you\'re curious about our features, '
                      'ready to share your feedback or having any issues using our application,'
                      '\n don\'t hesitate to get in touch with us!',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontFamily: 'BebasNeuePro', fontSize: 30))),
              Container(
                margin: const EdgeInsets.only(top: 45.0, bottom: 30.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: const [
                        SelectableText('Check our Github account!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.cyan,
                                fontFamily: 'BarlowCondensed',
                                fontSize: 25)),
                        Image(
                          image: AssetImage('assets/qr_code.png'),
                          alignment: Alignment.center,
                          height: 300,
                          width: 300,
                          // fit: BoxFit.fitHeight,
                        )
                      ],
                    )),
              ),
              Row(children: [
                Container(
                    margin: const EdgeInsets.only(
                        top: 20.0, left: 70.0, right: 35.0),
                    height: 500,
                    width: MediaQuery.of(context).size.width * 1 / 2 - 100,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.indigo,
                            Colors.cyan,
                            Colors.cyanAccent
                          ],
                        )),
                    child: const FAQ()),
                Container(
                  margin:
                      const EdgeInsets.only(top: 20.0, left: 35.0, right: 35.0),
                  height: 500,
                  width: MediaQuery.of(context).size.width * 1 / 2 - 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.indigo, Colors.cyan, Colors.cyanAccent],
                      )),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.bottomLeft,
                          margin: const EdgeInsets.only(top: 20.0, left: 15.0),
                          child: const SelectableText('Reach us right away!',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'BebasNeuePro',
                                  fontSize: 40,
                                  color: Colors.indigo))),
                      Column(
                        children: [
                          Container(
                              alignment: Alignment.bottomLeft,
                              margin:
                                  const EdgeInsets.only(top: 30.0, left: 15.0),
                              child: const SelectableText(
                                  'Your personal information:',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'BebasNeuePro',
                                      fontSize: 25))),
                          Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 5.0, left: 15.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      66 /
                                      400,
                                  child: customHintTextField(
                                      formKey: _formKey,
                                      title: "First Name",
                                      controller: controllerFirstName,
                                      lengthOfText: 15),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 5.0, left: 5.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      66 /
                                      400,
                                  child: customHintTextField(
                                      formKey: _formKey,
                                      title: "Last Name",
                                      controller: controllerLastName,
                                      lengthOfText: 15),
                                ),
                              )
                            ],
                          ),
                          Container(
                              margin:
                                  const EdgeInsets.only(top: 5.0, left: 15.0),
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: customHintTextField(
                                    formKey: _formKey,
                                    title: "Your e-mail address",
                                    controller: controllerEmail,
                                    lengthOfText: 40),
                              )),
                          Container(
                              alignment: Alignment.bottomLeft,
                              margin:
                                  const EdgeInsets.only(left: 15.0, top: 20.0),
                              child: const SelectableText('Your message:',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'BebasNeuePro',
                                      fontSize: 25))),
                          Container(
                              margin:
                                  const EdgeInsets.only(top: 5.0, left: 15.0),
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: customHintTextField(
                                    formKey: _formKey,
                                    title: "Write down your message!",
                                    controller: controllerMessage,
                                    minLines: 6,
                                    maxLines: 10,
                                    lengthOfText: 400),
                              ))
                        ],
                      ),
                      const SizedBox(height: 30),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(16.0),
                                primary: Colors.white,
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                if (controllerEmail.text.isEmpty ||
                                    controllerFirstName.text.isEmpty ||
                                    controllerLastName.text.isEmpty ||
                                    controllerMessage.text.isEmpty ||
                                    !controllerEmail.text.contains("@")) {
                                  showDialog(
                                      barrierColor:
                                          Colors.blue.withOpacity(0.5),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                              side: const BorderSide(
                                                  width: 8,
                                                  color: Color.fromARGB(
                                                      255, 46, 111, 191))),
                                          child: SizedBox(
                                            height: 280,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  GradientText(
                                                    'It seems like the text fields are incomplete. \n Try again!',
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        fontSize: 30,
                                                        color: Colors.cyan,
                                                        fontFamily:
                                                            'BebasNeuePro'),
                                                    colors: const [
                                                      Colors.cyanAccent,
                                                      Colors.cyan,
                                                      Colors.indigo,
                                                      //add mroe colors here.
                                                    ],
                                                  ),
                                                  Image.network(
                                                      "https://i.ibb.co/H4hQNDY/pt2.png",
                                                      width: 100,
                                                      height: 100),
                                                  SizedBox(
                                                      width: 100.0,
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                          "Got it!",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    46,
                                                                    111,
                                                                    191),
                                                                // onPrimary: Colors
                                                                //     .white,
                                                                textStyle: const TextStyle(
                                                                    fontFamily:
                                                                        'BebasNeuePro',
                                                                    fontSize:
                                                                        25)),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                } else {
                                  sendEmail(
                                      firstName: controllerFirstName.text,
                                      lastName: controllerLastName.text,
                                      email: controllerEmail.text,
                                      message: controllerMessage.text);

                                  showDialog(
                                      barrierColor:
                                          Colors.blue.withOpacity(0.5),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                              side: const BorderSide(
                                                  width: 8,
                                                  color: Color.fromARGB(
                                                      255, 46, 111, 191))),
                                          child: SizedBox(
                                            height: 280,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  GradientText(
                                                    'Your message is now sent.\nOur team will respond you as soon as possible!',
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        fontSize: 30,
                                                        color: Colors.cyan,
                                                        fontFamily:
                                                            'BebasNeuePro'),
                                                    colors: const [
                                                      Colors.cyanAccent,
                                                      Colors.cyan,
                                                      Colors.indigo,
                                                      //add mroe colors here.
                                                    ],
                                                  ),
                                                  Image.network(
                                                      "https://i.ibb.co/LNzpFgQ/contact.png",
                                                      width: 100,
                                                      height: 100),
                                                  SizedBox(
                                                      width: 100.0,
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                          "Got it!",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    46,
                                                                    111,
                                                                    191),
                                                                // onPrimary: Colors
                                                                //     .white,
                                                                textStyle: const TextStyle(
                                                                    fontFamily:
                                                                        'BebasNeuePro',
                                                                    fontSize:
                                                                        25)),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                }
                              },
                              child: GradientText(
                                'SUBMIT',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.cyan,
                                    fontFamily: 'BarlowCondensed'),
                                colors: const [
                                  Colors.cyanAccent,
                                  Colors.cyan,
                                  Colors.indigo,
                                  //add mroe colors here.
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]),
              const SizedBox(height: 50)
            ])));
      } else {
        // MOBILE MODE
        //
        //
        //
        //
        //
        //
        //
        return SingleChildScrollView(
            child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              const SizedBox(height: 50),
              GradientText(
                'CONTACT US',
                style: const TextStyle(
                    fontSize: 50,
                    color: Colors.cyan,
                    fontFamily: 'BarlowCondensed'),
                colors: const [
                  Colors.cyanAccent,
                  Colors.cyan,
                  Colors.indigo,
                  //add mroe colors here.
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(top: 45),
                  width: MediaQuery.of(context).size.width * 6 / 10,
                  child: const SelectableText(
                      'We\'d love to hear from you! Whether you\'re curious about our features, '
                      'ready to share your feedback or having any issues using our application,'
                      '\n don\'t hesitate to get in touch with us!',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontFamily: 'BebasNeuePro', fontSize: 30))),
              Container(
                margin: const EdgeInsets.only(top: 45.0, bottom: 30.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: const [
                        SelectableText('Check our Github account!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.cyan,
                                fontFamily: 'BarlowCondensed',
                                fontSize: 25)),
                        Image(
                          image: AssetImage('assets/qr_code.png'),
                          alignment: Alignment.center,
                          height: 300,
                          width: 300,
                          // fit: BoxFit.fitHeight,
                        )
                      ],
                    )),
              ),
              Column(children: [
                Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    height: 500,
                    width: MediaQuery.of(context).size.width * 70 / 100,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.indigo,
                            Colors.cyan,
                            Colors.cyanAccent
                          ],
                        )),
                    child: const FAQ()),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  height: 500,
                  width: MediaQuery.of(context).size.width * 70 / 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.indigo, Colors.cyan, Colors.cyanAccent],
                      )),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.bottomLeft,
                          margin: const EdgeInsets.only(top: 20.0, left: 15.0),
                          child: const SelectableText('Reach us right away!',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'BebasNeuePro',
                                  fontSize: 40,
                                  color: Colors.indigo))),
                      Column(
                        children: [
                          Container(
                              alignment: Alignment.bottomLeft,
                              margin:
                                  const EdgeInsets.only(top: 30.0, left: 15.0),
                              child: const SelectableText(
                                  'Your personal information:',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'BebasNeuePro',
                                      fontSize: 25))),
                          Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 5.0, left: 15.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      (32 / 100),
                                  child: customHintTextField(
                                      formKey: _formKey,
                                      title: "First Name",
                                      controller: controllerFirstName,
                                      lengthOfText: 15),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 5.0, left: 5.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      (31 / 100),
                                  child: customHintTextField(
                                      formKey: _formKey,
                                      title: "Last Name",
                                      controller: controllerLastName,
                                      lengthOfText: 15),
                                ),
                              )
                            ],
                          ),
                          Container(
                              margin:
                                  const EdgeInsets.only(top: 5.0, left: 15.0),
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    (64 / 100),
                                child: customHintTextField(
                                    formKey: _formKey,
                                    title: "Your e-mail address",
                                    controller: controllerEmail,
                                    lengthOfText: 40),
                              )),
                          Container(
                              alignment: Alignment.bottomLeft,
                              margin:
                                  const EdgeInsets.only(left: 15.0, top: 20.0),
                              child: const SelectableText('Your message:',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'BebasNeuePro',
                                      fontSize: 25))),
                          Container(
                              margin:
                                  const EdgeInsets.only(top: 5.0, left: 15.0),
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    (64 / 100),
                                child: customHintTextField(
                                    formKey: _formKey,
                                    title: "Write down your message!",
                                    controller: controllerMessage,
                                    minLines: 6,
                                    maxLines: 10,
                                    lengthOfText: 400),
                              ))
                        ],
                      ),
                      const SizedBox(height: 30),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(16.0),
                                primary: Colors.white,
                                textStyle: const TextStyle(fontSize: 20),
                              ),

                              //aici
                              onPressed: () {
                                if (controllerEmail.text.isEmpty ||
                                    controllerFirstName.text.isEmpty ||
                                    controllerLastName.text.isEmpty ||
                                    controllerMessage.text.isEmpty ||
                                    !controllerEmail.text.contains("@")) {
                                  showDialog(
                                      barrierColor:
                                          Colors.blue.withOpacity(0.5),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                              side: const BorderSide(
                                                  width: 8,
                                                  color: Color.fromARGB(
                                                      255, 46, 111, 191))),
                                          child: SizedBox(
                                            height: 280,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  GradientText(
                                                    'It seems like the text fields are incomplete. \n Try again!',
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        fontSize: 30,
                                                        color: Colors.cyan,
                                                        fontFamily:
                                                            'BebasNeuePro'),
                                                    colors: const [
                                                      Colors.cyanAccent,
                                                      Colors.cyan,
                                                      Colors.indigo,
                                                      //add mroe colors here.
                                                    ],
                                                  ),
                                                  Image.network(
                                                      "https://i.ibb.co/H4hQNDY/pt2.png",
                                                      width: 100,
                                                      height: 100),
                                                  SizedBox(
                                                      width: 100.0,
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                          "Got it!",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    46,
                                                                    111,
                                                                    191),
                                                                // onPrimary: Colors
                                                                //     .white,
                                                                textStyle: const TextStyle(
                                                                    fontFamily:
                                                                        'BebasNeuePro',
                                                                    fontSize:
                                                                        25)),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                } else {
                                  sendEmail(
                                      firstName: controllerFirstName.text,
                                      lastName: controllerLastName.text,
                                      email: controllerEmail.text,
                                      message: controllerMessage.text);

                                  showDialog(
                                      barrierColor:
                                          Colors.blue.withOpacity(0.5),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                              side: const BorderSide(
                                                  width: 8,
                                                  color: Color.fromARGB(
                                                      255, 46, 111, 191))),
                                          child: SizedBox(
                                            height: 280,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  GradientText(
                                                    'Your message is now sent.\nOur team will respond you as soon as possible!',
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        fontSize: 30,
                                                        color: Colors.cyan,
                                                        fontFamily:
                                                            'BebasNeuePro'),
                                                    colors: const [
                                                      Colors.cyanAccent,
                                                      Colors.cyan,
                                                      Colors.indigo,
                                                      //add mroe colors here.
                                                    ],
                                                  ),
                                                  Image.network(
                                                      "https://i.ibb.co/LNzpFgQ/contact.png",
                                                      width: 100,
                                                      height: 100),
                                                  SizedBox(
                                                      width: 100.0,
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                          "Got it!",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    46,
                                                                    111,
                                                                    191),
                                                                // onPrimary: Colors
                                                                //     .white,
                                                                textStyle: const TextStyle(
                                                                    fontFamily:
                                                                        'BebasNeuePro',
                                                                    fontSize:
                                                                        25)),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                }
                              },
                              child: GradientText(
                                'SUBMIT',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.cyan,
                                    fontFamily: 'BarlowCondensed'),
                                colors: const [
                                  Colors.cyanAccent,
                                  Colors.cyan,
                                  Colors.indigo,
                                  //add mroe colors here.
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]),
              const SizedBox(height: 50)
            ])));
      }
    })));
  }
}

Widget customHintTextField(
        {required String title,
        required TextEditingController controller,
        int minLines = 1,
        int maxLines = 1,
        required int lengthOfText,
        required GlobalKey<FormState> formKey}) =>
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '*Please enter your username/e-mail';
          }

          return null;
        },
        controller: controller,
        decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 255, 255, 255),
            filled: true,
            hintText: title),
        minLines: minLines,
        maxLines: maxLines,
        inputFormatters: [
          LengthLimitingTextInputFormatter(
              lengthOfText) //n is maximum number of characters you want in textfield
        ],
        keyboardType: TextInputType.multiline,
      )
    ]);

Widget customFAQTextBox({
  required String title,
  required Color color,
  double height = 50,
}) =>
    Container(
      margin: const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        color: color,
      ),
      height: height,
      width: 600,
      alignment: Alignment.center,
      child: SelectableText(title,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontFamily: 'BebasNeuePro',
            fontSize: 30,
          )),
    );

class FAQ extends StatefulWidget {
  const FAQ();
  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 15.0),
            child: const SelectableText('FAQ',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'BebasNeuePro',
                    fontSize: 50,
                    color: Colors.indigo))),
        customFAQTextBox(
            title: 'What is SHB?',
            color: const Color.fromARGB(255, 255, 255, 255)),
        customFAQTextBox(
            title:
                'SHB stands for Smart House Builder, a web app that allows you to create your dream house! You can modify your house layout to your liking and add different kinds of smart devices. Not only that, but you’ll get different suggestions depending the devices’ compatibility.',
            color: const Color.fromARGB(100, 255, 255, 255),
            height: 200),
        const SizedBox(height: 7),
        customFAQTextBox(
            title: 'How do I make an account?',
            color: const Color.fromARGB(255, 255, 255, 255)),
        customFAQTextBox(
            title:
                'By simply clicking on the “Sign Up” button that can be found on the upper right corner.',
            color: const Color.fromARGB(100, 255, 255, 255),
            height: 70),
        const SizedBox(height: 7),
        customFAQTextBox(
            title: 'I forgot my password, what can I do?',
            color: const Color.fromARGB(255, 255, 255, 255)),
        customFAQTextBox(
            title:
                'If you try to log in, but you realize you have forgotten your password, don’t worry! Just click on the “Forgot password?” button, which will lead you to a new page. You will be requested to write your email address that you used to create your account. After that, an email will be sent to you which will contain a new random password. After accessing your account with the new password, go to settings and change that password asap.',
            color: const Color.fromARGB(100, 255, 255, 255),
            height: 200),
        const SizedBox(height: 7),
      ]),
    );
  }
}

Future sendEmail({
  required String firstName,
  required String lastName,
  required String email,
  required String message,
}) async {
  const serviceId = 'service_1x8n2vo';
  const templateId = 'template_cvc84e9';
  const userId = 'fwYzE-ioCHIsk4MrG';

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': {
        'user_name': firstName + lastName,
        'user_message': message,
        'user_email': email,
      }
    }),
  );

  print(response.body);
}
