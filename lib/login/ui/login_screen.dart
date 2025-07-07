import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spotify_clone/constants/color_constants.dart';
import 'package:spotify_clone/utils/common_textstyles.dart';

import '../../constants/assets_path_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 230),
            Image.asset(
              ImagePathConstants.loginLogo,
              fit: BoxFit.fill,
              height: 100,
              width: 100,
            ),
            SizedBox(height: 30),
            Text(
              'Millions of songs.',
              style: CommonTextStyles.medium(40, Colors.white),
            ),
            Text(
              'Free on Spotify.',
              style: CommonTextStyles.medium(40, Colors.white),
            ),
            SizedBox(height: 230),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: CustomColors.greenBtn,
                fixedSize: Size(200, 50),
              ),
              child: Text(
                'Sign up for free',
                style: CommonTextStyles.medium(30, Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Log In',
                style: CommonTextStyles.medium(30, Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
