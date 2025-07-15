import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:spotify_clone/routes/routes.dart';

import 'dashboard/bloc/dashboard_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => DashboardBloc(),
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return const Spotify(); // Your app widget here
        },
      ),
    ),
  );
}


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
