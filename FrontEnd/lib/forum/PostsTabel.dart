import 'package:flutter/material.dart';

class PostsTabel extends StatefulWidget {
  const PostsTabel({Key? key}) : super(key: key);

  @override
  State<PostsTabel> createState() => _PostsTabelState();
}

Widget _verticalDivider = const VerticalDivider(
  color: Colors.black,
  thickness: 1,
);

class _PostsTabelState extends State<PostsTabel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          children: [
            DataTable(
              columns: [
                DataColumn(
                  label: Text('ID',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                //DataColumn(label: _verticalDivider),
                DataColumn(
                  label: Text('TOPIC',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                DataColumn(
                  label: Text('AUTHOR',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                DataColumn(
                  label: Text('DATE',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                DataColumn(
                  label: Text('LIKES',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                DataColumn(
                  label: Text('COMMENTS',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(
                      Text('1'),
                    ),
                    DataCell(
                      Text('What do you think about Amazon Alexa?'),
                    ),
                    DataCell(
                      Text('John H.'),
                    ),
                    DataCell(
                      Text('06/04/2022'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('3'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('Need options on my first SmartHouse...'),
                    ),
                    DataCell(
                      Text('John H.'),
                    ),
                    DataCell(
                      Text('22/03/2022'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('Need options on my first SmartHouse...'),
                    ),
                    DataCell(
                      Text('John H.'),
                    ),
                    DataCell(
                      Text('22/03/2022'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('Need options on my first SmartHouse...'),
                    ),
                    DataCell(
                      Text('John H.'),
                    ),
                    DataCell(
                      Text('22/03/2022'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('Need options on my first SmartHouse...'),
                    ),
                    DataCell(
                      Text('John H.'),
                    ),
                    DataCell(
                      Text('22/03/2022'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('Need options on my first SmartHouse...'),
                    ),
                    DataCell(
                      Text('John H.'),
                    ),
                    DataCell(
                      Text('22/03/2022'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('Need options on my first SmartHouse...'),
                    ),
                    DataCell(
                      Text('John H.'),
                    ),
                    DataCell(
                      Text('22/03/2022'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('Need options on my first SmartHouse...'),
                    ),
                    DataCell(
                      Text('John H.'),
                    ),
                    DataCell(
                      Text('22/03/2022'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('3'),
                    ),
                    DataCell(
                      Text('Need options on my first SmartHouse...'),
                    ),
                    DataCell(
                      Text('Jackie C.'),
                    ),
                    DataCell(
                      Text('10/02/2022'),
                    ),
                    DataCell(
                      Text('1'),
                    ),
                    DataCell(
                      Text('4'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('4'),
                    ),
                    DataCell(
                      Text('What do you think about Amazon Alexa?'),
                    ),
                    DataCell(
                      Text('John H.'),
                    ),
                    DataCell(
                      Text('06/04/2022'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('3'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('5'),
                    ),
                    DataCell(
                      Text('What do you think about Amazon Alexa?'),
                    ),
                    DataCell(
                      Text('John H.'),
                    ),
                    DataCell(
                      Text('06/04/2022'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('3'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('1'),
                    ),
                    DataCell(
                      Text('What do you think about Amazon Alexa?'),
                    ),
                    DataCell(
                      Text('John H.'),
                    ),
                    DataCell(
                      Text('06/04/2022'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('3'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('1'),
                    ),
                    DataCell(
                      Text('What do you think about Amazon Alexa?'),
                    ),
                    DataCell(
                      Text('John H.'),
                    ),
                    DataCell(
                      Text('06/04/2022'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('3'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('1'),
                    ),
                    DataCell(
                      Text('What do you think about Amazon Alexa?'),
                    ),
                    DataCell(
                      Text('John H.'),
                    ),
                    DataCell(
                      Text('06/04/2022'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('3'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('1'),
                    ),
                    DataCell(
                      Text('What do you think about Amazon Alexa?'),
                    ),
                    DataCell(
                      Text('John H.'),
                    ),
                    DataCell(
                      Text('06/04/2022'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('3'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('1'),
                    ),
                    DataCell(
                      Text('What do you think about Amazon Alexa?'),
                    ),
                    DataCell(
                      Text('John H.'),
                    ),
                    DataCell(
                      Text('06/04/2022'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('3'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('1'),
                    ),
                    DataCell(
                      Text('What do you think about Amazon Alexa?'),
                    ),
                    DataCell(
                      Text('John H.'),
                    ),
                    DataCell(
                      Text('06/04/2022'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('3'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('1'),
                    ),
                    DataCell(
                      Text('What do you think about Amazon Alexa?'),
                    ),
                    DataCell(
                      Text('John H.'),
                    ),
                    DataCell(
                      Text('06/04/2022'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('3'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('1'),
                    ),
                    DataCell(
                      Text('What do you think about Amazon Alexa?'),
                    ),
                    DataCell(
                      Text('John H.'),
                    ),
                    DataCell(
                      Text('06/04/2022'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('3'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('1'),
                    ),
                    DataCell(
                      Text('What do you think about Amazon Alexa?'),
                    ),
                    DataCell(
                      Text('John H.'),
                    ),
                    DataCell(
                      Text('06/04/2022'),
                    ),
                    DataCell(
                      Text('2'),
                    ),
                    DataCell(
                      Text('3'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
