import 'dart:ui' as myui;

import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/models/page_state/page_state.dart';
import 'package:crm_smart/core/utils/extensions/email_validation_ext.dart';
import 'package:crm_smart/model/ActivityModel.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/switch_provider.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/activity_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/company_vm.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../constantsList.dart';
import '../../../core/common/enums/activity_type_size.dart';
import '../../../core/di/di_container.dart';
import '../../../core/utils/app_strings.dart';
import '../../../features/app/presentation/widgets/app_loader_widget/app_loader.dart';
import '../../../features/clients_list/presentation/manager/clients_list_bloc.dart';
import '../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../view_model/datetime_vm.dart';

class editclient extends StatefulWidget {
  editclient(
      {required this.client,
      required this.fkclient,
      required this.fkuser,
      Key? key})
      : super(key: key);
  String fkclient, fkuser;
  ClientModel1 client;

  @override
  _editclientState createState() => _editclientState();
}

class _editclientState extends State<editclient> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _globalKey = GlobalKey<FormState>();

  final TextEditingController nameclientController = TextEditingController();

  final TextEditingController nameEnterpriseController =
      TextEditingController();

  final TextEditingController mobileController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController desctypejobController = TextEditingController();
  String? cityController = null;
  String? typejobController = null;
  late CityModel citymodel = CityModel(
      id_city: widget.client.city.toString(),
      name_city: widget.client.name_city.toString(),
      fk_maincity: widget.client.id_maincity.toString());
  final TextEditingController usernameclientController =
      TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController regoinController = TextEditingController();
  final TextEditingController offerpriceController = TextEditingController();
  final TextEditingController resaonController = TextEditingController();
  final TextEditingController valueBackController = TextEditingController();
  final TextEditingController descresaonController = TextEditingController();
  final TextEditingController descActivController = TextEditingController();

  // final TextEditingController address_client = TextEditingController();

  late ClientTypeProvider typeclient_provider;
  late final UserModel currentUser;
  late String? namemanage = '';
  String? sourclient;
  String? presystemcomb;

  ActivitySizeType? _selectedActivitySizeType;
  String? _selectedARecommendedClient;
  late final ClientsListBloc _clientsListBloc;
  final TextEditingController emailController = TextEditingController();
  late PrivilegeCubit _privilegeCubit;

  @override
  void dispose() {
    nameclientController.dispose();
    nameEnterpriseController.dispose();
    mobileController.dispose();
    desctypejobController.dispose();
    locationController.dispose();
    regoinController.dispose();
    offerpriceController.dispose();
    resaonController.dispose();
    valueBackController.dispose();
    descresaonController.dispose();
    usernameclientController.dispose();
    descActivController.dispose();
    // address_client.dispose();
    super.dispose();
  }

  DateTime dateprice = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(BuildContext context, DateTime currentDate) async {
    String output = formatter.format(currentDate);

    final DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3000));
    if (pickedDate != null) //&& pickedDate != currentDate)
    {
      setState(() {
        dateprice = pickedDate;
      });
      Provider.of<datetime_vm>(context, listen: false)
          .setdatetimevalue1(dateprice!);
    }
  }

  @override
  void initState() {
    context.read<CompanyProvider>().initValueOut();
    _privilegeCubit = getIt<PrivilegeCubit>();
    _clientsListBloc = context.read<ClientsListBloc>();
    currentUser = Provider.of<UserProvider>(context, listen: false).currentUser;
    nameclientController.text = widget.client.nameClient!.toString();
    nameEnterpriseController.text = widget.client.nameEnterprise!.toString();
    mobileController.text = widget.client.mobile!.toString();
    phoneController.text =
        widget.client.phone == null ? '' : widget.client.phone!.toString();
    descActivController.text = widget.client.descActivController!.toString();
    locationController.text = widget.client.location!.toString();
    regoinController.text = widget.client.name_regoin!.toString();
    usernameclientController.text = widget.client.address_client == null
        ? ''
        : widget.client.address_client.toString();
    emailController.text = widget.client.email ?? '';
    _selectedActivitySizeType = ActivitySizeType.values.firstWhereOrNull(
        (element) => element.value == widget.client.size_activity);
    resaonController.text = widget.client.reason_change == null
        ? ''
        : widget.client.reason_change.toString();

    offerpriceController.text =
        widget.client.offer_price == null || widget.client.offer_price == ""
            ? ""
            : widget.client.offer_price!;

    presystemcomb = sourclient = widget.client.sourcclient == null
        ? 'ميداني'
        : widget.client.sourcclient;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<MainCityProvider>(context, listen: false).getcityAll();

      Provider.of<MainCityProvider>(context, listen: false)
          .changevalue(widget.client.city.toString());

      await Provider.of<ActivityProvider>(context, listen: false)
          .getActivities();
      Provider.of<ActivityProvider>(context, listen: false)
          .onChangeSelectedActivityTypeId(widget.client.activity_type_fk);

      await Provider.of<CompanyProvider>(context, listen: false).getcompany();

      Provider.of<CompanyProvider>(context, listen: false)
          .changevalueOut(widget.client.presystem);

      cityController = widget.client.city!.toString();

      typejobController = widget.client.typeJob;
      citymodel = CityModel(
          id_city: widget.client.city.toString(),
          name_city: widget.client.name_city.toString(),
          fk_maincity: widget.client.id_maincity.toString());
      bool ism = widget.client.ismarketing == '1' ? true : false;
      Provider.of<switch_provider>(context, listen: false).changeboolValue(ism);
      typeclient_provider =
          Provider.of<ClientTypeProvider>(context, listen: false);
      typeclient_provider.type_of_client =
          // widget.itemClient.typeClient!="مشترك"&&widget.itemClient.typeClient!="منسحب"?
          widget.client.typeClient == "تفاوض" ||
                  widget.client.typeClient == "عرض سعر" ||
                  widget.client.typeClient == "مستبعد"
              ? ['تفاوض', 'عرض سعر', 'مستبعد']
              : [];

      if (widget.client.typeClient == "تفاوض" ||
          widget.client.typeClient == "عرض سعر" ||
          widget.client.typeClient == "مستبعد")
        typeclient_provider.selectedValuemanag =
            widget.client.typeClient.toString();
      if (widget.client.typeClient == "مشترك")
        typeclient_provider.selectedValuemanag = null;
      typeclient_provider.changevalue(typeclient_provider.selectedValuemanag);
    });

    _selectedARecommendedClient = widget.client.fk_client_source;
    _clientsListBloc.add(GetRecommendedClientsEvent());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Future.delayed(Duration(milliseconds: 30)).then((_) async {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    typeclient_provider =
        Provider.of<ClientTypeProvider>(context, listen: true);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kWhiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (_globalKey.currentState!.validate()) {
                  _globalKey.currentState!.save();
                  if (Provider.of<MainCityProvider>(context, listen: false)
                          .selectedValuemanag !=
                      null) {
                    Provider.of<LoadProvider>(context, listen: false)
                        .changebooladdclient(true);
                    String ismarket =
                        Provider.of<switch_provider>(context, listen: false)
                                    .isSwitched ==
                                true
                            ? '1'
                            : '0';

                    Map<String, dynamic> body = {};
                    if (typeclient_provider.selectedValuemanag == "عرض سعر")
                      body = {
                        "date_price": dateprice.toString(),
                        // formatter.format(DateTime.now()),
                      };
                    if (namemanage != null)
                      body.addAll(
                        {
                          "date_changetype": //typeclient_provider.selectedValuemanag == "منسحب"?
                              formatter1.format(_currentDate)
                        }, //:"null",
                      );
                    body.addAll({
                      'email': emailController.text,
                      if (_selectedActivitySizeType != null)
                        'size_activity': _selectedActivitySizeType?.value,
                      if (_selectedARecommendedClient != null)
                        'fk_client_source': _selectedARecommendedClient,
                      'name_client': nameclientController.text,
                      'name_enterprise': nameEnterpriseController.text,
                      // 'type_job': typejobController ,
                      'city': cityController,

                      'location': locationController.text.toString(),
                      //"fk_regoin":currentUser.fkRegoin==null?"null" :currentUser.fkRegoin,
                      //"date_create": ,
                      "type_client": widget.client.typeClient != "مشترك" &&
                              widget.client.typeClient != "منسحب"
                          ? typeclient_provider.selectedValuemanag
                          : widget.client.typeClient!,
                      //"fk_user":widget.fkuser,
                      // "date_transfer":,
                      "mobile": mobileController.text,
                      "phone": phoneController.text,
                      "address_client": usernameclientController.text,
                      "offer_price": offerpriceController.text,
                      "reason_change": resaonController.text,
                      // typeclient_provider.selectedValuemanag == "منسحب"
                      //     ? typeclient_provider.selectedValueOut
                      //     :
                      'activity_type_fk':
                          Provider.of<ActivityProvider>(context, listen: false)
                              .selectedActivity
                              ?.id_activity_type
                              .toString(),
                      // "mobile": mobileController.text,
                      "ismarketing": sourclient == 'ميداني' ? '0' : '1',
                      "user_do":
                          Provider.of<UserProvider>(context, listen: false)
                              .currentUser
                              .idUser
                              .toString(),
                      'presystem':
                          Provider.of<CompanyProvider>(context, listen: false)
                              .selectedValueOut
                              .toString(),
                      'sourcclient': sourclient,
                      'descActivController': desctypejobController.text,
                      // "desc_reason":  typeclient_provider.selectedValuemanag == "منسحب"
                      //     ?descresaonController.text:"",
                      //
                      // "value_back": typeclient_provider.selectedValuemanag == "منسحب"
                      //     ?valueBackController.text:"",
                    });

                    Provider.of<ClientProvider>(context, listen: false)
                        .updateclient_vm(body, widget.client.idClients)
                        .then((value) =>
                            value != "false" ? clear(context) : error(context));
                  }
                }
                // else {
                //   _scaffoldKey.currentState!.showSnackBar(
                //       SnackBar(content: Text('من فضلك حدد مدينة')));
                // }
              },
              icon: Icon(Icons.check, color: kWhiteColor)),
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<LoadProvider>(context).isLoadingAddclient,
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 20,
                  right: 20,
                  left: 20,
                  bottom:
                      10), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Directionality(
                //container shadow
                textDirection: myui.TextDirection.rtl,
                child: Column(
                  //textDirection: TextDirection.rtl,

                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RowEdit(name: AppStrings.labelClientEnterprise, des: '*'),

                    EditTextFormField(
                      obscureText: false,
                      hintText: AppStrings.labelClientEnterprise,
                      vaildator: (value) {
                        if (value!.toString().trim().isEmpty) {
                          return AppStrings.labelEmpty;
                        }
                      },
                      controller: nameEnterpriseController,
                      //اسم المؤسسة
                      //label: label_client,
                      onChanged: (val) {
                        // nameprod = val;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    RowEdit(name: AppStrings.labelClientName, des: '*'),
                    EditTextFormField(
                      vaildator: (value) {
                        if (value!.toString().trim().isEmpty) {
                          return AppStrings.labelEmpty;
                        }
                      },
                      hintText: AppStrings.labelClientName,
                      obscureText: false,
                      controller: nameclientController,
                    ),
                    SizedBox(height: 5),
                    RowEdit(name: AppStrings.labelClientMobile, des: '*'),
                    EditTextFormField(
                      vaildator: (value) {
                        if (value!.toString().trim().isEmpty) {
                          return AppStrings.labelEmpty;
                        }
                      },
                      hintText: '+966000000000',
                      obscureText: false,
                      controller: mobileController,
                      inputformate: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 15,
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: 'البريد الالكتروني', des: '*'),
                    SizedBox(height: 5),
                    EditTextFormField(
                      vaildator: (value) {
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
                    _privilegeCubit.checkPrivilege('27')
                        ? Container()
                        : RowEdit(
                            name: AppStrings.labelClientTypeJob, des: '*'),
                    _privilegeCubit.checkPrivilege('27')
                        ? Container()
                        : EditTextFormField(
                            hintText: AppStrings.labelClientTypeJob,
                            obscureText: false,
                            vaildator: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.labelEmpty;
                              }
                            },
                            controller: desctypejobController,
                            //اسم المؤسسة
                            label: AppStrings.labelClientTypeJob,
                            onChanged: (val) {
                              // nameprod = val;
                            },
                          ),
                    SizedBox(height: 15),
                    RowEdit(name: AppStrings.labelClientTypeJob, des: '*'),
                    Consumer<ActivityProvider>(
                      builder: (context, cart, child) {
                        return SizedBox(
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
                              // iduser = data!.id_activity_type;
                              cart.onChangeSelectedActivity(data);
                              // filtershow();
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
                          // DropdownButtonFormField(
                          //   decoration: InputDecoration(
                          //       enabledBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(12),
                          //           borderSide: BorderSide(width: 2, color: Colors.grey))),
                          //
                          //   isExpanded: true,
                          //   //hint: Text("حدد حالة العميل"),
                          //   items: cart.list_activity.map((level_one) {
                          //     return DropdownMenuItem(
                          //       child: Text(level_one.name_activity_type), //label of item
                          //
                          //       value: level_one.id_activity_type, //value of item
                          //     );
                          //   }).toList(),
                          //   value: cart.selectedValueOut,
                          //   onChanged: (value) {
                          //     //  setState(() {
                          //     cart.changevalueOut(value.toString());
                          //     typejobController = value.toString();
                          //     // });
                          //   },
                          // ),
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
                      vaildator: (value) {
                        if (value!.toString().trim().isEmpty) {
                          return AppStrings.labelEmpty;
                        }
                      },
                      hintText: AppStrings.labelDescActivity,
                      obscureText: false,
                      controller: descActivController,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //admin

                    RowEdit(name: AppStrings.labelClientCity, des: '*'),
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
                            selectedItem: citymodel,
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
                    SizedBox(
                      height: 15,
                    ),
                    RowEdit(name: AppStrings.labelUsernameClient, des: '*'),
                    EditTextFormField(
                      maxline: 3,
                      vaildator: (value) {
                        if (value!.toString().trim().isEmpty) {
                          return AppStrings.labelEmpty;
                        }
                      },
                      hintText: AppStrings.labelUsernameClient,
                      obscureText: false,
                      controller: usernameclientController,
                    ),

                    //manage
                    SizedBox(
                      height: 5,
                    ),

                    RowEdit(name: 'رقم آخر', des: 'اختياري'),
                    SizedBox(
                      height: 5,
                    ),
                    EditTextFormField(
                      // vaild: (value) {
                      //   if (value!.toString().trim().isEmpty) {
                      //     return label_empty;
                      //   }
                      // },
                      hintText: '+0',
                      obscureText: false,
                      controller: phoneController,
                      inputformate: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 15,
                    ),
                    //RowEdit(name: 'Image', des: ''),
                    SizedBox(
                      height: 15,
                    ),

                    _privilegeCubit.checkPrivilege('27')
                        ? Container()
                        : RowEdit(
                            name: AppStrings.labelClientLocation, des: ''),
                    _privilegeCubit.checkPrivilege('27')
                        ? Container()
                        : EditTextFormField(
                            hintText: 'location',
                            obscureText: false,
                            controller: locationController,
                          ),

                    ////////////////////////////////////////////////
                    SizedBox(
                      height: 15,
                    ),
                    RowEdit(name: 'مصدر العميل', des: ' '),

                    DropdownButtonFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.grey))),

                      isExpanded: true,
                      //hint: Text("حدد حالة العميل"),
                      items: sourceClientsList.map((level_one) {
                        return DropdownMenuItem(
                          child: Text(level_one), //label of item

                          value: level_one, //value of item
                        );
                      }).toList(),
                      value: presystemcomb,
                      onChanged: (value) {
                        setState(() {
                          sourclient = value.toString();
                        });
                        //  setState(() {
                        //cart.changevalueOut(value.toString());
                        // });
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
                          //width: 240,
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.grey))),

                            isExpanded: true,
                            //hint: Text("حدد حالة العميل"),
                            items: cart.list_company.map((level_one) {
                              return DropdownMenuItem(
                                child: Text(level_one.name_company
                                    .toString()), //label of item

                                value: level_one.id_Company
                                    .toString(), //value of item
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
                    SizedBox(
                      height: 15,
                    ),
                    // Provider.of<privilge_vm>(context, listen: true)
                    //             .checkprivlge('37') ==
                    //         true
                    //     ? Center(
                    //         child: Consumer<switch_provider>(
                    //           builder: (context, isSwitched, child) {
                    //             return Row(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 Switch(
                    //                     activeTrackColor:
                    //                         kMainColor.withAlpha(90),
                    //                     activeColor: kMainColor,
                    //                     value: isSwitched.isSwitched,
                    //                     onChanged: (value) {
                    //
                    //
                    //
                    //                       //valtaxrate = value;
                    //                       isSwitched.changeboolValue(value);
                    //                     }),
                    //                 Text(AppStrings.marketlabel),
                    //               ],
                    //             );
                    //           },
                    //         ),
                    //       )
                    //     : Container(),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    _privilegeCubit.checkPrivilege('27')
                        ? widget.client.typeClient != "مشترك" &&
                                widget.client.typeClient != "منسحب"
                            ? RowEdit(name: AppStrings.labelClientType, des: "")
                            : Container()
                        : Container(),
                    _privilegeCubit.checkPrivilege('27')
                        ? widget.client.typeClient != "مشترك" &&
                                widget.client.typeClient != "منسحب"
                            ? DropdownButton(
                                isExpanded: true,
                                //hint: Text("حدد حالة العميل"),
                                items: typeclient_provider.type_of_client
                                    .map((level_one) {
                                  return DropdownMenuItem(
                                    child: Text(level_one), //label of item
                                    value: level_one, //value of item
                                  );
                                }).toList(),
                                value: typeclient_provider.selectedValuemanag,
                                onChanged: (value) {
                                  namemanage = value.toString();
                                  typeclient_provider
                                      .changevalue(value.toString());
                                  // if(value=="منسحب") {
                                  //   showDialog<void>(
                                  //       context: context,
                                  //       builder: (context) => dialog);
                                  // }
                                },
                              )
                            : Container()
                        : Container(),
                    SizedBox(
                      height: 2,
                    ),

                    // Provider.of<privilge_vm>(context,listen: true)
                    //     .checkprivlge('27')==true||  Provider.of<privilge_vm>(context,listen: true)
                    //     .checkprivlge('28')==true ?
                    // typeclient_provider.selectedValuemanag=="منسحب"?
                    // ElevatedButton(
                    //   style: ButtonStyle(
                    //       backgroundColor: MaterialStateProperty.all(
                    //           kMainColor)),
                    //   onPressed: () {
                    //     showDialog<void>(
                    //         context: context,
                    //         builder: (context) => dialog);
                    //   },
                    //   child: Text('خيارات الإنسحاب'),
                    // ):
                    _privilegeCubit.checkPrivilege('27')
                        ? Container()
                        : typeclient_provider.selectedValuemanag == "عرض سعر"
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: EditTextFormField(
                                      hintText: 'عرض سعر',
                                      obscureText: false,
                                      controller: offerpriceController,
                                      inputformate: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      inputType: TextInputType.number,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    flex: 5,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (dateprice == DateTime(1, 1, 1)) {
                                          return 'يرجى تعيين التاريخ ';
                                        }
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.date_range,
                                          color: kMainColor,
                                        ),
                                        hintStyle: const TextStyle(
                                            color: Colors.black45,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                        hintText: Provider.of<datetime_vm>(
                                                context,
                                                listen: true)
                                            .valuedateTime
                                            .toString(),
                                        filled: true,
                                        fillColor: Colors.grey.shade200,
                                      ),
                                      readOnly: true,
                                      onTap: () {
                                        _selectDate(context, DateTime.now());
                                      },
                                    ),
                                  ),
                                ],
                              )
                            : _privilegeCubit.checkPrivilege('27')
                                ? Container()
                                : typeclient_provider.selectedValuemanag ==
                                        "مستبعد"
                                    ? EditTextFormField(
                                        hintText: 'سبب الاستبعاد',
                                        obscureText: false,
                                        controller: resaonController,
                                      )
                                    : Container(),
                    //:Container(),
                    // Provider.of<privilge_vm>(context,listen: true)
                    //     .checkprivlge('27')==true||  Provider.of<privilge_vm>(context,listen: true)
                    //     .checkprivlge('28')==true ?
                    // typeclient_provider.selectedValuemanag=="عرض سعر"
                    //     || typeclient_provider.selectedValuemanag=="تفاوض"?
                    // Padding(
                    //   padding: const EdgeInsets.all(6.0),
                    //   child: Center(
                    //     child:   ElevatedButton(
                    //       style: ButtonStyle(
                    //           backgroundColor: MaterialStateProperty.all(
                    //               kMainColor)),
                    //       onPressed: () {
                    //
                    //         Navigator.push(context,CupertinoPageRoute(
                    //             builder: (context)=>transferClient(
                    //            name_enterprise:  widget.itemClient.nameEnterprise.toString(),
                    //              idclient:   widget.itemClient.idClients.toString(),
                    //             type: "client",),fullscreenDialog: true
                    //
                    //         ));
                    //       },
                    //       child: Text('تحويل العميل'),
                    //     ),
                    //   ),
                    // ):Text(""):Container(),
                  ],
                ),
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
    // _scaffoldKey.currentState!.showSnackBar(
    //     SnackBar(content: Text("تم الحفظ"))
    // );
  }

  error(BuildContext context) {
    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("حدث خطأ ما")));
  }

  DateTime _currentDate = DateTime.now();
  final DateFormat formatter1 = DateFormat('yyyy-MM-dd hh:mm:ss');

  Future<void> _selectDate1(BuildContext context, DateTime currentDate) async {
    String output = formatter1.format(currentDate);

    final DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2080));
    if (pickedDate != null) //&& pickedDate != currentDate)
      setState(() {
        _currentDate = pickedDate;
      });
  }
}
