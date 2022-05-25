import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:homepage/forum/utilities/Utilities.dart';
import 'package:homepage/homepage.dart';
import 'package:homepage/main.dart';
import 'package:homepage/forum/classes/Tags.dart';
import 'package:homepage/forum/classes/PostClass.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  ///////here we can Insert the info into database
  void insertFunction() async {
    ////made in int
    int valHard = valueHard == false ? 0 : 1;
    int valSoft = valueSoft == false ? 0 : 1;
    int valQues = valueQuest == false ? 0 : 1;
    int valRevi = valueReview == false ? 0 : 1;
    int valSetup = valueSetup == false ? 0 : 1;
    /////------////
    int id = 5;

    Tags tags = new Tags(
      id: id,
      flagReview: valRevi,
      flagQuestion: valQues,
      flagSetup: valSetup,
      flagHard: valHard,
      flagSoft: valSoft,
    );
    //////I made my object with the tags

    var descField = descriptionField.descriptionController;
    var topicField = topicTextField.textFieldController;
    String topicText = topicField.text;
    String descText = descField.text;
    print("topic :" + topicField.text);
    print("description :" + descField.text);
    print("Review? :" + valueReview.toString() + " $valRevi");
    print("Question? :" + valueQuest.toString() + " $valQues");
    print("Setup? :" + valueSetup.toString() + " $valSetup");
    print("Hardware? :" + valueHard.toString() + " $valHard");
    print("Software? :" + valueSoft.toString() + " $valSoft");

    print("---------------------------------");

    //////----We try to add the object to the DataBase

    ////here we have the pop-up...fix the depricated method

    RegExp expTopic =
        RegExp((r'[a-zA-Z]{5,}')); //un cuvant cu cel putin 5 litere
    RegExpMatch? matchTopic = expTopic.firstMatch(topicText);
    bool goodTopic = matchTopic?[0] != null;

    ///for topic
    RegExp expDescription =
        RegExp((r'.{10,}')); //un cuvant cu cel putin 5 litere
    RegExpMatch? matchDescription = expDescription.firstMatch(descText);
    bool goodDescription = matchDescription?[0] != null;

    ///for description

    ///let's see what we should now in the code

    if (!goodTopic) {
      showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog(context,
            "Topic error", "There should be at least a word of 5 characters"),
      );
    } else if (!goodDescription) {
      showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog(
            context,
            "Description error",
            "There should be a description of at least 100 characters and now there are ${descText.length}"),
      );
    } else {
      bool yesOrNo = await _isYesOrNo();
      if (yesOrNo) {
        Post.addPost(5, 1, topicText, "05/11/2022", descText, "Marcel", tags);
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.of(context).pop();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (child) => HomePage(),
          ),
        );

        ///so we have only the menu
      } else {
        print("I did not want to post");
      }
    }

    ////Here the info is getting to the server
  }

  Future<bool> _isYesOrNo() async {
    return await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                actionsAlignment: MainAxisAlignment.center,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                title: const Text('All good!'),
                content:
                    const Text('Are you sure you want to create this Post?'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('Yes'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);

                      ///this is how we pass the value!
                    },
                    child: const Text('No'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                  ),
                ],
              );
            }) ??
        false;
  }

  TopicTextField topicTextField = TopicTextField();
  DescriptionField descriptionField = DescriptionField();
  bool? valueHard = false;
  bool? valueSoft = false;
  bool? valueQuest = false;
  bool? valueReview = false;
  bool? valueSetup = false;

  @override
  Widget build(BuildContext context) {
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
                                context: context,
                                width: 40,
                                height: 40,
                                route: '/'),
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
                            ////Here we have the Description
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
                            /////Description TextField
                            descriptionField,
                            //////the checkboxed
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                              child: Wrap(
                                direction: Axis.horizontal,
                                alignment: WrapAlignment.center,
                                spacing: 20,
                                runSpacing: 15,
                                children: <Widget>[
                                  checkBoxHard(),
                                  checkBoxQuest(),
                                  checkBoxRevi(),
                                  checkBoxSetup(),
                                  checkBoxSoft(),
                                ],
                              ),
                            ),

                            /////The button to create the Post
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: GradientButton(
                                child: Text("Create Post"),
                                isEnabled: true,
                                width: 200,
                                height: 100,
                                onPressed: () => insertFunction(),
                              ),
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

////failed to incapsulate it...,no widget or mount error
  ///Hardware
  Widget checkBoxHard() {
    return Container(
        constraints: BoxConstraints(maxWidth: 200, minWidth: 100),
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 2,
              offset: Offset(5, 5), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(45),
          color: Color.fromARGB(255, 173, 26, 26),
        ),
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text("Hardware"),
          value: valueHard,
          activeColor: Color.fromARGB(255, 55, 59, 62),
          onChanged: (value) {
            setState(() {
              this.valueHard = value;
            });
          },
        ));
  }

  /////Question
  Widget checkBoxQuest() {
    return Container(
      constraints: BoxConstraints(maxWidth: 200, minWidth: 100),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 2,
            offset: Offset(5, 5), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(45),
        color: Color.fromARGB(255, 170, 11, 219),
      ),
      child: Theme(
        data: ThemeData(
            unselectedWidgetColor: Color.fromARGB(255, 220, 220, 220)),
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            "Quest",
            style: TextStyle(color: Colors.white),
          ),
          value: valueQuest,
          activeColor: Colors.black,
          onChanged: (value) {
            setState(() {
              this.valueQuest = value;
            });
          },
        ),
      ),
    );
  }
  ////Review

  Widget checkBoxRevi() {
    return Container(
        constraints: BoxConstraints(maxWidth: 200, minWidth: 100),
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 2,
              offset: Offset(5, 5), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(45),
          color: Color.fromARGB(255, 251, 144, 4),
        ),
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text("Review"),
          value: valueReview,
          activeColor: Color.fromARGB(255, 55, 59, 62),
          onChanged: (value) {
            setState(() {
              this.valueReview = value;
            });
          },
        ));
  }

  ////Software

  Widget checkBoxSoft() {
    return Container(
        constraints: BoxConstraints(maxWidth: 200, minWidth: 100),
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 2,
              offset: Offset(5, 5), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(45),
          color: Color.fromARGB(255, 2, 2, 213),
        ),
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            "Software",
            style: TextStyle(color: Colors.white),
          ),
          value: valueSoft,
          activeColor: Color.fromARGB(255, 66, 148, 3),
          onChanged: (value) {
            setState(() {
              this.valueSoft = value;
            });
          },
        ));
  }

  ////Setup

  Widget checkBoxSetup() {
    return Container(
      constraints: BoxConstraints(maxWidth: 200, minWidth: 100),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 2,
            offset: Offset(5, 5), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(45),
        color: Color.fromARGB(255, 31, 236, 16),
      ),
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text("Setup"),
        value: valueSetup,
        activeColor: Color.fromARGB(255, 55, 59, 62),
        onChanged: (value) {
          setState(() {
            this.valueSetup = value;
          });
        },
      ),
    );
  }
}

////let's make the classes
/*
_class ca sa imi dau seama ca e propriul meu object definit
 */

/////////----Clasa pentru TopicTextField

class TopicTextField extends StatelessWidget {
  TopicTextField({Key? key}) : super(key: key);
  TextEditingController textFieldController = TextEditingController();
  TextEditingController get topicText {
    return textFieldController;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(100, 0, 30, 0),
      child: TextField(
        controller: textFieldController,
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

class DescriptionField extends StatelessWidget {
  TextEditingController myDescriptionController = TextEditingController();
  TextEditingController get descriptionController {
    return myDescriptionController;
  }

  DescriptionField({Key? key}) : super(key: key);

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
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(32)),
        color: _statusColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(32),
          onTap: () => onPressed(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context, myTitle, content) {
  return new AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    title: Center(child: Text(myTitle)),
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(content),
        ],
      ),
    ),
    actions: <Widget>[
      new ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    ],
  );
}
