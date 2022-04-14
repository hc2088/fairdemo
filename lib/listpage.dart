import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page1'),
      ),
      body: Container(
        child: ListView(
          children: [
            getListTile(context, '/'),
            getListTile(context, '/lib_simplepage'),
            getListTile(context, '/lib_countpage'),
            getListTile(context, '/lib_IfEqualBoolPage'),
          ],
        ),
      ),
    );
  }
}

getListTile(BuildContext context, String jumpUrl) {
  return ListTile(
    title: Text(jumpUrl),
    onTap: () {
      Navigator.pushNamed(context, jumpUrl, arguments: jumpUrl);
    },
  );
}
