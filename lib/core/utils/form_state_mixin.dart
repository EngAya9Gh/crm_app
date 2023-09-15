import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import 'form_utils.dart';

mixin FormStateMixin <T extends StatefulWidget> on State<T> {
  late final Tuple3<GlobalKey<FormState>, List<TextEditingController>, List<FocusNode>> form;

  int get numberOfFields;

  @override
  void initState() {
    form = generateForm(numberOfFields: numberOfFields);
    super.initState();
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }
}
