import 'package:flutter/material.dart';
import 'package:spotify_clone/routes/routes.dart';

void main() => runApp(const Spotify());

final navigatorUseKey = GlobalKey<NavigatorState>();

class Spotify extends StatelessWidget {
  const Spotify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorUseKey,
      initialRoute: RouteConstants.splashScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
