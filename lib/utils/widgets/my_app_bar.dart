import 'package:flutter/material.dart';
import 'package:hackquest/utils/global_variables.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2.0,
      backgroundColor: Colors.blue[300],
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('$appLogo'),
            backgroundColor: Colors.white,
          ),
          Container(
            width: 30,
          ),
          Text('$appName'),
        ],
      ),
      centerTitle: true,
    );
  }
}
