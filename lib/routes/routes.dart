
import 'package:flutter/material.dart';
import 'package:spotify_clone/dashboard/ui/dashboard_screen.dart';
import 'package:spotify_clone/login/ui/login_signup_screen.dart';
import 'package:spotify_clone/settings/ui/settings_screen.dart';

import '../constants/string_constants.dart';
import '../login/ui/login_screen.dart';
import '../splash_screen/splash_screen.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RouteConstants.splashScreen:
        return MaterialPageRoute(
          builder: (_) => SplashScreen()
        );

      case RouteConstants.loginScreen:
        return PageRouteBuilder(
            pageBuilder: (context, animation, _) => const LoginScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                slideTransition(context, animation, child),
        );

        case RouteConstants.dashboardScreen:
        return PageRouteBuilder(
            pageBuilder: (context, animation, _) => const DashboardScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                slideTransition(context, animation, child),
        );

        case RouteConstants.loginSignUpScreen:
         if (args is List<dynamic>) {
          return PageRouteBuilder(
            pageBuilder: (context, animation, _) => LoginSignupScreen(
              isSignUp: args[0] as bool,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    slideTransition(context, animation, child),
          );
        }
        return _errorRoute();

      case RouteConstants.settingsScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, _) => const SettingsScreen(),
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) =>
              slideTransition(context, animation, child),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      // const String routeName = '/ErrorRoute';
      return const Scaffold(
        body: Center(
          child: Text(StringConstants.errorOnNavigation),
        ),
      );
    });
  }
}

SlideTransition slideTransition(
    BuildContext context, Animation<double> animation, Widget child) {
  const begin = Offset(1.0, 0.0);
  const end = Offset.zero;
  const curve = Curves.easeIn;
  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  var offsetAnimation = animation.drive(tween);

  return SlideTransition(
// Apply slide transition
    position: offsetAnimation,
    child: child,
  );
}

class RouteConstants {
  static const String splashScreen = "/";
  static const String loginScreen = "/Login";
  static const String dashboardScreen = "/Dashboard";
  static const String loginSignUpScreen = "/LoginSignUp";
  static const String settingsScreen = "/Settings";
}