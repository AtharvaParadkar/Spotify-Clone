import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: CustomColors.bgColor,body: Center(child: Text('Search',style: TextStyle(color: Colors.white),),),);
  }
}
