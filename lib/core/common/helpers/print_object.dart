import 'dart:convert' show json, JsonEncoder;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show debugPrint;

void printObject(Object object) {
  Map jsonMapped = json.decode(json.encode(object));

  JsonEncoder encoder = new JsonEncoder.withIndent(', ');

  String prettyPrint = encoder.convert(jsonMapped);

  debugPrint(prettyPrint);
}

// To use simply pass your object to it
// printObject(yourObject);
