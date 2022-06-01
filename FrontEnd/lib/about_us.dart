import 'package:flutter/material.dart';
import 'package:homepage/widgets/HomepageBuildSection.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class AboutUs extends StatefulWidget {
  const AboutUs();

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          const HomepageBuildSection(),
          SizedBox(
              width: MediaQuery.of(context).size.width * 6 / 10,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientText(
                      'ABOUT US',
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
                      padding: const EdgeInsets.all(20.0),
                      child: const SelectableText(
                          'The only way to a brighter future is... the SMART way!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'BebasNeuePro', fontSize: 30)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(1.0),
                      child: const SelectableText(
                          'We will start with a disclaimer, as we admit technology can often be overwhelming '
                          'and with the wide array of smart home gadgets that are now on the market, '
                          'it’s no wonder if you’re unsure which you should invest in.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'BebasNeuePro', fontSize: 30)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(1.0),
                      child: const SelectableText(
                          '\n This is where we come into the picture!'
                          ' We have created a place where our customers can view and buy the best smart home devices,'
                          ' with the whole experience being tailored to suit each of their individual needs! On our platform,'
                          ' you can simulate your own home and play around with smart gadgets, building the perfect home improvement project!'
                          ' You can share your work with others on our Forum and please feel free to view, like and comment on others’ posts — in doing so,'
                          ' you can get your creative juices flowing!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'BebasNeuePro', fontSize: 30)),
                    ),
                  ])),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Image(
                image: AssetImage('assets/about_line.png'),
                alignment: Alignment.centerRight,
                // fit: BoxFit.fitHeight,
              )),
          SizedBox(
              width: MediaQuery.of(context).size.width * 6 / 10,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(70.0),
                      child: const SelectableText('Why choose the SMART way? !',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'BebasNeuePro', fontSize: 30)),
                    ),
                    Container(
                      child: const SelectableText(
                          'Our company was founded as a response to the sheer lack of competent and reliable providers,'
                          ' affordable smart house products and the overwhelming demand from homeowners. ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'BebasNeuePro', fontSize: 30)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(1.0),
                      child: const SelectableText(
                          '\nThe best smart house devices can make your life easier by automating'
                          ' your home and enabling you to create the perfect atmosphere at your place with only one tap on your smartphone. '
                          ' They can also reduce your energy consumption, because forgeting to turn off the lights or the heating mechanism'
                          ' will be worries of the past! All you need is your smartphone and you will be able to control the smart systems in your home,'
                          ' even when you’re not around. \n'
                          '\nIf we have made you even a bit curious, feel free to choose SMART today '
                          '\nBut be careful - once you catch the SMART bug, you will never want to go back!\n\n\n',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'BebasNeuePro', fontSize: 30)),
                    ),
                  ])),
        ])));
  }
}
