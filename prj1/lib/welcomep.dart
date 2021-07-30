import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Welcome extends StatefulWidget {
  //const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  void loadData() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacementNamed(context, '/searching');
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitRing(
            color: Colors.red[800],
            size: 250.0,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Welcome',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
        ],
      ),
    );
  }
}
