
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gawe/utils/constants.dart';

class AppBarUtil {

  static AppBar drawerAppBar({
    required BuildContext context,
    required String title,
    Function()? onTap
  }) { 
  return AppBar(
      backgroundColor: Constants.backgroundColor,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: const BoxDecoration(
              color: Constants.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text('A')
            )
          ),
        ),
      ),
      title: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Constants.accentColor,
        ),
        child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))),
      );
  }
}

