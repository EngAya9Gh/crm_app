import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class custom_button_new extends StatelessWidget {
   custom_button_new({required this.text, required this.onpress, Key? key}) : super(key: key);
 Function()? onpress;
 String text;
  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                kMainColor)),
        onPressed: onpress,
        // addinvoice(
        //     iduser: iduser,
        //     idClient: itemClient.idClients.toString()
        child: Text(text));
  }
}
