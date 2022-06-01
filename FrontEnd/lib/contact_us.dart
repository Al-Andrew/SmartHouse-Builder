import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homepage/widgets/HomepageBuildSection.dart';
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
                              child: customHintTextField(
                                  title: "First Name",
                                  controller: controllerFirstName,
                                  minLines: 1,
                                  maxLines: 1,
                                  lengthOfText: 15),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5.0, left: 5.0),
                            child: SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 66 / 400,
                              child: customHintTextField(
                                  title: "Last Name",
                                  controller: controllerLastName,
                                  minLines: 1,
                                  maxLines: 1,
                                  lengthOfText: 15),
                            ),
                          )
                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 5.0, left: 15.0),
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: customHintTextField(
                                title: "Your e-mail address",
                                controller: controllerEmail,
                                minLines: 1,
                                maxLines: 1,
                                lengthOfText: 40),
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
                            child: customHintTextField(
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
                          onPressed: () => sendEmail(
                              firstName: controllerFirstName.text,
                              lastName: controllerLastName.text,
                              email: controllerEmail.text,
                              message: controllerMessage.text),
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

Widget customHintTextField(
        {required String title,
        required TextEditingController controller,
        required int minLines,
        required int maxLines,
        required int lengthOfText}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );

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
        customFAQTextBox(
            title: 'Can I buy products? How?',
            color: const Color.fromARGB(255, 255, 255, 255)),
        customFAQTextBox(
            title:
                'There are more ways of purchasing products. The first way is by clicking on the “Marketplace” button, that will lead to the page which contains all the available products. Another way is by starting to create your own house layout. You’ll receive some products suggestions you may use to decorate your house. If there is any product you are interested in, you can click “Add to cart” in order to purchase the product.',
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
