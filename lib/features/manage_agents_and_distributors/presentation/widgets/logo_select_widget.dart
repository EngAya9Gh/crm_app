import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';

class LogoSelectWidget extends StatelessWidget {
  const LogoSelectWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AgentsDistributorsActionsCubit>(context);
    return TextFormField(
      controller: cubit.logoController,
      obscureText: false,
      cursorColor: Colors.black,
      onTap: () async {
        ImagePicker imagePicker = ImagePicker();
        final pickedImage = await imagePicker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 100,
        );
        File? pickedFile = File(pickedImage!.path);
        cubit.logoFile = pickedFile;
        cubit.logoController.text = pickedFile.path;
        cubit.onSaveImageFile();
      },
      readOnly: true,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.add_photo_alternate,
          color: Colors.green,
        ),
        hintStyle: TextStyle(
            color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
        hintText: '',
        filled: true,
        fillColor: Colors.grey.shade200,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
