import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

Tuple3<GlobalKey<FormState>, List<TextEditingController>, List<FocusNode>> generateForm({required int numberOfFields}) {
  return Tuple3(
    GlobalKey<FormState>(),
    List.generate(numberOfFields, (index) => TextEditingController()),
    List.generate(numberOfFields, (index) => FocusNode()),
  );
}

void disposeController(TextEditingController controller) => controller.dispose();

void disposeFocusNode(FocusNode focusNode) => focusNode.dispose();

void disposeForm(Tuple3<GlobalKey<FormState>, List<TextEditingController>, List<FocusNode>> form) {
  form.item2.forEach(disposeController);
  form.item3.forEach(disposeFocusNode);
}

extension FormExt on Tuple3<GlobalKey<FormState>, List<TextEditingController>, List<FocusNode>> {
  GlobalKey<FormState> get key => item1;
  List<TextEditingController> get controllers => item2;
  List<FocusNode> get nodes => item3;

  void dispose() => disposeForm(this);

  void validate(VoidCallback block) {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      block();
    }
  }
}
