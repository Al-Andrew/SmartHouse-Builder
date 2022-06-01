import 'package:flutter/material.dart';
import 'package:homepage/main.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomepageBuildSection extends StatelessWidget {
  const HomepageBuildSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 4 / 10,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('CREATE YOUR HOUSE',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 50, fontFamily: 'BarlowCondensed')),
              GradientText(
                'THE SMART WAY',
                textAlign: TextAlign.center,
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
                  height: 45,
                  width: 100,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(44, 44, 44, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () => {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyApp(
                                    selectedIndex: 1,
                                  )))
                    },
                    child: const Center(
                        child: Text('Build',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontFamily: 'BebasNeuePro'))),
                  )),
            ],
          )),
        ),
        SizedBox(
          height: 600,
          width: MediaQuery.of(context).size.width * 6 / 10,
          child: const Image(
            image: AssetImage('assets/BLOB.png'),
            alignment: Alignment.centerRight,
            // fit: BoxFit.fitHeight,
          ),
        ),
      ],
    );
  }
}
