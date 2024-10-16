import 'package:flutter/material.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';

class EmptyListPlaceholder {
  static DragAndDropItem build() {
    return DragAndDropItem(
      child: Container(
        height: 80,
        child: Center(
          child: Text(
            "Drag items here",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
      ),
    );
  }
}