import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/constants/assets_path_constants.dart';
import 'package:spotify_clone/constants/color_constants.dart';
import 'package:spotify_clone/routes/routes.dart';
import 'package:spotify_clone/splash_screen/bloc/splash_bloc.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashBloc _bloc = SplashBloc();

  @override
  void initState() {
    _bloc.add(SplashLauncherEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      bloc: _bloc,
      listenWhen: (previous, current) => current is SplashListenerState,
      buildWhen: (previous, current) => current is! SplashListenerState,
      listener: (context, state) {
        if (state is SplashNavigateToLoginActionState) {
          Navigator.popAndPushNamed(context, RouteConstants.loginScreen);
        } else if (state is SplashNavigateToHomeActionState) {
          Navigator.popAndPushNamed(context, RouteConstants.dashboardScreen);
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case SplashInitial:
            {
              return SafeArea(
                child: Scaffold(
                  backgroundColor: CustomColors.bgColor,
                  body: Center(
                    child: Image.asset(
                      ImagePathConstants.splashLogo,
                      fit: BoxFit.fill,
                      height: 30.h,
                    ),
                  ),
                ),
              );
            }
          default: return Container();
        }
      },
    );
  }
}
