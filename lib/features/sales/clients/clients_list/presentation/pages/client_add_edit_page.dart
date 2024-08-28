import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/activity_type_size_enum.dart';
import '../../../../../../core/common/enums/client/client_classification_enum.dart';
import '../../../../../../core/common/enums/client/client_registration_type_enum.dart';
import '../../../../../../core/common/enums/client/client_source_enum.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/models/location/city_model.dart';
import '../../../../../../core/common/models/page_state/page_state.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../../core/services/maps/location_services.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../core/utils/responsive_padding.dart';
import '../../../../../../model/companyModel.dart';
import '../../../../../../provider/switch_provider.dart';
import '../../../../../../view_model/activity_vm.dart';
import '../../../../../../view_model/company_vm.dart';
import '../../../../../../view_model/maincity_vm.dart';
import '../../../../../../view_model/typeclient.dart';
import '../../../../../../view_model/user_vm_provider.dart';
import '../../../../../app/presentation/widgets/app_drop_down.dart';
import '../../../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../../../../app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../../../mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart';
import '../../data/models/recommended_client.dart';
import '../../domain/use_cases/add_client_usecase.dart';
import '../../domain/use_cases/edit_client_usecase.dart';
import '../manager/clients_list_bloc.dart';
import '../widgets/activity_type.dart';
import '../widgets/custom_location_field.dart';
import '../widgets/similar_dialog.dart';
import '../widgets/subscribing_intention_level.dart';

class ClientAddEditPage extends StatefulWidget {
  const ClientAddEditPage({Key? key, this.client}) : super(key: key);
  final ClientModel? client;

  @override
  State<ClientAddEditPage> createState() => _ClientAddEditPageState();
}

class _ClientAddEditPageState extends State<ClientAddEditPage> {
  late CompanyProvider companyProvider;
  late final PrivilegesCubit privilegeCubit;

  final _fromKey = GlobalKey<FormState>();
  late final ClientsListBloc _bloc;
  late ManageWithdrawalsCubit _manageWithdrawalsCubit;
  late final MainCityProvider _mainCityProvider;
  late final ClientTypeProvider _clientTypeProvider;
  late final UserProvider userProvider;
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
  ActivitySizeTypeEnum? _selectedActivitySizeType;
  String? _selectedARecommendedClient;
  String? _selectedClientRegistrationTye;
  String? _selectedClientsClassification;
  late ActivityProvider activityViewmodel;

  late ValueNotifier<String?> clientName;
  late ValueNotifier<String?> reasonReject;

  @override
  void initState() {
    privilegeCubit = context.read<PrivilegesCubit>();
    companyProvider = context.read<CompanyProvider>();
    _bloc = context.read<ClientsListBloc>()..add(GetRecommendedClientsEvent());
    _manageWithdrawalsCubit = context.read<ManageWithdrawalsCubit>()
      ..getReasonReject();
    _mainCityProvider = context.read<MainCityProvider>();
    _clientTypeProvider = context.read<ClientTypeProvider>();
    userProvider = context.read<UserProvider>();

    mobileController = TextEditingController(text: widget.client?.mobile);
    emailController = TextEditingController(text: widget.client?.email);
    regionController = TextEditingController(text: widget.client?.nameRegion);
    clientName = ValueNotifier(widget.client?.nameClient);
    nameClientController = TextEditingController(text: clientName.value)
      ..addListener(() {
        clientName.value = nameClientController.text;
      });

    locationController = TextEditingController(text: widget.client?.location);
    if (!LocationServices.isValidLatLang(locationController.text)) {
      locationController.clear();
    }
    nameEnterpriseController =
        TextEditingController(text: widget.client?.nameEnterprise);
    anotherNumberController = TextEditingController(text: widget.client?.phone);
    addressClientController =
        TextEditingController(text: widget.client?.address_client);
    descriptionActivityController =
        TextEditingController(text: widget.client?.descActivController);
    reasonController = TextEditingController(text: widget.client?.reasonChange);
    offerPriceController =
        TextEditingController(text: widget.client?.offer_price);
    reasonClassController = TextEditingController(
        text: widget.client?.reason_class != null
            ? widget.client?.reason_class != ""
                ? widget.client?.reason_class!
                : ""
            : null);

    _selectedActivitySizeType =
        ActivitySizeTypeEnum.fromString(widget.client?.size_activity);

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

    _selectedARecommendedClient = widget.client?.fkClientSource;
    selectedCity = widget.client?.city;
    BlocProvider.of<ClientsListBloc>(context).subscribingIntentionLevel =
        widget.client?.subscribingIntentionLevel;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userProvider.selectedSourceClient = _initSelectedClientSource();
      if (_selectedClientRegistrationTye != null) {
        userProvider
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
                    .changevalueOut(widget.client?.presystem)
                : null);

      context
          .read<switch_provider>()
          .changeboolValue(widget.client?.ismarketing == '1');

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
      reasonReject = ValueNotifier(widget.client?.fkRejectClient);
    });
    // _userProvider.changeClientRegistrationTypeStatus(_selectedClientsClassification.toString());
    super.initState();
  }

  ClientSourceEnum? _initSelectedClientSource() {
    if (!isEdit) return null;

    return widget.client?.sourcclient == null
        ? ClientSourceEnum.field
        : ClientSourceEnum.fromString(widget.client?.sourcclient!);
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
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          userProvider.changeClientClassificationTypeStatus('');
          userProvider.changeClientRegistrationTypeStatus('');
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
                      padding: HWEdgeInsets.only(left: 15, right: 15, top: 15),
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: AppTextField(
                                labelText: "اسم المؤسسة*",
                                maxLines: 1,
                                validator: InputValidator.requiredFiled,
                                controller: nameEnterpriseController,
                              ),
                            ),
                            10.horizontalSpace,
                            Expanded(
                              child: AppTextField(
                                labelText: "اسم العميل*",
                                maxLines: 1,
                                validator: InputValidator.requiredFiled,
                                controller: nameClientController,
                              ),
                            ),
                          ],
                        ),
                        15.verticalSpace,
                        AppTextField(
                          labelText: "رقم الجوال*",
                          maxLines: 1,
                          validator: InputValidator.requiredFiled,
                          inputType: TextInputType.phone,
                          maxLength: 15,
                          controller: mobileController,
                        ),
                        15.verticalSpace,
                        AppTextField(
                          labelText: "رقم آخر",
                          maxLines: 1,
                          inputType: TextInputType.phone,
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
                            Expanded(child: ActivityType()),
                            10.horizontalSpace,
                            Expanded(
                              child: CustomDropDown<ActivitySizeTypeEnum>(
                                hint: "حجم النشاط*",
                                height: 100.h,
                                items: ActivitySizeTypeEnum.values,
                                itemAsString: (item) => item!.value,
                                selectedItem: _selectedActivitySizeType,
                                onChanged: (value) {
                                  _selectedActivitySizeType = value;
                                },
                                validator: (value) {
                                  if (_selectedClientRegistrationTye == 'خاطئ')
                                    return null;
                                  return InputValidator.requiredFiled(value);
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
                            return InputValidator.requiredFiled(value);
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
                                    itemAsString: (city) => city!.cityName,
                                    selectedItem: cart.listcity
                                        .firstWhereOrNull((element) =>
                                            element.cityId == selectedCity),
                                    onChanged: (data) {
                                      if (data == null) {
                                        return;
                                      }
                                      selectedCity = data.cityId;
                                    },
                                    filterFn: (city, filter) =>
                                        city.searchString(filter),
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
                                  if (_selectedClientRegistrationTye == 'خاطئ')
                                    return null;
                                  return InputValidator.requiredFiled(value);
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
                        15.verticalSpace,
                        CustomSearchableDropDown<ClientSourceEnum>(
                          hint: "مصدر العميل*",
                          items: ClientSourceEnum.values,
                          selectedItem: userProvider.selectedSourceClient,
                          itemAsString: (item) => item!.value,
                          validator: (value) {
                            if (value == null) {
                              return 'هذا الحقل مطلوب.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            userProvider.selectedSourceClient = value;
                            if (value != ClientSourceEnum.recommendedClient) {
                              _selectedARecommendedClient = null;
                            }
                          },
                          filterFn: (clientSource, filter) {
                            return clientSource.value
                                .toLowerCase()
                                .contains(filter.toLowerCase());
                          },
                          compareFn: (a, b) => a.value == b.value,
                        ),
                        15.verticalSpace,
                        Consumer<UserProvider>(
                          builder: (context, value, child) {
                            return Column(
                              children: [
                                if ((userProvider.selectedSourceClient ==
                                    ClientSourceEnum.recommendedClient)) ...{
                                  BlocBuilder<ClientsListBloc,
                                      ClientsListState>(
                                    builder: (context, state) {
                                      final recommendedList = state
                                              .recommendedClientsState
                                              .getDataWhenSuccess ??
                                          [];

                                      return CustomSearchableDropDown<
                                          RecommendedClient>(
                                        hint: 'العملاء*',
                                        items: recommendedList,
                                        itemAsString: (item) =>
                                            item!.nameEnterprise!,
                                        validator: InputValidator.requiredFiled,
                                        filterFn: (item, query) {
                                          return item.nameEnterprise!
                                              .toLowerCase()
                                              .contains(query.toLowerCase());
                                        },
                                        compareFn: (item, query) {
                                          return item.nameEnterprise!
                                                  .toLowerCase() ==
                                              query.nameEnterprise!
                                                  .toLowerCase();
                                        },
                                        selectedItem: recommendedList
                                            .firstWhereOrNull((element) =>
                                                element.fkClient ==
                                                _selectedARecommendedClient),
                                        onChanged: (value) {
                                          if (value == null) {
                                            return;
                                          }
                                          _selectedARecommendedClient =
                                              value.fkClient;
                                          setState(() {});
                                        },
                                      );
                                    },
                                  ),
                                  15.verticalSpace,
                                }
                              ],
                            );
                          },
                        ),
                        Consumer<UserProvider>(
                          builder: (context, userProv, child) {
                            return Column(
                              children: [
                                if (_isNotFieldOrRecommended()) ...[
                                  AppDropdownButtonFormField<String, String>(
                                    items: ClientRegistrationType.values
                                        .map((e) => e.value)
                                        .toList(),
                                    hint: "نوع التسجيل*",
                                    itemAsValue: (String? item) => item!,
                                    itemAsString: (item) => item!,
                                    validator: InputValidator.requiredFiled,
                                    value: _selectedClientRegistrationTye,
                                    onChange: (value) {
                                      if (value == null) {
                                        return;
                                      }
                                      _selectedClientRegistrationTye = value;
                                      userProv
                                          .changeClientRegistrationTypeStatus(
                                              value);
                                    },
                                  ),
                                  15.verticalSpace,
                                  if (_showClassificationType(userProv
                                      .selectedClientRegistrationType)) ...[
                                    AppDropdownButtonFormField<String?,
                                        String?>(
                                      items: ClientsClassification.values
                                          .map((e) => e.value)
                                          .toList(),
                                      hint: "نوع التصنيف*",
                                      itemAsValue: (String? item) => item!,
                                      itemAsString: (item) => item!,
                                      validator: InputValidator.requiredFiled,
                                      value: _selectedClientsClassification,
                                      onChange: (value) {
                                        if (value == null) {
                                          return;
                                        }
                                        userProv
                                            .changeClientClassificationTypeStatus(
                                                value);
                                        if (value !=
                                            ClientsClassification.other.value) {
                                          reasonClassController.clear();
                                        }
                                      },
                                    ),
                                    15.verticalSpace,
                                  ],
                                ],
                              ],
                            );
                          },
                        ),
                        if (_isNotFieldOrRecommended()) ...{
                          Selector<UserProvider, String>(
                              selector: (context, userPro) =>
                                  userPro.selectedClientRegistrationType,
                              builder: (context, userProvider, child) {
                                return userProvider ==
                                            ClientsClassification.other.value ||
                                        (_selectedClientRegistrationTye ==
                                                "خاطئ" &&
                                            isEdit)
                                    ? 15.verticalSpace
                                    : IgnorePointer();
                              }),
                        },
                        if (_isNotFieldOrRecommended()) ...{
                          Consumer<UserProvider>(
                              builder: (contex, userProv, child) {
                            if (_showReasonField()) {
                              return AppTextField(
                                labelText: "ادخل السبب",
                                maxLines: 1,
                                validator: InputValidator.requiredFiled,
                                controller: reasonClassController,
                              );
                            }
                            return IgnorePointer();
                          }),
                        },
                        Consumer<UserProvider>(
                            builder: (contex, userPr, child) {
                          return userPr.selectedClientClassificationType ==
                                          ClientsClassification.other.value &&
                                      userPr.selectedClientRegistrationType ==
                                          "خاطئ" ||
                                  (userPr.selectedClientClassificationType ==
                                          ClientsClassification.other.value &&
                                      userPr.selectedClientRegistrationType ==
                                          "خاطئ" &&
                                      isEdit)
                              ? 15.verticalSpace
                              : IgnorePointer();
                        }),
                        Consumer<CompanyProvider>(
                          builder: (context, company, _) {
                            if (company.isloading) {
                              return AppLoader();
                            }
                            return AppDropdownButtonFormField<CompanyModel?,
                                String>(
                              items: company.list_company,
                              isWithImage: true,
                              onChange: (value) {
                                company.changevalueOut(value.toString());
                              },
                              hint: "نظام سابق",
                              itemAsValue: (CompanyModel? item) =>
                                  item!.id_Company,
                              itemAsString: (item) => item!.name_company!,
                              value: company.selectedValueOut,
                            );
                          },
                        ),
                        15.verticalSpace,
                        BlocBuilder<ClientsListBloc, ClientsListState>(
                          builder: (context, state) {
                            return SubscribingIntentionLevelWidget(
                              subscribingIntentionLevel:
                                  _bloc.subscribingIntentionLevel,
                              onChanged: (value) {
                                _bloc.subscribingIntentionLevel = value!;
                              },
                            );
                          },
                        ),
                        15.verticalSpace,
                      ],
                    ),
                  ),
                  10.verticalSpace,
                  BlocBuilder<ClientsListBloc, ClientsListState>(
                    builder: (context, state) {
                      return AppElevatedButton(
                        isLoading: state.actionClientBlocStatus.isLoading(),
                        text: isEdit ? "تعديل" : "إضافة",
                        onPressed: () {
                          if (!_fromKey.currentState!.validate()) {
                            return;
                          }
                          if (isEdit) {
                            _onEditClient();
                            return;
                          }

                          _onAddClient();
                        },
                      );
                    },
                  ),
                  SizedBox(height: 5),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  bool _isNotFieldOrRecommended() {
    return userProvider.selectedSourceClient?.value !=
            ClientSourceEnum.field.value &&
        userProvider.selectedSourceClient?.value !=
            ClientSourceEnum.recommendedClient.value;
  }

  bool _showReasonField() {
    if (userProvider.selectedClientClassificationType ==
            ClientsClassification.other.value &&
        userProvider.selectedClientRegistrationType ==
            ClientRegistrationType.wrong.value) {
      return true;
    }

    return false;
  }

  bool _showClassificationType(String registrationType) {
    return (registrationType == ClientRegistrationType.wrong.value) ||
        (_selectedClientRegistrationTye == ClientRegistrationType.wrong.value &&
            isEdit);
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
      isMarketing: userProvider.selectedSourceClient?.value !=
              ClientSourceEnum.field.value
          ? (userProvider.selectedSourceClient?.value == "عميل موصى به"
              ? '2'
              : '1')
          : '0',
      sourceClient: userProvider.selectedSourceClient!.value,
      descriptionActivity: descriptionActivityController.text,
      email: emailController.text,
      selectedActivitySizeType: _selectedActivitySizeType?.value,
      selectedARecommendedClient: _selectedARecommendedClient,
      location: locationController.text,
      statusClient: context.read<CompanyProvider>().selectedValueOut,
      clientId: widget.client!.idClients!,
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
                  ClientsClassification.other.value
          ? reasonClassController.text
          : "null",
    );

    _bloc.add(EditClientEvent(
      editClientParams,
      onSuccess: (client) => AppNavigator.pop(result: client),
    ));
  }

  void _onAddClient() {
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
      isMarketing: userProvider.selectedSourceClient?.value !=
              ClientSourceEnum.field.value
          ? (userProvider.selectedSourceClient?.value == "عميل موصى به"
              ? '2'
              : '1')
          : '0',
      sourceClient: userProvider.selectedSourceClient!.value,
      descriptionActivity: descriptionActivityController.text,
      // user: _userProvider.currentUser,
      email: emailController.text,
      selectedActivitySizeType: _selectedActivitySizeType?.value,
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
