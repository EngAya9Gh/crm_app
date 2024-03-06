// exten for vertical and horizontal space using sized box

import 'package:flutter/material.dart';

extension SpaceExtension on num {
  SizedBox get height => SizedBox(height: this.toDouble());

  SizedBox get width => SizedBox(width: this.toDouble());
}
