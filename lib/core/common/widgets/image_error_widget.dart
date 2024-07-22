import 'package:flutter/material.dart';

class ImageErrorWidget extends StatelessWidget {
  const ImageErrorWidget({
    super.key,
    required this.name,
  });

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: name?.isNotEmpty ?? false
          ? Text(name!.substring(0, 1))
          : Icon(
              Icons.person,
              size: 50,
              color: Colors.lightBlueAccent,
            ),
    );
  }
}
