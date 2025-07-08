import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';

class CreateTab extends StatefulWidget {
  const CreateTab({super.key});

  @override
  State<CreateTab> createState() => _CreateTabState();
}

class _CreateTabState extends State<CreateTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: CustomColors.bgColor,body: Center(child: Text('Create',style: TextStyle(color: Colors.white),),),);
  }
}
