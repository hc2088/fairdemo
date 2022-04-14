import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

@FairPatch()
class CountPage extends StatefulWidget {
  CountPage({Key key, this.title}) : super(key: key);
  final String title;
  dynamic data;

  @override
  _CountPageState createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  @FairProps()
  var fairProps;

  var _title;
  int _counter = 0;

  void onLoad() {
    _title = fairProps['title'];
  }

  @override
  void initState() {
    super.initState();

    fairProps = widget.data;
    onLoad();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              //style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
