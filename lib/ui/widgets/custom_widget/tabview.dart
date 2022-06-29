import 'package:flutter/material.dart';

class customtabview extends StatelessWidget {
  const customtabview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TabBarView(
      children: <Widget>[
        Icon(Icons.add),
        Icon(Icons.description),
        //Icon(Icons.add),
      ],
    );
  }
}
