import 'package:flutter/material.dart';
import 'welcomep.dart';
import 'searchingp.dart';

void main() {
  runApp(MaterialApp(
    // initialRoute: ,
    routes: {
      '/': (context) => Welcome(),
      '/searching': (context) => searching(),
    },
  ));
}
