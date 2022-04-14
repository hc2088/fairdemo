import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

@FairPatch()
class SimplePage extends StatelessWidget {
  const SimplePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: Text(
        'hello fair',
        style: TextStyle(fontSize: 30, color: Colors.black),
      )),
    );
  }
}
