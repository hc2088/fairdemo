import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

@FairPatch()
class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
          child: Text(
        'hello fair',
      )),
    );
  }
}
