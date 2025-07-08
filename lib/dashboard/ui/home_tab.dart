import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/color_constants.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: CustomColors.bgColor,body: Center(child: Text('Home',style: TextStyle(color: Colors.white),),),);
  }
}
