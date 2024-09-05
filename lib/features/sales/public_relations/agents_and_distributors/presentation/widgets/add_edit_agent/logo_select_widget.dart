import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/common/models/file_model.dart';
import '../../../../../../../core/utils/app_file_handler.dart';
import '../../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';

class LogoSelectWidget extends StatelessWidget {
  const LogoSelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AgentsDistributorsActionsCubit>(context);
    return TextFormField(
      controller: cubit.logoController,
      obscureText: false,
      cursorColor: Colors.black,
      onTap: () async {
        final FileModel? pickedImage = await AppFileHandler.pickSingle(
          type: FileType.image,
        );
        cubit.logoFile = pickedImage?.file;
        cubit.logoController.text = pickedImage?.path ?? "";
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
