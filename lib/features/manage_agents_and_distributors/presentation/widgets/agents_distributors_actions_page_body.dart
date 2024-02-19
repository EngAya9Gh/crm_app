import 'dart:async';
import 'dart:io';

import 'package:crm_smart/features/manage_agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';
import 'package:crm_smart/features/manage_agents_and_distributors/presentation/widgets/agent_types_widget.dart';
import 'package:crm_smart/model/agent_distributor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../common/enums/enums.dart';
import '../../../../core/di/di_container.dart';
import '../../../../view_model/maincity_vm.dart';
import '../../../../view_model/user_vm_provider.dart';
import 'agents_distributors_save_button.dart';
import 'location_widget.dart';

class AgentDistributorsActionsPageBody extends StatefulWidget {
  const AgentDistributorsActionsPageBody({Key? key, this.agentDistributorModel})
      : super(key: key);

  final AgentDistributorModel? agentDistributorModel;

  @override
  State<AgentDistributorsActionsPageBody> createState() =>
      _AgentDistributorsActionsPageBodyState();
}

class _AgentDistributorsActionsPageBodyState
    extends State<AgentDistributorsActionsPageBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController logoController = TextEditingController();
  late File? _myfilelogo = null;

  AgentDistributorModel? get agentDistributorModel =>
      widget.agentDistributorModel;
  late final String fkCountry;
  late final MainCityProvider _mainCityProvider;

  @override
  void initState() {
    super.initState();
    final cubit = sl<AgentsDistributorsActionsCubit>();
    if (agentDistributorModel != null) {
      nameController.text = agentDistributorModel!.nameAgent;
      emailController.text = agentDistributorModel!.emailAgent;
      phoneNumberController.text = agentDistributorModel!.mobileAgent;
      descriptionController.text = agentDistributorModel!.description;
      // descriptionController.text = agentDistributorModel!.description;
    }
    _mainCityProvider = context.read<MainCityProvider>();
    fkCountry = context.read<UserProvider>().currentUser.fkCountry!;

    scheduleMicrotask(() {
      cubit.resetAgentDistributorActionParams();

      cubit.getAllCity(
        fkCountry: fkCountry,
        id_maincity: agentDistributorModel?.cityId,
      );

      if (agentDistributorModel != null) {
        cubit.onSelectADType(ADType.values.firstWhere((element) =>
            element.index == int.parse(agentDistributorModel!.typeAgent)));
      }
    });
  }

  bool get isEdit => widget.agentDistributorModel != null;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AgentsDistributorsActionsCubit>();

    return Scaffold(
      body: BlocBuilder<AgentsDistributorsActionsCubit,
          AgentsDistributorsActionsState>(
        builder: (context, state) {
          final isLoading = state is AgentsDistributorsActionsLoading;
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 75, right: 15, left: 15, bottom: 25),
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(),
                    child: Scrollbar(
                      interactive: true,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(
                            top: 20, left: 15, right: 15, bottom: 20),
                        child: Column(
                          children: [
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Text('الاسم',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('*', style: TextStyle(color: Colors.red)),
                              ],
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              validator: (value) {
                                if (value?.trim().isEmpty ?? true) {
                                  return 'هذا الحقل مطلوب';
                                }
                                return null;
                              },
                              onSaved: (name) {
                                if (name != null) {
                                  cubit.onSaveName(name);
                                }
                              },
                              decoration: InputDecoration(hintText: ''),
                              controller: nameController,
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Text('النوع',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('*', style: TextStyle(color: Colors.red)),
                              ],
                            ),
                            AgentTypesWidget(),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Text('المدينة',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('*', style: TextStyle(color: Colors.red)),
                              ],
                            ),
                            LocationWidget(fkCountry: fkCountry),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Text('رقم الموبايل',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: phoneNumberController,
                              decoration: InputDecoration(hintText: ''),
                              onSaved: (phone) {
                                if (phone != null) {
                                  cubit.onSavePhoneNumber(phone);
                                }
                              },
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Text('البريد الالكتروني',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  hintText: 'example@gmail.com'),
                              validator: (value) {
                                if (value?.trim().isNotEmpty ??
                                    false && !value!.validateEmail) {
                                  return 'من فضلك أدخل بريد الكتروني صحيح.';
                                }
                                return null;
                              },
                              onSaved: (email) {
                                if (email != null) {
                                  cubit.onSaveEmail(email);
                                }
                              },
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Text('الوصف',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: descriptionController,
                              decoration: InputDecoration(
                                  hintText: '', hintMaxLines: 5),
                              onSaved: (description) {
                                if (description != null) {
                                  cubit.onSaveDescription(description);
                                }
                              },
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text('صورة ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            if (agentDistributorModel?.imageAgent != null &&
                                agentDistributorModel!.imageAgent
                                    .toString()
                                    .isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  height: 40,
                                  width: 50,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.network(agentDistributorModel!
                                          .imageAgent
                                          .toString()),
                                    ],
                                  ),
                                ),
                              ),
                            TextFormField(
                              controller: logoController,
                              obscureText: false,
                              cursorColor: Colors.black,
                              onTap: () async {
                                ImagePicker imagePicker = ImagePicker();
                                final pickedImage = await imagePicker.pickImage(
                                  source: ImageSource.gallery,
                                  imageQuality: 100,
                                );
                                File? pickedFile = File(pickedImage!.path);
                                _myfilelogo = pickedFile;
                                logoController.text = pickedFile.path;
                                cubit.onSaveimagefile(_myfilelogo);
                              },
                              readOnly: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.add_photo_alternate,
                                  color: Colors.green,
                                ),
                                hintStyle: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                hintText: '',
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                              ),
                            ),
                            SizedBox(height: 15),
                            SaveButton(
                                agentDistributorModel: agentDistributorModel),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

extension EmailValidation on String {
  bool get validateEmail => RegExp(
          r'''(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])''')
      .hasMatch(this);
}
