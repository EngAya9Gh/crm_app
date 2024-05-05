import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:crm_smart/core/common/models/page_state/page_state.dart';
import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart';
import 'package:crm_smart/features/sales/clients_list/domain/use_cases/add_client_usecase.dart';
import 'package:crm_smart/features/sales/clients_list/domain/use_cases/edit_client_usecase.dart';
import 'package:crm_smart/features/sales/clients_list/presentation/pages/custom_location_field.dart';
import 'package:crm_smart/model/companyModel.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../../../../../constantsList.dart';
import '../../../../../core/common/enums/activity_type_size_enum.dart';
import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../core/services/di/di_container.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/responsive_padding.dart';
import '../../../../../model/ActivityModel.dart';
import '../../../../../model/maincitymodel.dart';
import '../../../../../provider/switch_provider.dart';
import '../../../../../view_model/activity_vm.dart';
import '../../../../../view_model/company_vm.dart';
import '../../../../../view_model/maincity_vm.dart';
import '../../../../app/presentation/widgets/app_drop_down.dart';
import '../../../../app/presentation/widgets/app_loader_widget/app_loader.dart';
import '../../../../app/presentation/widgets/app_scaffold.dart';
import '../../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../../../app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import '../../data/models/clients_list_response.dart';
import '../../data/models/recommended_client.dart';
import '../manager/clients_list_bloc.dart';
import '../widgets/similar_dialog.dart';

class ClientAddEditPage extends StatefulWidget {
  const ClientAddEditPage({Key? key, this.client}) : super(key: key);
  final ClientModel? client;

  @override
  State<ClientAddEditPage> createState() => _ClientAddEditPageState();
}

class _ClientAddEditPageState extends State<ClientAddEditPage> {
  late CompanyProvider companyProvider;
  final _fromKey = GlobalKey<FormState>();
  late final ClientsListBloc _clientsListBloc;
  late ManageWithdrawalsCubit _manageWithdrawalsCubit;
  late final MainCityProvider _mainCityProvider;
  late final ClientTypeProvider _clientTypeProvider;
  late final UserProvider _userProvider;
  final intl.DateFormat formatter = intl.DateFormat('yyyy-MM-dd');

  // late final AddClientParams addClientParams;
  late final TextEditingController nameClientController;
  late final TextEditingController descriptionActivityController;
  late final TextEditingController nameEnterpriseController;
  late final TextEditingController mobileController;
  late final TextEditingController anotherNumberController;
  late final TextEditingController reasonController;
  late final TextEditingController offerPriceController;
  late final TextEditingController addressClientController;
  late final TextEditingController emailController;
  late final TextEditingController locationController;
  late final TextEditingController regionController;
  late final TextEditingController reasonClassController;
  DateTime dateOfferPrice = DateTime.now();

  String? selectedCity;
  String? _selectedActivitySizeType;
  String? _selectedARecommendedClient;
  String? _selectedClientRegistrationTye;
  String? _selectedClientsClassification;
  late ActivityProvider activityViewmodel;

  late ValueNotifier<String?> clientName;
  late ValueNotifier<String?> reasonReject;

  @override
  void initState() {
    companyProvider = context.read<CompanyProvider>();
    _clientsListBloc = context.read<ClientsListBloc>()
      ..add(GetRecommendedClientsEvent());
    _manageWithdrawalsCubit = getIt<ManageWithdrawalsCubit>()
      ..getReasonReject();
    _mainCityProvider = context.read<MainCityProvider>();
    _clientTypeProvider = context.read<ClientTypeProvider>();
    _userProvider = context.read<UserProvider>();

    mobileController = TextEditingController(text: widget.client?.mobile);
    emailController = TextEditingController(text: widget.client?.email);
    regionController = TextEditingController(text: widget.client?.nameRegion);
    clientName = ValueNotifier(widget.client?.nameClient);
    nameClientController = TextEditingController(text: clientName.value)
      ..addListener(() {
        clientName.value = nameClientController.text;
      });
    locationController = TextEditingController(text: widget.client?.location);
    nameEnterpriseController =
        TextEditingController(text: widget.client?.nameEnterprise);
    anotherNumberController = TextEditingController(text: widget.client?.phone);
    addressClientController =
        TextEditingController(text: widget.client?.addressClient);
    descriptionActivityController =
        TextEditingController(text: widget.client?.descriptionActiveController);
    reasonController = TextEditingController(text: widget.client?.reasonChange);
    offerPriceController =
        TextEditingController(text: widget.client?.offerPrice);
    reasonClassController = TextEditingController(
        text: widget.client?.reason_class != null
            ? widget.client?.reason_class != ""
                ? widget.client?.reason_class!
                : ""
            : null);

    _selectedActivitySizeType = widget.client?.sizeActivity;

    _selectedClientRegistrationTye = !isEdit
        ? null
        : widget.client?.type_record == null
            ? null
            : widget.client?.type_record!;
    _selectedClientsClassification = !isEdit
        ? null
        : widget.client?.type_classification == null
            ? null
            : widget.client?.type_classification!;
    print('_selectedClientsClassification');
    print(_selectedClientsClassification);

    _selectedARecommendedClient = widget.client?.fkClientSource;
    selectedCity = widget.client?.city;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _userProvider.selectedSourceClient = !isEdit
          ? null
          : widget.client?.sourceClient == null
              ? 'ميداني'
              : widget.client?.sourceClient;
      if (_selectedClientRegistrationTye != null) {
        _userProvider
            .changeClientRegistrationTypeStatus(_selectedClientRegistrationTye);
      }
      _mainCityProvider.changevalue(null);

      _mainCityProvider
        ..getcityAll(
            onSuccess: isEdit
                ? () => _mainCityProvider.changevalue(widget.client?.city)
                : null);

      activityViewmodel = context.read<ActivityProvider>()
        ..initValueOut()
        ..getActivities(
            onSuccess: isEdit
                ? () => context
                    .read<ActivityProvider>()
                    .onChangeSelectedActivityTypeId(
                        widget.client?.activityTypeFk)
                : null);
      companyProvider
        ..initValueOut()
        ..getcompany(
            onSuccess: isEdit
                ? () => context
                    .read<CompanyProvider>()
                    .changevalueOut(widget.client?.preSystem)
                : null);

      context
          .read<switch_provider>()
          .changeboolValue(widget.client?.isMarketing == '1');

      _clientTypeProvider.type_of_client =
          widget.client?.typeClient == "تفاوض" ||
                  widget.client?.typeClient == "عرض سعر" ||
                  widget.client?.typeClient == "مستبعد"
              ? ['تفاوض', 'عرض سعر', 'مستبعد']
              : [];

      if (widget.client?.typeClient == "تفاوض" ||
          widget.client?.typeClient == "عرض سعر" ||
          widget.client?.typeClient == "مستبعد") {
        _clientTypeProvider.selectedValuemanag =
            widget.client?.typeClient.toString();
      }
      if (widget.client?.typeClient == "مشترك") {
        _clientTypeProvider.selectedValuemanag = null;
      }
      _clientTypeProvider.changevalue(_clientTypeProvider.selectedValuemanag);
      reasonReject = ValueNotifier(widget.client?.rejectId);
    });
    // _userProvider.changeClientRegistrationTypeStatus(_selectedClientsClassification.toString());
    super.initState();
  }

  @override
  void dispose() {
    companyProvider.selectedValueOut = null;
    nameClientController.dispose();
    nameEnterpriseController.dispose();
    mobileController.dispose();
    locationController.dispose();
    regionController.dispose();
    offerPriceController.dispose();
    reasonController.dispose();
    descriptionActivityController.dispose();
    emailController.dispose();
    addressClientController.dispose();
    anotherNumberController.dispose();
    reasonClassController.dispose();
    clientName.dispose();
    reasonReject.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _manageWithdrawalsCubit,
      child: PopScope(
        onPopInvoked: (didPop) {
          if (didPop) {
            context
                .read<UserProvider>()
                .changeClientClassificationTypeStatus('');
            context.read<UserProvider>().changeClientRegistrationTypeStatus('');
          }
        },
        child: AppScaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: ValueListenableBuilder<String?>(
              valueListenable: clientName,
              builder: (context, value, _) {
                return SmartCrmAppBar(
                  appBarParams:
                      AppBarParams(title: isEdit ? value : "إضافة عميل"),
                );
              },
            ),
          ),
          body: Form(
            key: _fromKey,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Consumer<ClientTypeProvider>(
                  builder: (context, clientTypeProvider, child) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding:
                            HWEdgeInsets.only(left: 15, right: 15, top: 15),
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: AppTextField(
                                  labelText: "اسم المؤسسة*",
                                  maxLines: 1,
                                  validator:
                                      HelperFunctions.instance.requiredFiled,
                                  controller: nameEnterpriseController,
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: AppTextField(
                                  labelText: "اسم العميل*",
                                  maxLines: 1,
                                  validator:
                                      HelperFunctions.instance.requiredFiled,
                                  controller: nameClientController,
                                ),
                              ),
                            ],
                          ),
                          15.verticalSpace,
                          AppTextField(
                            labelText: "رقم الجوال*",
                            maxLines: 1,
                            validator: HelperFunctions.instance.requiredFiled,
                            textInputType: TextInputType.phone,
                            maxLength: 15,
                            controller: mobileController,
                          ),
                          15.verticalSpace,
                          AppTextField(
                            labelText: "رقم آخر",
                            maxLines: 1,
                            textInputType: TextInputType.phone,
                            maxLength: 15,
                            controller: anotherNumberController,
                          ),
                          15.verticalSpace,
                          AppTextField(
                            labelText: "البريد الالكتروني",
                            maxLines: 1,
                            hintText: 'example@gmail.com',
                            controller: emailController,
                          ),
                          15.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: Consumer<ActivityProvider>(
                                  builder: (context, cart, child) {
                                    return CustomSearchableDropDown<
                                        ActivityModel>(
                                      hint: "نوع النشاط*",
                                      items: cart.activitiesList,
                                      itemAsString: (u) => u!.userAsString(),
                                      selectedItem: cart.selectedActivity,
                                      onChanged: (data) {
                                        cart.onChangeSelectedActivity(data);
                                      },
                                      filterFn: (activity, filter) => activity
                                          .getFilterActivityType(filter),
                                      validator: (val) {
                                        if (val == null) {
                                          return 'هذا الحقل مطلوب.';
                                        }
                                        return null;
                                      },
                                    );
                                  },
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: AppDropdownButtonFormField<
                                    ActivitySizeTypeEnum, String>(
                                  items: ActivitySizeTypeEnum.values,
                                  hint: "حجم النشاط*",
                                  itemAsValue: (ActivitySizeTypeEnum? item) =>
                                      item?.value,
                                  itemAsString: (item) => item!.value,
                                  validator: (value) {
                                    if (_selectedClientRegistrationTye ==
                                        'خاطئ') return null;
                                    return HelperFunctions.instance
                                        .requiredFiled(value);
                                  },
                                  // HelperFunctions.instance.requiredFiled,
                                  value: _selectedActivitySizeType,
                                  onChange: (value) {
                                    if (value == null) {
                                      return;
                                    }
                                    _selectedActivitySizeType = value;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                          15.verticalSpace,
                          AppTextField(
                            labelText: "وصف النشاط*",
                            minLines: 3,
                            textInputAction: TextInputAction.newline,
                            validator: (value) {
                              if (_selectedClientRegistrationTye == 'خاطئ')
                                return null;
                              return HelperFunctions.instance
                                  .requiredFiled(value);
                            },
                            contentPadding: HWEdgeInsetsDirectional.only(
                                start: 16, end: 10, top: 10, bottom: 10),
                            controller: descriptionActivityController,
                          ),
                          15.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: Consumer<MainCityProvider>(
                                  builder: (context, cart, child) {
                                    return CustomSearchableDropDown<CityModel>(
                                      hint: "المدينة*",
                                      items: cart.listcity,
                                      itemAsString: (u) => u!.userAsString(),
                                      selectedItem: cart.listcity
                                          .firstWhereOrNull((element) =>
                                              element.id_city == selectedCity),
                                      onChanged: (data) {
                                        if (data == null) {
                                          return;
                                        }
                                        selectedCity = data.id_city;
                                      },
                                      filterFn: (city, filter) =>
                                          city.getfilteruser(filter),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'هذا الحقل مطلوب.';
                                        }
                                        return null;
                                      },
                                    );
                                  },
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: AppTextField(
                                  labelText: "عنوان العميل*",
                                  maxLines: 1,
                                  validator: (value) {
                                    if (_selectedClientRegistrationTye ==
                                        'خاطئ') return null;
                                    return HelperFunctions.instance
                                        .requiredFiled(value);
                                  },
                                  controller: addressClientController,
                                ),
                              ),
                            ],
                          ),
                          15.verticalSpace,
                          CustomLocationField(
                            isEdit: isEdit,
                            locationController: locationController,
                          ),
                          AppDropdownButtonFormField<String, String>(
                            items: sourceClientsList,
                            onChange: (value) {
                              if (value == null) {
                                return;
                              }

                              setState(() {
                                _userProvider.selectedSourceClient =
                                    value.toString();
                                if (_userProvider.selectedSourceClient !=
                                        'عميل موصى به' &&
                                    _selectedARecommendedClient != null) {
                                  _selectedARecommendedClient = null;
                                }
                              });
                            },
                            hint: "مصدر العميل*",
                            validator: HelperFunctions.instance.requiredFiled,
                            itemAsValue: (String? item) => item,
                            // itemBuilder: (String? item) {
                            //   return   ListTile(
                            //
                            //     contentPadding: EdgeInsets.all(0),
                            //     trailing:  Text(item ?? '',style: context.textTheme.titleSmall, ),
                            //   );
                            //
                            // },
                            itemAsString: (item) => item!,
                            value: _userProvider.selectedSourceClient,
                          ),
                          15.verticalSpace,
                          if (_userProvider.selectedSourceClient ==
                              'عميل موصى به') ...{
                            BlocBuilder<ClientsListBloc, ClientsListState>(
                              builder: (context, state) {
                                final recommendedList = state
                                        .recommendedClientsState
                                        .getDataWhenSuccess ??
                                    [];

                                return AppDropdownButtonFormField<
                                    RecommendedClient, String>(
                                  itemAsValue: (item) => item!.fkClient,
                                  hint: 'العملاء*',
                                  onChange: (value) {
                                    if (value == null) {
                                      return;
                                    }
                                    setState(() {
                                      _selectedARecommendedClient =
                                          value.toString();
                                    });
                                  },
                                  validator:
                                      HelperFunctions.instance.requiredFiled,
                                  value: _selectedARecommendedClient,
                                  items: recommendedList,
                                  itemAsString: (item) => item!.nameEnterprise!,
                                  icon: state.recommendedClientsState.isLoading
                                      ? AppLoader(size: 15.r)
                                      : null,
                                );
                              },
                            ),
                            15.verticalSpace,
                          },
                          if (_userProvider.selectedSourceClient != 'ميداني' &&
                              _userProvider.selectedSourceClient !=
                                  'عميل موصى به') ...{
                            AppDropdownButtonFormField<String, String>(
                              items: clientsRegistrationTyeList,
                              hint: "نوع التسجيل*",
                              itemAsValue: (String? item) => item!,
                              itemAsString: (item) => item!,
                              validator: HelperFunctions.instance.requiredFiled,
                              value: _selectedClientRegistrationTye,
                              onChange: (value) {
                                if (value == null) {
                                  return;
                                }
                                _selectedClientRegistrationTye = value;
                                _userProvider
                                    .changeClientRegistrationTypeStatus(value);

                                // if(value!="خاطئ"){
                                //   _userProvider.changeClientClassificationTypeStatus("null");
                                //   reasonClassController.clear();
                                //   reasonClassController.text="null";
                                // }
                              },
                            ),
                            15.verticalSpace,
                          },
                          if (_userProvider.selectedSourceClient != 'ميداني' &&
                              _userProvider.selectedSourceClient !=
                                  'عميل موصى به') ...{
                            Selector<UserProvider, String>(
                                selector: (context, userPro) =>
                                    userPro.selectedClientRegistrationType,
                                builder: (context, userProvider, child) {
                                  return (userProvider == "خاطئ") ||
                                          (_selectedClientRegistrationTye ==
                                                  "خاطئ" &&
                                              isEdit)
                                      ? AppDropdownButtonFormField<String?,
                                          String?>(
                                          items: clientsClassificationList,
                                          hint: "نوع التصنيف*",
                                          itemAsValue: (String? item) => item!,
                                          itemAsString: (item) => item!,
                                          validator: HelperFunctions
                                              .instance.requiredFiled,
                                          value: _selectedClientsClassification,
                                          onChange: (value) {
                                            if (value == null) {
                                              return;
                                            }

                                            _userProvider
                                                .changeClientClassificationTypeStatus(
                                                    value);
                                            if (value != "أخرى") {
                                              reasonClassController.clear();
                                              reasonClassController.text =
                                                  "null";
                                            }
                                          },
                                        )
                                      : IgnorePointer();
                                }),
                            15.verticalSpace,
                          },
                          if (_userProvider.selectedSourceClient != 'ميداني' &&
                              _userProvider.selectedSourceClient !=
                                  'عميل موصى به') ...{
                            Selector<UserProvider, String>(
                                selector: (context, userPro) =>
                                    userPro.selectedClientRegistrationType,
                                builder: (context, userProvider, child) {
                                  return userProvider == "أخرى" ||
                                          (_selectedClientRegistrationTye ==
                                                  "خاطئ" &&
                                              isEdit)
                                      ? 15.verticalSpace
                                      : IgnorePointer();
                                }),
                          },
                          if (_userProvider.selectedSourceClient != 'ميداني' &&
                              _userProvider.selectedSourceClient !=
                                  'عميل موصى به') ...{
                            Consumer<UserProvider>(
                                builder: (contex, userPr, child) {
                              return (userPr.selectedClientClassificationType ==
                                              "أخرى" &&
                                          userPr.selectedClientRegistrationType ==
                                              "خاطئ") ||
                                      (userPr.selectedClientClassificationType ==
                                              "أخرى" &&
                                          userPr.selectedClientRegistrationType ==
                                              "خاطئ" &&
                                          isEdit)
                                  ? AppTextField(
                                      labelText: "ادخل السبب",
                                      maxLines: 1,
                                      validator: HelperFunctions
                                          .instance.requiredFiled,
                                      controller: reasonClassController,
                                    )
                                  : IgnorePointer();
                            }),
                          },
                          Consumer<UserProvider>(
                              builder: (contex, userPr, child) {
                            return userPr.selectedClientClassificationType ==
                                            "أخرى" &&
                                        userPr.selectedClientRegistrationType ==
                                            "خاطئ" ||
                                    (userPr.selectedClientClassificationType ==
                                            "أخرى" &&
                                        userPr.selectedClientRegistrationType ==
                                            "خاطئ" &&
                                        isEdit)
                                ? 15.verticalSpace
                                : IgnorePointer();
                          }),
                          Consumer<CompanyProvider>(
                            builder: (context, company, _) {
                              if (company.isloading) {
                                return CustomLoadingIndicator();
                              }
                              // company.selectedValueOut = company.list_company
                              //     .firstWhereOrNull((element) =>
                              //         element.id_Company ==
                              //         widget.client?.preSystem)
                              //     ?.id_Company;
                              return AppDropdownButtonFormField<CompanyModel?,
                                  String>(
                                items: company.list_company,
                                isWithImage: true,
                                onChange: (value) {
                                  company.changevalueOut(value.toString());
                                  print(
                                      'companyProvider.selectedValueOut.toString()');
                                  print(companyProvider.selectedValueOut
                                      .toString());
                                },
                                hint: "نظام سابق",
                                itemAsValue: (CompanyModel? item) =>
                                    item!.id_Company,
                                itemAsString: (item) => item!.name_company!,
                                value: company.selectedValueOut,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    BlocBuilder<ClientsListBloc, ClientsListState>(
                      builder: (context, state) {
                        return AppElevatedButton(
                          isLoading: state.actionClientBlocStatus.isLoading(),
                          text: isEdit ? "تعديل" : "إضافة",
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)),
                          ),
                          onPressed: () {
                            if (!_fromKey.currentState!.validate()) {
                              return;
                            }
                            print(
                                'companyProvider.selectedValueOut.toString()');
                            print(context
                                .read<CompanyProvider>()
                                .selectedValueOut
                                .toString());
                            if (isEdit) {
                              _onEditClient();
                              return;
                            }

                            _onAddClient();
                          },
                        );
                      },
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  bool get isShowingClientStatus =>
      widget.client?.typeClient != "مشترك" &&
      widget.client?.typeClient != "منسحب";

  bool get isEdit => widget.client != null;

  void _onEditClient() {
    final EditClientParams editClientParams = EditClientParams(
      nameClient: nameClientController.text,
      nameEnterprise: nameEnterpriseController.text,
      city: selectedCity!,
      mobile: mobileController.text,
      anotherPhoneNumber: anotherNumberController.text,
      addressClient: addressClientController.text,
      selectedActivityIdType: activityViewmodel.selectedActivity == null
          ? null
          : activityViewmodel.selectedActivity?.id_activity_type,
      isMarketing: _userProvider.selectedSourceClient != 'ميداني'
          ? (_userProvider.selectedSourceClient == "عميل موصى به" ? '2' : '1')
          : '0',
      sourceClient: _userProvider.selectedSourceClient!,
      descriptionActivity: descriptionActivityController.text,
      email: emailController.text,
      selectedActivitySizeType: _selectedActivitySizeType,
      selectedARecommendedClient: _selectedARecommendedClient,
      location: locationController.text,
      statusClient: context.read<CompanyProvider>().selectedValueOut,
      // typeClient: widget.client?.typeClient != "مشترك" &&
      //         widget.client?.typeClient != "منسحب"
      //     ? _clientTypeProvider.selectedValuemanag!
      //     : widget.client!.typeClient!,
      // userActionID: _userProvider.currentUser.idUser!,
      clientId: widget.client!.idClients!,
      // offerPrice: offerPriceController.text,
      // reason: reasonController.text,
      // dateChangeType: _clientTypeProvider.selectedValuemanag != null
      //     ? formatter.format(DateTime.now())
      // : null,
      // datePrice: _clientTypeProvider.selectedValuemanag == "عرض سعر"
      //     ? dateOfferPrice.toIso8601String()
      //     : null,
      // rejectId: reasonReject.value,
      type_record: context.read<UserProvider>().selectedClientRegistrationType,
      type_classification:
          context.read<UserProvider>().selectedClientRegistrationType == "خاطئ"
              ? context.read<UserProvider>().selectedClientClassificationType
              : "null",
      reason_class: context
                      .read<UserProvider>()
                      .selectedClientRegistrationType ==
                  "خاطئ" &&
              context.read<UserProvider>().selectedClientClassificationType ==
                  "أخرى"
          ? reasonClassController.text
          : "null",
    );

    _clientsListBloc.add(EditClientEvent(
      editClientParams,
      onSuccess: (client) {
        // context.read<UserProvider>().changeClientClassificationTypeStatus('');
        // context.read<UserProvider>().changeClientRegistrationTypeStatus('');
        Navigator.pop(context, client);
      },
    ));
  }

  void _onAddClient() {
    print(
        "_userProvider.selectedSourceClient => $_userProvider.selectedSourceClient}");
    print(
        "selectedClientRegistrationType => ${context.read<UserProvider>().selectedClientRegistrationType}}");
    final AddClientParams addClientParams;
    addClientParams = AddClientParams(
      nameClient: nameClientController.text,
      nameEnterprise: nameEnterpriseController.text,
      city: selectedCity!,
      mobile: mobileController.text,
      anotherPhoneNumber: anotherNumberController.text,
      addressClient: addressClientController.text,
      selectedActivityIdType: activityViewmodel.selectedActivity == null
          ? null
          : activityViewmodel.selectedActivity?.id_activity_type,
      isMarketing: _userProvider.selectedSourceClient != 'ميداني'
          ? (_userProvider.selectedSourceClient == "عميل موصى به" ? '2' : '1')
          : '0',
      sourceClient: _userProvider.selectedSourceClient!,
      descriptionActivity: descriptionActivityController.text,
      // user: _userProvider.currentUser,
      email: emailController.text,
      selectedActivitySizeType: _selectedActivitySizeType,
      selectedARecommendedClient: _selectedARecommendedClient,
      location: locationController.text,
      statusClient: context.read<CompanyProvider>().selectedValueOut,
      type_record: context.read<UserProvider>().selectedClientRegistrationType,
      type_classification:
          context.read<UserProvider>().selectedClientClassificationType,
      reason_class: reasonClassController.text,
    );

    AppNavigator.push(SimilarDialog(
      phone: mobileController.text,
      name_enterprise: nameEnterpriseController.text,
      nameClient: nameClientController.text,
      addClientParams: addClientParams,
    ));
  }
}

Widget customPopupItemBuilderForActivityTypeList(
    BuildContext context, ActivityModel item, bool isSelected) {
  return Container(
      margin:
          const EdgeInsetsDirectional.only(start: 2, end: 2, top: 2, bottom: 2),
      decoration: AppStyles.customBoxDecoration,
      child: ListTile(
        selected: isSelected,
        trailing: Text(
          item.name_activity_type,
          style: context.textTheme.titleSmall,
          textDirection: TextDirection.rtl,
        ),
      ));
}
