import 'package:flutter/material.dart';

class searching extends StatefulWidget {
  //const searching({Key? key}) : super(key: key);

  @override
  _searchingState createState() => _searchingState();
}

class _searchingState extends State<searching> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Tv app show'),
          centerTitle: true,
        ),
        body: Center(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Show name',
            ),
          ),
        ));
  }
}
