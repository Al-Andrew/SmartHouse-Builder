import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:homepage/forum/utilities/Utilities.dart';
import 'package:homepage/homepage.dart';
import 'package:homepage/main.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  /////---->>>Functia cu care preiau parametrii
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> onPressed(
      String topic, String description) {
    print(topic);
    print(description);
    //-----cum le bag in baza de date---//
    /*
    http.p(URI.Parse())
     */
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          (topic + "\n" + description),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DescriptionField descriptionField = DescriptionField();
    TopicTextField topicTextField = TopicTextField();
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            {
              ///--------------Desktop Mode----------------------///

              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Stack(children: [
                        CustomTitle(
                          text: "Create a Post",
                          fontSize: 35,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: ButtonBack(
                                context: context, width: 40, height: 40),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                        ////---->aici e partea pentru post,fac dreptunghiul rotunjit
                        constraints: BoxConstraints(
                          minHeight: max(400, constraints.maxHeight - 150),
                          minWidth: double.infinity,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 182, 221, 254),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        margin: EdgeInsets.fromLTRB(
                            min(100, constraints.maxWidth / 15),
                            10,
                            min(100, constraints.maxWidth / 15),
                            10),
                        child: Column(
                          children: [
                            ///////Aici am prima parte, trebuie facuta sub forma de clasa neaparat!
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                              child: Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "TOPIC:",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  topicTextField,
                                ],
                              ),
                            ),
                            ////Aici am pus description
                            Container(
                              constraints:
                                  BoxConstraints(minWidth: double.maxFinite),
                              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: Text(
                                "DESCRIPTION :",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                            //////Aici am fieldul cu textul de la descriere
                            descriptionField,
                            /////Aici pun butonul pentru creearea postului
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: GradientButton(
                                  child: Text("Create Post"),
                                  isEnabled: true,
                                  width: 200,
                                  height: 100,
                                  onPressed: () => this.onPressed(
                                      topicTextField.textField(),
                                      descriptionField.textDescription())),
                            ),
                          ],
                        )),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

////let's make the classes
/*
_class ca sa imi dau seama ca e propriul meu object definit
 */

/////////----Clasa pentru TopicTextField

class TopicTextField extends StatefulWidget {
  TopicTextField();
  var myTopicTextFieldState = _TopicTextFieldState();
  @override
  State<TopicTextField> createState() => myTopicTextFieldState;
  String textField() => myTopicTextFieldState.textField;
}

class _TopicTextFieldState extends State<TopicTextField> {
  var myControllerTextFieldState = TextEditingController();
  @override
  String get textField {
    return "topic : " + myControllerTextFieldState.text;
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(100, 0, 30, 0),
      child: TextField(
        controller: myControllerTextFieldState,
        decoration: InputDecoration(
            fillColor: Color.fromARGB(255, 130, 230, 239),
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(45)),
            hintText: "Write your wanted topic in here"),
      ),
    );
  }
}

///////-------Clasa pentru DescriptionField

class DescriptionField extends StatefulWidget {
  DescriptionField();
  _DescriptionFieldState myDescriptionFieldState = _DescriptionFieldState();
  @override
  State<DescriptionField> createState() => myDescriptionFieldState;
  String textDescription() {
    return "description : " + myDescriptionFieldState.textDescription;
  }

  TextEditingController myDescriptionEditingController() {
    return myDescriptionFieldState.myDescriptionController;
  } //////ca sa luam TextFieldControllerul
}

class _DescriptionFieldState extends State<DescriptionField> {
  ///cine imi da acces la informatia din description field
  var myDescriptionController = TextEditingController();
  TextEditingController get descriptionController {
    return myDescriptionController;
  }

  ///cum iau informatia de acolo
  String get textDescription {
    return myDescriptionController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: TextField(
        controller: myDescriptionController,
        decoration: InputDecoration(
            fillColor: Color.fromARGB(255, 130, 230, 239),
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: "You can write about the insight of the article in here"),
        keyboardType: TextInputType.multiline,
        minLines: 10,
        maxLines: 100,
      ),
    );
  }
}

///////////------Create Post Button
class GradientButton extends StatelessWidget {
  final Widget child;
  // final Gradient gradient;
  final double width;
  final double height;
  final bool isEnabled;
  final Function onPressed;

  const GradientButton({
    Key? key,
    required this.child,
    // this.gradient,
    required this.isEnabled,
    required this.width,
    required this.height,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _statusColor;
    if (isEnabled != null) {
      // Show gradient color by making material widget transparent
      if (isEnabled == true) {
        _statusColor = Colors.transparent;
      } else {
        // Show grey color if isEnabled is false
        _statusColor = Colors.grey;
      }
    } else {
      // Show grey color if isEnabled is null
      _statusColor = Colors.transparent;
    }

    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          colors: [
            Color(0xFF3186E3),
            Color(0xFF1D36C4),
          ],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
        ),
      ),
      child: Material(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(32)),
          color: _statusColor,
          child: InkWell(
              borderRadius: BorderRadius.circular(32),
              onTap: () => onPressed(),
              child: Padding(
                padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: Center(
                  child: child,
                ),
              ))),
    );
  }
}
