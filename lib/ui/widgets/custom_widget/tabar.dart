import 'package:flutter/material.dart';

import '../../../constants.dart';

class customtabBar extends StatefulWidget implements PreferredSizeWidget {
  const customtabBar({Key? key}) : super(key: key);

  @override
  _customtabBarState createState() => _customtabBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _customtabBarState extends State<customtabBar> {
  int _tabBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  TabBar(
      indicatorColor: kMainColor,
      onTap: (value) {
        setState(() {
          _tabBarIndex = value;
        });
      },
      tabs: <Widget>[
        Row(
          children: [
            Icon(Icons.category,color: Colors.teal,),
            Text(
              'المشتركين',
              style: TextStyle(
                color: _tabBarIndex == 0 ? Colors.black : kUnActiveColor,
                fontSize: _tabBarIndex == 0 ? 16 : null,
              ),
            ),
          ],
        ),
        Text(
          'الانتظار ',
          style: TextStyle(
            color: _tabBarIndex == 1 ? Colors.black : kUnActiveColor,
            fontSize: _tabBarIndex == 1 ? 16 : null,
          ),
        ),
        // Text(
        //   'قيد الاشتراك',
        //   style: TextStyle(
        //     color: _tabBarIndex == 2 ? Colors.black : kUnActiveColor,
        //     fontSize: _tabBarIndex == 2 ? 16 : null,
        //   ),
        // ),
      ],
    );
  }
}
