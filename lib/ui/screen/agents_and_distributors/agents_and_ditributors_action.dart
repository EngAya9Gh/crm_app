import 'dart:async';
import 'dart:io';

import 'package:crm_smart/model/agent_distributor_model.dart';
import 'package:crm_smart/view_model/agent_dsitributor_vm.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../../constants.dart';
import '../../../model/countrymodel.dart';
import '../../../model/maincitymodel.dart';
import '../../../view_model/maincity_vm.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../../view_model/vm.dart';
import '../../widgets/container_boxShadows.dart';
import '../../widgets/custom_widget/custombutton.dart';
import '../../widgets/custom_widget/row_edit.dart';
import '../../widgets/custom_widget/text_form.dart';

class AgentAndDistributorsAction extends StatefulWidget {
  const AgentAndDistributorsAction({Key? key, this.agentDistributorModel}) : super(key: key);

  final AgentDistributorModel? agentDistributorModel;

  @override
  State<AgentAndDistributorsAction> createState() => _AgentAndDistributorsActionState();
}

class _AgentAndDistributorsActionState extends State<AgentAndDistributorsAction>
    with StateViewModelMixin<AgentAndDistributorsAction, AgentDistributorViewModel> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController logoController = TextEditingController();
  late File? _myfilelogo = null;

  AgentDistributorModel? get agentDistributorModel => widget.agentDistributorModel;
  late final String fkCountry;
  late final MainCityProvider _mainCityProvider;
  @override
  void initState() {
    super.initState();
    if (agentDistributorModel != null) {
      nameController.text = agentDistributorModel!.nameAgent;
      emailController.text = agentDistributorModel!.emailAgent;
      phoneNumberController.text = agentDistributorModel!.mobileAgent;
      descriptionController.text = agentDistributorModel!.description;
    }
    _mainCityProvider = context.read<MainCityProvider>();
    fkCountry = context.read<UserProvider>().currentUser.fkCountry!;

    scheduleMicrotask(() {
      viewmodel.resetAgentDistributorActionParams();

      viewmodel.getMainCity(
        fkCountry: fkCountry,
        id_maincity: agentDistributorModel?.fkCountry,
      );

      if (agentDistributorModel != null) {
        viewmodel.onSelectADType(
            ADType.values.firstWhere((element) => element.index == int.parse(agentDistributorModel!.typeAgent)));
      }
    });

  }
  bool get isEdit => widget.agentDistributorModel != null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Selector<AgentDistributorViewModel, bool>(
            selector: (_, vm) => vm.isLoadingAction,
            builder: (context, isLoading, child) {
              return ModalProgressHUD(
                inAsyncCall: isLoading,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.only(top: 75, right: 15, left: 15, bottom: 25),
                      child: ContainerShadows(
                        width: double.infinity,
                        margin: EdgeInsets.only(),
                        child: ScrollbarTheme(
                          data: Theme.of(context)
                              .scrollbarTheme
                              .copyWith(trackColor: MaterialStateProperty.all(Colors.grey.shade200)),
                          child: Scrollbar(
                            interactive: true,
                            child: SingleChildScrollView(
                              padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
                              child: Column(
                                children: [
                                  SizedBox(height: 15),
                                  RowEdit(name: 'الاسم', des: '*'),
                                  SizedBox(height: 15),
                                  EditTextFormField(
                                    vaild: (value) {
                                      if (value?.trim().isEmpty ?? true) {
                                        return 'هذا الحقل مطلوب';
                                      }
                                    },
                                    onSaved: (name) {
                                      if (name == null) {
                                        return;
                                      }
                                      viewmodel.onSaveName(name);
                                    },
                                    hintText: '',
                                    controller: nameController,
                                  ),
                                  SizedBox(height: 15),
                                  RowEdit(name: 'النوع', des: '*'),
                                  agentTypeSelector(),
                                  SizedBox(height: 15),
                                  RowEdit(name: 'البلد', des: '*'),
                                  Selector<AgentDistributorViewModel,
                                      Tuple2<PageState<List<MainCityModel>>, MainCityModel?>>(
                                    selector: (_, vm) => Tuple2(vm.citiesState, vm.selectedCountry),
                                    builder: (_, values, child) {
                                      final countries = values.item1;
                                      final selectedCountry = values.item2;

                                      if (countries.isLoading) {
                                        return Center(
                                          child: SizedBox(height: 25, width: 25, child: CircularProgressIndicator()),
                                        );
                                      }
                                      if (countries.isLoading) {
                                        return Center(
                                          child: IconButton(
                                            onPressed: () => viewmodel.getMainCity(fkCountry: fkCountry),
                                            icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
                                          ),
                                        );
                                      }
                                      return Container(
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: DropdownButtonFormField<MainCityModel?>(
                                              isExpanded: true,
                                              validator: (value) {
                                                if (value == null) {
                                                  return "هذا الحقل مطلوب";
                                                }
                                              },
                                              icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey.shade300,
                                                border: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                focusedErrorBorder: InputBorder.none,
                                              ),
                                              hint: Text("حدد البلد"),
                                              items: (countries.data ?? []).map((MainCityModel? country) {
                                                return DropdownMenuItem<MainCityModel?>(
                                                  child: Text(country?.namemaincity ?? '',
                                                      textDirection: TextDirection.rtl),
                                                  value: country,
                                                );
                                              }).toList(),
                                              value: selectedCountry,
                                              onChanged: (country) {},
                                              onSaved: (country) {
                                                if (country == null) {
                                                  return;
                                                }
                                                viewmodel.onSelectCountry(country);
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 15),
                                  RowEdit(name: 'رقم الموبايل'),
                                  SizedBox(height: 15),
                                  EditTextFormField(
                                    hintText: '',
                                    controller: phoneNumberController,
                                    onSaved: (phone) {
                                      if (phone == null) {
                                        return;
                                      }
                                      viewmodel.onSavePhoneNumber(phone);
                                    },
                                  ),
                                  SizedBox(height: 15),
                                  RowEdit(name: 'البريد الالكتروني'),
                                  SizedBox(height: 15),
                                  EditTextFormField(
                                    vaild: (value) {
                                      if (value?.trim() == null || value?.trim() == '') {
                                        return null;
                                      } else {
                                        if (!value!.validateEmail) {
                                          return "من فضلك أدخل بريد الكتروني صحيح.";
                                        }
                                      }
                                    },
                                    onSaved: (email) {
                                      if (email == null) {
                                        return;
                                      }
                                      viewmodel.onSaveEmail(email);
                                    },
                                    hintText: 'example@gmail.com',
                                    controller: emailController,
                                  ),
                                  SizedBox(height: 15),
                                  RowEdit(name: 'الوصف'),
                                  SizedBox(height: 15),
                                  EditTextFormField(
                                    hintText: '',
                                    maxline: 5,
                                    controller: descriptionController,
                                    onSaved: (description) {
                                      if (description == null) {
                                        return;
                                      }
                                      viewmodel.onSaveDescription(description);
                                    },
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RowEdit(name: 'صورة ', des: ''),
                                  agentDistributorModel?.imageAgent != null &&
                                          (agentDistributorModel?.imageAgent.toString().isNotEmpty ?? false)
                                      ? Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Container(
                                            height: 40,
                                            width: 50,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Image.network(agentDistributorModel!.imageAgent.toString()),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container(),
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
                                      setState(() {
                                        
                                        _myfilelogo = pickedFile;
                                        logoController.text = pickedFile.path;
                                        viewmodel.onSaveimagefile(_myfilelogo);
                                      });

                                      // _invoice!.path=pickedFile.path;
                                    },
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(2),
                                      prefixIcon: Icon(
                                        Icons.add_photo_alternate,
                                        color: kMainColor,
                                      ),
                                      hintStyle: const TextStyle(
                                          color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                                      hintText: '',
                                      filled: true,
                                      fillColor: Colors.grey.shade200,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(color: Colors.white)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(color: Colors.white)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(color: Colors.white)),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  CustomButton(
                                    width: double.infinity,
                                    text: 'حفظ',
                                    onTap: () async {
                                      _formKey.currentState!.save();
                                      if (_formKey.currentState!.validate()) {
                                        viewmodel.actionAgentDistributor(
                                          agentId: agentDistributorModel?.idAgent,
                                          onSuccess: () => Navigator.pop(context),
                                        );
                                      } else {
                                        if (viewmodel.agentDistributorActionParams.type == null &&
                                            viewmodel.agentDistributorActionParams.name != null) {
                                          showSnakeBar(context, "من فضلك اختر النوع");
                                        } else {
                                          showSnakeBar(context, "من فضلك املئ جميع الحقول المطلوبة");
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }

  showSnakeBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  Widget agentTypeSelector() {
    return Selector<AgentDistributorViewModel, AgentDistributorActionParams>(
      selector: (_, vm) => vm.agentDistributorActionParams,
      builder: (_, agentDistributorActionParams, child) {
        return Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                  onTap: () {
                    viewmodel.onSelectADType(ADType.distributor);
                  },
                  child: AnimatedContainer(
                    duration: kTabScrollDuration,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: agentDistributorActionParams.type == ADType.distributor
                        ? BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(10), bottomStart: Radius.circular(10)),
                          )
                        : null,
                    child: Text(
                      "موزع",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              VerticalDivider(
                indent: 8,
                endIndent: 8,
                color: Colors.grey.shade600,
                width: 0,
              ),
              Expanded(
                  child: InkWell(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                onTap: () {
                  viewmodel.onSelectADType(ADType.agent);
                },
                child: AnimatedContainer(
                  duration: kTabScrollDuration,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: agentDistributorActionParams.type == ADType.agent
                      ? BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius:
                              BorderRadiusDirectional.only(topEnd: Radius.circular(10), bottomEnd: Radius.circular(10)),
                        )
                      : null,
                  child: Text(
                    "وكيل",
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
            ],
          ),
        );
      },
    );
  }
}

extension EmailValidation on String {
  bool get validateEmail => RegExp(
          r'''(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])''')
      .hasMatch(this);
}
