import 'dart:math';
import 'package:flutter/material.dart';
import 'package:homepage/forum/utilities/Utilities.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 700)

              ///----------------Phone Mode----------------------////

              return SingleChildScrollView(
                child: Text("Phone Mode"),
              );
            else if (constraints.maxWidth < 1100) {
              ///---------------Tablet Mode--------------------///

              return Text("Tablet mode");
            } else {
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
                        margin: EdgeInsets.fromLTRB(100, 10, 100, 10),
                        child: Column(
                          children: [
                            ///////Aici am prima parte, trebuie facuta sub forma de clasa neaparat!
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                                  TopicTextField(),
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
                            DescriptionField(),
                            /////Aici pun butonul pentru creearea postului
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
  @override
  State<TopicTextField> createState() => _TopicTextFieldState();
}

class _TopicTextFieldState extends State<TopicTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(100, 0, 30, 0),
      child: TextField(
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
  @override
  State<DescriptionField> createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: TextField(
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
