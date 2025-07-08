import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:spotify_clone/constants/color_constants.dart';
import 'package:spotify_clone/utils/shared_prefs.dart';

import '../../constants/assets_path_constants.dart';
import '../../routes/routes.dart';
import '../../utils/common_textstyles.dart';
import '../bloc/login_bloc.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key, required this.isSignUp});

  final bool isSignUp;

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final LoginBloc _bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: _bloc,
      listenWhen: (previous, current) => current is LoginListenerState,
      buildWhen: (previous, current) => current is! LoginListenerState,
      listener: (context, state) {
        if (state is NavToDashboardPageState) {
          Navigator.pushNamed(context, RouteConstants.dashboardScreen);
          SharedPreferenceHelper.instance.setLogin(true);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: CustomColors.bgColor,
            body: Stack(
              children: [
                Positioned(
                  top: 2.h,
                  left: 4.w,
                  child: InkWell(
                    onTap: () => Navigator.popAndPushNamed(context, RouteConstants.loginScreen),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 3.5.h,
                    ),
                  ),
                ),
                Positioned(
                  top: 19.h,
                  left: 0,
                  right: 0,
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
                        widget.isSignUp
                            ? 'Sign up to start'
                            : 'Log in to Spotify',
                        style: CommonTextStyles.medium(19.spa, Colors.white),
                      ),
                      if (widget.isSignUp)
                        Text(
                          'listening',
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
                        onPressed: () => _bloc.add(NavToDashboardPageEvent()),
                        style: TextButton.styleFrom(
                          backgroundColor: CustomColors.greenBtn,
                          fixedSize: Size(300, 50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.email_outlined,
                            color: Colors.black,
                              size: 3.h),
                            Text(
                              'Continue with email',
                              style:
                                  CommonTextStyles.extrabold(12.spa, Colors.black),
                            ),
                            SizedBox(width: 4.w),
                          ],
                        ),
                      ),
                      SizedBox(height: 1.h),
                      InkWell(
                        onTap: () => _bloc.add(NavToDashboardPageEvent()),
                        child: Container(
                          height: 6.5.h,
                          width: 83.w,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.black,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.phone_iphone,
                                color: Colors.white,
                                size: 3.h,),
                              Text(
                                'Continue with phone number',
                                style:
                                CommonTextStyles.extrabold(12.spa, Colors.white),
                              ),
                              SizedBox(width: 4.w),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      InkWell(
                        onTap: () => _bloc.add(NavToDashboardPageEvent()),
                        child: Container(
                          height: 6.5.h,
                          width: 83.w,
                          padding: EdgeInsets.all(13),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.black,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                  ImagePathConstants.googleLogo,
                                  fit: BoxFit.contain,
                                  height: 2.7.h,
                              ),
                              Text(
                                'Continue with Google',
                                style:
                                CommonTextStyles.extrabold(12.spa, Colors.white),
                              ),
                              SizedBox(width: 4.w),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        widget.isSignUp
                            ? 'Already have an account ?'
                            : 'Don\'t have an account ?',
                        style: CommonTextStyles.regular(13.spa, Colors.white),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        widget.isSignUp
                            ? 'Log in'
                            : 'Sign up',
                        style: CommonTextStyles.medium(13.spa, Colors.white),
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
