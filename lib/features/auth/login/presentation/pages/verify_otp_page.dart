import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../ui/screen/home/home.dart';
import '../../../../../ui/widgets/custom_widget/customformtext.dart';
import '../../../../../ui/widgets/custom_widget/customlogo.dart';
import '../../../../app/presentation/widgets/app_elvated_button.dart';
import '../manager/login_cubit/login_cubit.dart';

class VerifyOtpPage extends StatefulWidget {
  VerifyOtpPage({Key? key}) : super(key: key);

  @override
  _VerifyOtpPageState createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  late final LoginCubit loginCubit;

  @override
  void initState() {
    loginCubit = context.read<LoginCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is VerifyOtpFailure) {
          AppConstants.showSnakeBar(context, state.message);
        } else if (state is VerifyOtpSuccess) {
          AppNavigator.pushReplacement(Home());
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: loginCubit.otpFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomLogo(),
                SizedBox(height: 20),
                CustomFormField(
                  textdirehint: TextDirection.ltr,
                  read: false,
                  radius: 10,
                  con: loginCubit.otpCodeController,
                  maxline: 1,
                  inputType: TextInputType.number,
                  vaild: (data) {
                    if (data?.isEmpty ?? true) {
                      return AppStrings.messageEmpty;
                    }
                    return null;
                  },
                  hintText: AppStrings.hintCodeText,
                ),
                SizedBox(height: 30),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return AppElevatedButton(
                      isLoading: state is VerifyOtpLoading,
                      text: AppStrings.textButtonCode,
                      onPressed: () async {
                        if (loginCubit.otpFormKey.currentState!.validate()) {
                          await loginCubit.verifyOtp();
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
