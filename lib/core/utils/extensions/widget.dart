import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  @widgetFactory
  Widget padding(EdgeInsetsGeometry padding) {
    return Padding(padding: padding, child: this);
  }

  @widgetFactory
  Widget sizedBox({double? height, double? width}) {
    return SizedBox(height: height, width: width, child: this);
  }
}
