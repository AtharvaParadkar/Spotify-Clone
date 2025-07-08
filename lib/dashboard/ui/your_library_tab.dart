import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';

class YourLibraryTab extends StatefulWidget {
  const YourLibraryTab({super.key});

  @override
  State<YourLibraryTab> createState() => _YourLibraryTabState();
}

class _YourLibraryTabState extends State<YourLibraryTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: CustomColors.bgColor,body: Center(child: Text('Your Library',style: TextStyle(color: Colors.white),),),);
  }
}
