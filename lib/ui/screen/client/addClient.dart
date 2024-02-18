import 'dart:ui' as myui;

import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_loader_widget/app_loader.dart';
import 'package:crm_smart/features/clients_list/presentation/manager/clients_list_bloc.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/ui/screen/agents_and_distributors/agents_and_ditributors_action.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custom_button_new.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/activity_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/company_vm.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../common/enums/activity_type_size.dart';
import '../../../constants.dart';
import '../../../constantsList.dart';
import '../../../labeltext.dart';
import '../../../model/ActivityModel.dart';

class addClient extends StatefulWidget {
  addClient({Key? key}) : super(key: key);

  @override
  _addClientState createState() => _addClientState();
}

class _addClientState extends State<addClient> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _globalKey = GlobalKey<FormState>();

  final TextEditingController nameclientController = TextEditingController();
  final TextEditingController descActivController = TextEditingController();

  final TextEditingController nameEnterpriseController =
      TextEditingController();

  final TextEditingController mobileController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // final TextEditingController typejobController = TextEditingController();
  final TextEditingController address_client = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? cityController;

  String? presystem = '';

  String? sourclient = '';

  String? presystemcomb;

  final TextEditingController locationController = TextEditingController();

  final TextEditingController regoinController = TextEditingController();

  ActivitySizeType? _selectedActivitySizeType;
  String? _selectedARecommendedClient;
  late final ClientsListBloc _clientsListBloc;

  @override
  void dispose() {
    nameclientController.dispose();
    nameEnterpriseController.dispose();
    mobileController.dispose();
    // typejobController.dispose();
    locationController.dispose();
    regoinController.dispose();
    address_client.dispose();
    descActivController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  late ActivityProvider activityViewmodel;

  @override
  void initState() {
    _clientsListBloc = context.read<ClientsListBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<MainCityProvider>().getcityAll();
      activityViewmodel = context.read<ActivityProvider>()
        ..initValueOut()
        ..getActivities();
      context.read<CompanyProvider>()
        ..initValueOut()
        ..getcompany();

      context.read<MainCityProvider>().changevalue(null);
      _clientsListBloc.add(GetRecommendedClientsEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kWhiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<LoadProvider>(context).isLoadingAddclient,
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Directionality(
              textDirection: myui.TextDirection.rtl,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
                child: Column(
                  children: [
                    RowEdit(name: AppStrings.labelClientEnterprise, des: '*'),
                    SizedBox(height: 5),
                    EditTextFormField(
                      obscureText: false,
                      hintText: AppStrings.labelClientEnterprise,
                      vaild: (value) {
                        if (value!.toString().trim().isEmpty) {
                          return AppStrings.labelEmpty;
                        }
                      },
                      controller: nameEnterpriseController,
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: AppStrings.labelClientName, des: '*'),
                    SizedBox(height: 5),
                    EditTextFormField(
                      vaild: (value) {
                        if (value!.toString().trim().isEmpty) {
                          return AppStrings.labelEmpty;
                        }
                      },
                      hintText: AppStrings.labelClientName,
                      obscureText: false,
                      controller: nameclientController,
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: AppStrings.labelClientMobile, des: '*'),
                    SizedBox(height: 5),
                    EditTextFormField(
                      vaild: (value) {
                        if (value!.toString().trim().isEmpty) {
                          return AppStrings.labelEmpty;
                        }
                      },
                      hintText: '00966000000000',
                      obscureText: false,
                      controller: mobileController,
                      inputType: TextInputType.phone,
                      maxLength: 15,
                      inputformate: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: 'البريد الالكتروني', des: '*'),
                    SizedBox(height: 5),
                    EditTextFormField(
                      vaild: (value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "البريد الالكتروني مطلوب";
                        }

                        if (!value!.validateEmail) {
                          return "من فضلك أدخل بريد الكتروني صحيح.";
                        }

                        return null;
                      },
                      onSaved: (email) {
                        if (email == null) {
                          return;
                        }
                      },
                      hintText: 'example@gmail.com',
                      controller: emailController,
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: AppStrings.labelClientTypeJob, des: '*'),
                    SizedBox(height: 5),
                    Consumer<ActivityProvider>(
                      builder: (context, cart, child) {
                        return SizedBox(
                          //width: 240,
                          child: DropdownSearch<ActivityModel>(
                            mode: Mode.DIALOG,
                            filterFn: (user, filter) =>
                                user!.getFilterActivityType(filter!),
                            compareFn: (item, selectedItem) =>
                                item?.id_activity_type ==
                                selectedItem?.id_activity_type,
                            items: cart.activitiesList,
                            itemAsString: (u) => u!.userAsString(),
                            onChanged: (data) {
                              cart.onChangeSelectedActivity(data);
                            },
                            selectedItem: cart.selectedActivity,
                            showSearchBox: true,
                            dropdownSearchDecoration: InputDecoration(
                              isCollapsed: true,
                              hintText: 'النشاط',
                              alignLabelWithHint: true,
                              fillColor: Colors.grey.withOpacity(0.2),
                              contentPadding: EdgeInsets.all(0),
                              border: UnderlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                            ),
                            // InputDecoration(border: InputBorder.none),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: 'حجم النشاط', des: '*'),
                    DropdownButtonFormField<ActivitySizeType>(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.grey))),
                      isExpanded: true,
                      items: ActivitySizeType.values.map((activitySize) {
                        return DropdownMenuItem(
                          child: Text(activitySize.value),
                          value: activitySize,
                        );
                      }).toList(),
                      value: _selectedActivitySizeType,
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        _selectedActivitySizeType = value;
                        setState(() {});
                      },
                      validator: (selectedActivitySizeType) {
                        if (selectedActivitySizeType?.value.trim().isEmpty ??
                            true) {
                          return "هذا الحقل مطلوب";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: 'وصف النشاط', des: '*'),
                    EditTextFormField(
                      vaild: (value) {
                        if (value!.toString().trim().isEmpty) {
                          return AppStrings.labelEmpty;
                        }
                      },
                      hintText: AppStrings.labelDescActivity,
                      obscureText: false,
                      controller: descActivController,
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: AppStrings.labelClientCity, des: '*'),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Consumer<MainCityProvider>(
                        builder: (context, cart, child) {
                          return DropdownSearch<CityModel>(
                            mode: Mode.DIALOG,
                            label: "المدن",
                            validator: (val) {
                              if (val == null) return 'من فضلك حدد اسم مدينة';
                            },
                            filterFn: (user, filter) =>
                                user!.getfilteruser(filter!),
                            items: cart.listcity,
                            itemAsString: (u) => u!.userAsString(),
                            onChanged: (data) => cityController = data!.id_city,
                            showSearchBox: true,
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "حدد مدينة",
                              contentPadding: EdgeInsets.fromLTRB(12, 12, 5, 5),
                              border: OutlineInputBorder(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: AppStrings.labelUsernameClient, des: '*'),
                    EditTextFormField(
                      hintText: AppStrings.labelUsernameClient,
                      obscureText: false,
                      vaild: (value) {
                        if (value!.toString().trim().isEmpty) {
                          return AppStrings.labelEmpty;
                        }
                      },
                      controller: address_client,
                      //اسم المؤسسة
                      label: AppStrings.labelUsernameClient,
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: AppStrings.labelClientLocation, des: ''),
                    EditTextFormField(
                      hintText: 'location',
                      obscureText: false,
                      controller: locationController,
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: 'رقم آخر', des: ' '),
                    SizedBox(height: 5),
                    EditTextFormField(
                      hintText: '+0',
                      obscureText: false,
                      controller: phoneController,
                      inputType: TextInputType.phone,
                      maxLength: 15,
                      inputformate: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: 'مصدر العميل', des: '*'),
                    DropdownButtonFormField<String?>(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.grey))),
                      isExpanded: true,
                      items: sourceClientsList.map((level_one) {
                        return DropdownMenuItem(
                          child: Text(level_one), //label of item

                          value: level_one, //value of item
                        );
                      }).toList(),
                      value: presystemcomb,
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }

                        setState(() {
                          sourclient = value.toString();
                          if (sourclient != 'عميل موصى به' &&
                              _selectedARecommendedClient != null) {
                            _selectedARecommendedClient = null;
                          }
                        });
                      },
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "هذا الحقل مطلوب";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    if (sourclient == 'عميل موصى به') ...{
                      RowEdit(name: 'العملاء', des: '*'),
                      BlocBuilder<ClientsListBloc, ClientsListState>(
                        builder: (context, state) {
                          final recommendedList = state
                                  .recommendedClientsState.getDataWhenSuccess ??
                              [];

                          return DropdownButtonFormField<String?>(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.grey))),
                            isExpanded: true,
                            icon: state.recommendedClientsState.isLoading
                                ? AppLoader(size: 20.r)
                                : Icon(Icons.arrow_drop_down_rounded),
                            items: recommendedList.map((client) {
                              return DropdownMenuItem(
                                child: Text(client.nameEnterprise!),
                                value: client.fkClient,
                              );
                            }).toList(),
                            value: _selectedARecommendedClient,
                            onChanged: (value) {
                              if (value == null) {
                                return;
                              }
                              setState(() {
                                _selectedARecommendedClient = value.toString();
                              });
                            },
                            validator: (value) {
                              if (value?.trim().isEmpty ?? true) {
                                return "هذا الحقل مطلوب";
                              }
                              return null;
                            },
                          );
                        },
                      ),
                      SizedBox(height: 15),
                    },
                    RowEdit(name: 'نظام سابق', des: ' '),
                    Consumer<CompanyProvider>(
                      builder: (context, cart, child) {
                        return SizedBox(
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.grey))),
                            isExpanded: true,
                            items: cart.list_company.map((level_one) {
                              return DropdownMenuItem(
                                child: Text(level_one.name_company
                                    .toString()), //label of item

                                value: level_one.id_Company, //value of item
                              );
                            }).toList(),
                            value: cart.selectedValueOut,
                            onChanged: (value) {
                              //  setState(() {
                              cart.changevalueOut(value.toString());
                              // });
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: custom_button_new(
                        text: AppStrings.labelClientAdd,
                        onpress: () async {
                          if (_globalKey.currentState!.validate() &&
                              Provider.of<ActivityProvider>(context,
                                          listen: false)
                                      .selectedActivity !=
                                  null &&
                              sourclient != '') {
                            _globalKey.currentState!.save();
                            Provider.of<LoadProvider>(context, listen: false)
                                .changebooladdclient(true);
                            UserModel _user = Provider.of<UserProvider>(context,
                                    listen: false)
                                .currentUser;
                            Provider.of<ClientProvider>(context, listen: false)
                                .addclient_vm(
                                    {
                                  'email': emailController.text,
                                  if (_selectedActivitySizeType != null)
                                    'size_activity':
                                        _selectedActivitySizeType?.value,
                                  if (_selectedARecommendedClient != null)
                                    'fk_client_source':
                                        _selectedARecommendedClient,
                                  'descActivController':
                                      descActivController.text,
                                  'name_client': nameclientController.text,
                                  'address_client': address_client.text,
                                  'name_enterprise':
                                      nameEnterpriseController.text,
                                  'type_job': 'type',
                                  'city': cityController.toString(),
                                  'location':
                                      locationController.text.toString(),
                                  "fk_regoin": _user.fkRegoin == null
                                      ? "null"
                                      : _user.fkRegoin,
                                  "date_create": DateTime.now().toString(),

                                  "type_client": "تفاوض",
                                  "fk_user": _user.idUser,
                                  "user_add": _user.idUser,
                                  // "date_transfer":,
                                  'presystem': Provider.of<CompanyProvider>(
                                          context,
                                          listen: false)
                                      .selectedValueOut
                                      .toString(),
                                  'sourcclient': sourclient,
                                  'activity_type_fk':
                                      Provider.of<ActivityProvider>(context,
                                              listen: false)
                                          .selectedActivity!
                                          .id_activity_type
                                          .toString(),
                                  "mobile": mobileController.text,
                                  "phone": phoneController.text,
                                  "ismarketing":
                                      sourclient == 'ميداني' ? '0' : '1',
                                  //"date_changetype":,
                                },
                                    _user.nameUser.toString(),
                                    _user.nameRegoin
                                        .toString()).then((value) =>
                                    value != "false"
                                        ? clear(context)
                                        : error(context));
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 3),
                  ],
                ),
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  clear(BuildContext context) {
    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    Navigator.pop(context);
  }

  error(context) {
    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(AppStrings.labelErrorAddProd)));
  }
}
