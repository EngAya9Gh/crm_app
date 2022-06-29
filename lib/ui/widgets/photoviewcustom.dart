import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';

import '../../constants.dart';

class photoviewcustom extends StatefulWidget {
  photoviewcustom({required this.urlimagecon, Key? key}) : super(key: key);
  String urlimagecon;
  @override
  _photoviewcustomState createState() => _photoviewcustomState();
}

class _photoviewcustomState extends State<photoviewcustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(
          imageProvider:
          Image.network(
          widget.urlimagecon,
      ).image),
    );
  }
}
