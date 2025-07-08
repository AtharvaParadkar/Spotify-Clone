import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:spotify_clone/constants/color_constants.dart';
import 'package:spotify_clone/utils/common_textstyles.dart';

import '../../constants/assets_path_constants.dart';
import '../../routes/routes.dart';
import '../bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginBloc _bloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: _bloc,
      listenWhen: (previous, current) => current is LoginListenerState,
      buildWhen: (previous, current) => current is! LoginListenerState,
      listener: (context, state) {
        if (state is NavToSignUpLoginPageState) {
          Navigator.pushNamed(context, RouteConstants.loginSignUpScreen,
            arguments: [state.isSignUp]);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: [0.09, 0.9],
                colors: [
                  Color.fromARGB(255, 55, 55, 55),
                  Color.fromARGB(255, 0, 0, 0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImagePathConstants.loginLogo,
                        fit: BoxFit.fill,
                        height: 9.h,
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        'Millions of songs.',
                        style: CommonTextStyles.medium(19.spa, Colors.white),
                      ),
                      Text(
                        'Free on Spotify.',
                        style: CommonTextStyles.medium(19.spa, Colors.white),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 6.5.h,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => _bloc.add(NavToSignUpLoginPageEvent(isSignUp: true)),
                        style: TextButton.styleFrom(
                          backgroundColor: CustomColors.greenBtn,
                          fixedSize: Size(300, 50),
                        ),
                        child: Text(
                          'Sign up for free',
                          style: CommonTextStyles.extrabold(
                              12.spa, Colors.black),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      OutlinedButton(
                        onPressed: () => _bloc.add(NavToSignUpLoginPageEvent(isSignUp: false)),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black,
                          fixedSize: Size(300, 50),
                        ),
                        child: Text(
                          'Log In',
                          style: CommonTextStyles.extrabold(
                              12.spa, Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
