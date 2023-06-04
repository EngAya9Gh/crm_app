import 'dart:async';

import 'package:crm_smart/model/agent_distributor_model.dart';
import 'package:crm_smart/ui/screen/agents_and_distributors/agents_and_distributors_view.dart';
import 'package:crm_smart/view_model/agent_dsitributor_vm.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import '../../../model/countrymodel.dart';
import '../../widgets/container_boxShadows.dart';
import '../../widgets/custom_widget/custombutton.dart';
import '../../widgets/custom_widget/row_edit.dart';
import '../../widgets/custom_widget/text_form.dart';

class AgentAndDistributorsAction extends StatefulWidget {
  const AgentAndDistributorsAction({Key? key, this.agentDistributorModel})
      : super(key: key);

  final AgentDistributorModel? agentDistributorModel;

  @override
  State<AgentAndDistributorsAction> createState() =>
      _AgentAndDistributorsActionState();
}

class _AgentAndDistributorsActionState extends State<AgentAndDistributorsAction>
    with
        StateViewModelMixin<AgentAndDistributorsAction,
            AgentDistributorViewModel> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  AgentDistributorModel? get agentDistributorModel =>
      widget.agentDistributorModel;

  @override
  void initState() {
    super.initState();
    if (agentDistributorModel != null) {
      nameController.text = agentDistributorModel!.nameAgent;
      emailController.text = agentDistributorModel!.emailEgent;
      phoneNumberController.text = agentDistributorModel!.mobileAgent;
      descriptionController.text = agentDistributorModel!.description;
    }

    scheduleMicrotask(() {
      viewmodel.resetAgentDistributorActionParams();

      viewmodel.getCountries(countryId: agentDistributorModel?.fkCountry);

      if (agentDistributorModel != null) {
        viewmodel.onSelectADType(ADType.values.firstWhere((element) =>
            element.index == int.parse(agentDistributorModel!.typeAgent)));
      }
    });
  }

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
                      padding: EdgeInsets.only(
                          top: 75, right: 15, left: 15, bottom: 25),
                      child: ContainerShadows(
                        width: double.infinity,
                        margin: EdgeInsets.only(),
                        child: ScrollbarTheme(
                          data: Theme.of(context).scrollbarTheme.copyWith(
                              trackColor: MaterialStateProperty.all(
                                  Colors.grey.shade200)),
                          child: Scrollbar(
                            interactive: true,
                            child: SingleChildScrollView(
                              padding: EdgeInsets.only(
                                  top: 20, left: 15, right: 15, bottom: 20),
                              child: Column(
                                children: [
                                  SizedBox(height: 15),
                                  RowEdit(name: 'الاسم', des: 'REQUIRED'),
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
                                  RowEdit(name: 'النوع', des: 'REQUIRED'),
                                  agentTypeSelector(),
                                  SizedBox(height: 15),
                                  RowEdit(name: 'البلد', des: 'REQUIRED'),
                                  Selector<
                                      AgentDistributorViewModel,
                                      Tuple2<PageState<List<CountryModel>>,
                                          CountryModel?>>(
                                    selector: (_, vm) => Tuple2(
                                        vm.countriesState, vm.selectedCountry),
                                    builder: (_, values, child) {
                                      final countries = values.item1;
                                      final selectedCountry = values.item2;

                                      if (countries.isLoading) {
                                        return Center(
                                          child: SizedBox(
                                              height: 25,
                                              width: 25,
                                              child:
                                                  CircularProgressIndicator()),
                                        );
                                      }
                                      if (countries.isLoading) {
                                        return Center(
                                          child: IconButton(
                                            onPressed: viewmodel.getCountries,
                                            icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color: Colors.grey),
                                          ),
                                        );
                                      }
                                      return Container(
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: DropdownButtonFormField<
                                                CountryModel?>(
                                              isExpanded: true,
                                              validator: (value) {
                                                if (value == null) {
                                                  return "هذا الحقل مطلوب";
                                                }
                                              },
                                              icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: Colors.grey),
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey.shade300,
                                                border: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
                                              hint: Text("حدد البلد"),
                                              items: (countries.data ?? [])
                                                  .map((CountryModel? country) {
                                                return DropdownMenuItem<
                                                    CountryModel?>(
                                                  child: Text(
                                                      country?.nameCountry ??
                                                          '',
                                                      textDirection:
                                                          TextDirection.rtl),
                                                  value: country,
                                                );
                                              }).toList(),
                                              value: selectedCountry,
                                              onChanged: (country) {},
                                              onSaved: (country) {
                                                if (country == null) {
                                                  return;
                                                }
                                                viewmodel
                                                    .onSelectCountry(country);
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
                                      if (value?.trim() == null ||
                                          value?.trim() == '') {
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
                                        if (viewmodel
                                                    .agentDistributorActionParams
                                                    .type ==
                                                null &&
                                            viewmodel
                                                    .agentDistributorActionParams
                                                    .name !=
                                                null) {
                                          showSnakeBar(
                                              context, "من فضلك اختر النوع");
                                        } else {
                                          showSnakeBar(context,
                                              "من فضلك املئ جميع الحقول المطلوبة");
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
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  onTap: () {
                    viewmodel.onSelectADType(ADType.distributor);
                  },
                  child: AnimatedContainer(
                    duration: kTabScrollDuration,
                    height: 50,
                    alignment: Alignment.center,
                    decoration:
                        agentDistributorActionParams.type == ADType.distributor
                            ? BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadiusDirectional.only(
                                    topStart: Radius.circular(10),
                                    bottomStart: Radius.circular(10)),
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
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
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
                          borderRadius: BorderRadiusDirectional.only(
                              topEnd: Radius.circular(10),
                              bottomEnd: Radius.circular(10)),
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
