import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' show SpinKitFadingCircle;

import '../../../constants.dart' show kMainColor;

class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
    this.size,
    this.padding = 2,
    this.isExpanded = false,
  });

  final double? size;
  final double padding;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final Widget child = Center(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: SpinKitFadingCircle(
          color: kMainColor,
          size: size ?? size ?? 35.r,
          duration: Duration(milliseconds: 1000),
        ),
      ),
    );
    return isExpanded ? Expanded(child: child) : child;
  }
}
