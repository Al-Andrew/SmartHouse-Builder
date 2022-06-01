import 'package:flutter/material.dart';

import 'marketplace.dart';

class Market extends StatefulWidget {
  const Market({Key? key}) : super(key: key);

  @override
  State<Market> createState() => _MarketState();
}

const routeMarketHome = '/';

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        late Widget page;
        if (settings.name == routeMarketHome) {
          page = Marketplace(all: '');
        } else {
          throw Exception('Unknown route: ${settings.name}');
        }

        return MaterialPageRoute<dynamic>(
          builder: (context) {
            return page;
          },
          settings: settings,
        );
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
