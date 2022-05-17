import 'package:flutter/material.dart';
import 'package:homepage/widgets/HomepageBuildSection.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ContactUs extends StatefulWidget {
  const ContactUs();

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          const HomepageBuildSection(),
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
              padding: const EdgeInsets.all(45.0),
              width: MediaQuery.of(context).size.width * 6 / 10,
              child: const SelectableText(
                  'We\'d love to hear from you! Whether you\'re curious about our features, '
                  'ready to share your feedback or having any issues using our application,'
                  '\n don\'t hesitate to get in touch with us!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'BebasNeuePro', fontSize: 30))),
          Container(
            margin: const EdgeInsets.only(bottom: 30.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Image(
                  image: AssetImage('assets/qr_code.png'),
                  alignment: Alignment.center,
                  height: 300,
                  width: 300,
                  // fit: BoxFit.fitHeight,
                )),
          ),
          Row(children: [
            Container(
              margin: const EdgeInsets.only(top: 20.0, left: 70.0, right: 35.0),
              height: 500,
              width: MediaQuery.of(context).size.width * 1 / 2 - 100,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.indigo, Colors.cyan, Colors.cyanAccent],
                  )),
              child: Container(
                child: const FAQ(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0, left: 35.0, right: 35.0),
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
                              fontSize: 30,
                              color: Colors.indigo))),
                  Column(
                    children: [
                      Container(
                          alignment: Alignment.bottomLeft,
                          margin: const EdgeInsets.only(top: 30.0, left: 15.0),
                          child: const SelectableText(
                              'Your personal information:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'BebasNeuePro', fontSize: 20))),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5.0, left: 15.0),
                            child: SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 66 / 400,
                              child: const NameTextField(),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5.0, left: 5.0),
                            child: SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 66 / 400,
                              child: const LastNameTextField(),
                            ),
                          )
                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 5.0, left: 15.0),
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: const MailTextField(),
                          )),
                      Container(
                          alignment: Alignment.bottomLeft,
                          margin: const EdgeInsets.only(left: 15.0, top: 20.0),
                          child: const SelectableText('Your message:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'BebasNeuePro', fontSize: 20))),
                      Container(
                          margin: const EdgeInsets.only(top: 5.0, left: 15.0),
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: const MessageTextField(),
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
                          onPressed: () {},
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
}

class NameTextField extends StatefulWidget {
  const NameTextField();
  @override
  State<NameTextField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameTextField> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 255, 255, 255),
          filled: true,
          hintText: "First Name"),
    );
  }
}

class LastNameTextField extends StatefulWidget {
  const LastNameTextField();
  @override
  State<LastNameTextField> createState() => _LastNameFieldState();
}

class _LastNameFieldState extends State<LastNameTextField> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 255, 255, 255),
          filled: true,
          hintText: "Last Name"),
    );
  }
}

class MailTextField extends StatefulWidget {
  const MailTextField();
  @override
  State<MailTextField> createState() => _MailFieldState();
}

class _MailFieldState extends State<MailTextField> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 255, 255, 255),
          filled: true,
          hintText: "Your email address"),
    );
  }
}

class MessageTextField extends StatefulWidget {
  const MessageTextField();
  @override
  State<MessageTextField> createState() => _MessageFieldState();
}

class _MessageFieldState extends State<MessageTextField> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
            fillColor: Color.fromARGB(255, 255, 255, 255),
            filled: true,
            hintText: "Write down your message!"),
        minLines: 6,
        maxLines: 10);
  }
}

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
        Container(
          margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          height: 50,
          width: 600,
          alignment: Alignment.center,
          child: const SelectableText('Intrebare',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'BebasNeuePro',
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            color: Color.fromARGB(100, 255, 255, 255),
          ),
          height: 50,
          width: 600,
          alignment: Alignment.center,
          child: const SelectableText('Raspuns',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BebasNeuePro',
                fontSize: 30,
              )),
        ),
        Container(
          margin: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          height: 50,
          width: 600,
          alignment: Alignment.center,
          child: const SelectableText('Intrebare',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'BebasNeuePro',
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            color: Color.fromARGB(100, 255, 255, 255),
          ),
          height: 50,
          width: 600,
          alignment: Alignment.center,
          child: const SelectableText('Raspuns',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BebasNeuePro',
                fontSize: 30,
              )),
        ),
        Container(
          margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          height: 50,
          width: 600,
          alignment: Alignment.center,
          child: const SelectableText('Intrebare',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'BebasNeuePro',
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            color: Color.fromARGB(100, 255, 255, 255),
          ),
          height: 50,
          width: 600,
          alignment: Alignment.center,
          child: const SelectableText('Raspuns',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BebasNeuePro',
                fontSize: 30,
              )),
        ),
        Container(
          margin: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          height: 50,
          width: 600,
          alignment: Alignment.center,
          child: const SelectableText('Intrebare',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'BebasNeuePro',
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: const EdgeInsets.only(
              top: 5.0, left: 20.0, right: 20.0, bottom: 20.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            color: Color.fromARGB(100, 255, 255, 255),
          ),
          height: 50,
          width: 600,
          alignment: Alignment.center,
          child: const SelectableText('Raspuns',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'BebasNeuePro',
                fontSize: 30,
              )),
        ),
      ]),
    );
  }
}
