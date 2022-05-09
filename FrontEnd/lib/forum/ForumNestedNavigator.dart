import 'package:flutter/material.dart';

class ForumNestedNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> forumNavigationKey;
  final String initialRoute;
  final Map<String, WidgetBuilder> routes;

  ForumNestedNavigator({
    Key? key,
    required this.forumNavigationKey,
    required this.initialRoute,
    required this.routes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Navigator(
        key: forumNavigationKey,
        initialRoute: initialRoute,
        onGenerateRoute: (RouteSettings routeSettings) {
          WidgetBuilder? builder = routes[routeSettings.name];
          if (routeSettings == '/') {
            return PageRouteBuilder(
              pageBuilder: (context, __, ___) => builder!(context),
              settings: routeSettings,
            );
          } else {
            return MaterialPageRoute(
              builder: builder!,
              settings: routeSettings,
            );
          }
        },
      ),
      onWillPop: () {
        if (forumNavigationKey.currentState!.canPop()) {
          forumNavigationKey.currentState!.pop();
          return Future<bool>.value(false);
        }
        return Future<bool>.value(true);
      },
    );
  }
}
