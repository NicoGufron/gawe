import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gawe/utils/constants.dart';
import 'package:gawe/signin.dart';

class Splash extends StatefulWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignIn()));
    });
  }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: Text('Gawe', style: TextStyle(color: Constants.textColor, fontSize: 40, fontWeight: FontWeight.bold )),
      )
    );
  }
}