import 'package:flutter/material.dart';

class TermsAndConditions extends StatefulWidget {
  TermsAndConditions();

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {

  bool agree = false;

  void _doSomething() {
    // Do something
  } 


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 9 / 10,
                  child: const Text(
                    'Conditions of use\n'
                    'By using this website, you certify that you have read and reviewed this Agreement and that you agree to comply with its terms. If you do not want to be bound by the terms of this Agreement, you are advised to leave the website accordingly. SHB only grants use and access of this website, its products, and its services to those who have accepted its terms.\n\n'
                    'Privacy policy\n'
                    'Before you continue using our website, we advise you to read our privacy policy regarding our user data collection. It will help you better understand our practices.\n\n'
                    'Age restriction\n'
                    'You must be at least 18 (eighteen) years of age before you can use this website. By using this website, you warrant that you are at least 18 years of age and you may legally adhere to this Agreement. SHB assumes no responsibility for liabilities related to age misrepresentation.\n\n'
                    'Intellectual property\n'
                    'You agree that all materials, products, and services provided on this website are the property of SHB, its affiliates, directors, officers, employees, agents, suppliers, or licensors including all copyrights, trade secrets, trademarks, patents, and other intellectual property. You also agree that you will not reproduce or redistribute the SHB’s intellectual property in any way, including electronic, digital, or new trademark registrations.\n'
                    'You grant SHB a royalty-free and non-exclusive license to display, use, copy, transmit, and broadcast the content you upload and publish. For issues regarding intellectual property claims, you should contact the company in order to come to an agreement.\n\n'
                    'User accounts\n'
                    'As a user of this website, you may be asked to register with us and provide private information. You are responsible for ensuring the accuracy of this information, and you are responsible for maintaining the safety and security of your identifying information. You are also responsible for all activities that occur under your account or password.\n'
                    'If you think there are any possible issues regarding the security of your account on the website, inform us immediately so we may address them accordingly.\n'
                    'We reserve all rights to terminate accounts, edit or remove content and cancel orders at our sole discretion.\n\n'
                    'Applicable law\n'
                    'By visiting this website, you agree that the laws of the Romania, without regard to principles of conflict laws, will govern these terms and conditions, or any dispute of any sort that might come between SHB and you, or its business partners and associates.\n\n'
                    'Disputes\n'
                    'Any dispute related in any way to your visit to this website or to products you purchase from us shall be arbitrated by state or federal court Romania and you consent to exclusive jurisdiction and venue of such courts.\n\n'
                    'Indemnification\n'
                    'You agree to indemnify SHB and its affiliates and hold SHB harmless against legal claims and demands that may arise from your use or misuse of our services. We reserve the right to select our own legal counsel.\n\n'
                    'Limitation on liability\n'
                    'SHB is not liable for any damages that may occur to you as a result of your misuse of our website.\n'
                    'SHB reserves the right to edit, modify, and change this Agreement at any time. We shall let our users know of these changes through electronic mail. This Agreement is an understanding between SHB and the user, and this supersedes and replaces all prior agreements regarding the use of this website.\n',
                    style: TextStyle(decoration: TextDecoration.none, height: 2, fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'BebasNeuePro', color: Colors.black),
                    
                    textAlign: TextAlign.left,
                  ),
              ),
              Row(
              children: [
                Material(
                  type: MaterialType.transparency,
                  child: Checkbox(
                    value: agree,
                    onChanged: (value) {
                      setState(() {
                        agree = value ?? false;
                      });
                    },
                  ),
                ),

                const Text(
                  'I have read and accept terms and conditions',
                  textAlign: TextAlign.center,
                  style: TextStyle(decoration: TextDecoration.none, height: 2, fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Bebas Neue', color: Colors.black),    
                )
              ],
            ),
              ElevatedButton(
              onPressed: agree ? _doSomething : null,
              child: const Text('Continue'))
            ],
          )
      ),
    );
  }
}
