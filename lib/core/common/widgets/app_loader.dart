import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' show SpinKitFadingCircle;

import '../../utils/app_colors.dart';

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
          color: AppColors.kMainColor,
          size: size ?? size ?? 35.r,
          duration: Duration(milliseconds: 1000),
        ),
      ),
    );
    return isExpanded ? Expanded(child: child) : child;
  }
}
// ModalProgressHUD
