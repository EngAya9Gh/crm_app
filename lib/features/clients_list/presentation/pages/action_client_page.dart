import 'package:collection/collection.dart';
import 'package:crm_smart/common/helpers/helper_functions.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/clients_list/domain/use_cases/add_client_usecase.dart';
import 'package:crm_smart/features/clients_list/domain/use_cases/edit_client_usecase.dart';
import 'package:crm_smart/features/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'package:crm_smart/features/manage_withdrawals/data/models/reject_reason.dart';
import 'package:crm_smart/features/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart';
import 'package:crm_smart/model/companyModel.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../../../../common/enums/activity_type_size.dart';
import '../../../../constants.dart';
import '../../../../constantsList.dart';
import '../../../../core/utils/responsive_padding.dart';
import '../../../../model/ActivityModel.dart';
import '../../../../model/maincitymodel.dart';
import '../../../../provider/switch_provider.dart';
import '../../../../view_model/activity_vm.dart';
import '../../../../view_model/company_vm.dart';
import '../../../../view_model/datetime_vm.dart';
import '../../../../view_model/maincity_vm.dart';
import '../../../../view_model/privilge_vm.dart';
import '../../../app/presentation/widgets/app_drop_down.dart';
import '../../../app/presentation/widgets/app_elvated_button.dart';
import '../../../app/presentation/widgets/app_loader_widget/app_loader.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../../app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import '../../data/models/clients_list_response.dart';
import '../../data/models/recommended_client.dart';
import '../manager/clients_list_bloc.dart';

class ActionClientPage extends StatefulWidget {
  const ActionClientPage({Key? key, this.client}) : super(key: key);
  final ClientModel? client;

  @override
  State<ActionClientPage> createState() => _ActionClientPageState();
}

class _ActionClientPageState extends State<ActionClientPage> {
  final _fromKey = GlobalKey<FormState>();
  late final ClientsListBloc _clientsListBloc;
  late ManageWithdrawalsCubit _manageWithdrawalsCubit;
  late final MainCityProvider _mainCityProvider;
  late final ClientTypeProvider _clientTypeProvider;
  late final UserProvider _userProvider;
  final intl.DateFormat formatter = intl.DateFormat('yyyy-MM-dd');

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
  DateTime dateOfferPrice = DateTime.now();

  String? selectedCity;
  String? selectedSourceClient;
  String? _selectedActivitySizeType;
  String? _selectedARecommendedClient;
  late ActivityProvider activityViewmodel;
  late PrivilegeCubit _privilegeCubit;

  late ValueNotifier<String?> clientName;
  late ValueNotifier<String?> reasonReject;

  @override
  void initState() {
    _clientsListBloc = context.read<ClientsListBloc>()..add(GetRecommendedClientsEvent());
    _manageWithdrawalsCubit = GetIt.I<ManageWithdrawalsCubit>()..getReasonReject();
    _privilegeCubit = GetIt.I<PrivilegeCubit>();
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
    nameEnterpriseController = TextEditingController(text: widget.client?.nameEnterprise);
    anotherNumberController = TextEditingController(text: widget.client?.phone);
    addressClientController = TextEditingController(text: widget.client?.addressClient);
    descriptionActivityController = TextEditingController(text: widget.client?.descriptionActiveController);
    reasonController = TextEditingController(text: widget.client?.reasonChange);
    offerPriceController = TextEditingController(text: widget.client?.offerPrice);

    _selectedActivitySizeType = widget.client?.sizeActivity;
    selectedSourceClient = !isEdit
        ? null
        : widget.client?.sourceClient == null
            ? 'ميداني'
            : widget.client?.sourceClient;

    _selectedARecommendedClient = widget.client?.fkClientSource;
    selectedCity = widget.client?.city;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _mainCityProvider.changevalue(null);

      _mainCityProvider
        ..getcityAll(onSuccess: isEdit ? () => _mainCityProvider.changevalue(widget.client?.city) : null);

      activityViewmodel = context.read<ActivityProvider>()
        ..initValueOut()
        ..getActivities(
            onSuccess: isEdit
                ? () => context.read<ActivityProvider>().onChangeSelectedActivityTypeId(widget.client?.activityTypeFk)
                : null);

      context.read<CompanyProvider>()
        ..initValueOut()
        ..getcompany(
            onSuccess: isEdit ? () => context.read<CompanyProvider>().changevalueOut(widget.client?.preSystem) : null);

      context.read<switch_provider>().changeboolValue(widget.client?.isMarketing == '1');

      _clientTypeProvider.type_of_client = widget.client?.typeClient == "تفاوض" ||
              widget.client?.typeClient == "عرض سعر" ||
              widget.client?.typeClient == "مستبعد"
          ? ['تفاوض', 'عرض سعر', 'مستبعد']
          : [];

      if (widget.client?.typeClient == "تفاوض" ||
          widget.client?.typeClient == "عرض سعر" ||
          widget.client?.typeClient == "مستبعد") {
        _clientTypeProvider.selectedValuemanag = widget.client?.typeClient.toString();
      }
      if (widget.client?.typeClient == "مشترك") {
        _clientTypeProvider.selectedValuemanag = null;
      }
      _clientTypeProvider.changevalue(_clientTypeProvider.selectedValuemanag);
    });

    reasonReject = ValueNotifier(widget.client?.rejectId);
    super.initState();
  }

  @override
  void dispose() {
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _manageWithdrawalsCubit,
      child: AppScaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: ValueListenableBuilder<String?>(
            valueListenable: clientName,
            builder: (context, value, _) {
              return SmartCrmAppBar(
                appBarParams: AppBarParams(title: isEdit ? value : "إضافة عميل"),
              );
            },
          ),
        ),
        body: Form(
          key: _fromKey,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Consumer<ClientTypeProvider>(builder: (context, clientTypeProvider, child) {
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
                                validator: HelperFunctions.instance.requiredFiled,
                                controller: nameEnterpriseController,
                              ),
                            ),
                            10.horizontalSpace,
                            Expanded(
                              child: AppTextField(
                                labelText: "اسم العميل*",
                                maxLines: 1,
                                validator: HelperFunctions.instance.requiredFiled,
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
                                  return DropdownSearch<ActivityModel>(
                                    mode: Mode.DIALOG,
                                    filterFn: (activity, filter) => activity!.getFilterActivityType(filter!),
                                    compareFn: (item, selectedItem) =>
                                    item?.id_activity_type == selectedItem?.id_activity_type,
                                    items: cart.activitiesList,
                                    itemAsString: (u) => u!.userAsString(),
                                    onChanged: (data) {
                                      cart.onChangeSelectedActivity(data);
                                    },
                                    selectedItem: cart.selectedActivity,
                                    showSearchBox: true,
                                    validator: (value) {
                                      if (value == null) {
                                        return 'هذا الحقل مطلوب.';
                                      }
                                      return null;
                                    },
                                    dropdownSearchDecoration: InputDecoration(
                                      isCollapsed: true,
                                      hintText: 'نوع النشاط*',
                                      hintStyle: context.textTheme.titleSmall?.copyWith(color: Colors.grey),
                                      contentPadding: HWEdgeInsetsDirectional.only(start: 12, end: 12),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.primary),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.primary),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.primary),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.primary),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.error),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.error),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                    ),
                                    // InputDecoration(border: InputBorder.none),
                                  );
                                },
                              ),
                            ),
                            10.horizontalSpace,
                            Expanded(
                              child: AppDropdownButtonFormField<ActivitySizeType, String>(
                                items: ActivitySizeType.values,
                                hint: "حجم النشاط*",
                                itemAsValue: (ActivitySizeType? item) => item?.value,
                                itemAsString: (item) => item!.value,
                                validator: HelperFunctions.instance.requiredFiled,
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
                          validator: HelperFunctions.instance.requiredFiled,
                          contentPadding: HWEdgeInsetsDirectional.only(start: 16, end: 10, top: 10, bottom: 10),
                          controller: descriptionActivityController,
                        ),
                        15.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: Consumer<MainCityProvider>(
                                builder: (context, cart, child) {
                                  return DropdownSearch<CityModel>(
                                    mode: Mode.DIALOG,
                                    filterFn: (city, filter) => city!.getfilteruser(filter!),
                                    items: cart.listcity,
                                    itemAsString: (u) => u!.userAsString(),
                                    selectedItem: cart.listcity
                                        .firstWhereOrNull((element) => element.id_city == selectedCity),
                                    onChanged: (data) {
                                      if (data == null) {
                                        return;
                                      }
                                      selectedCity = data.id_city;
                                    },
                                    showSearchBox: true,
                                    validator: (value) {
                                      if (value == null) {
                                        return 'هذا الحقل مطلوب.';
                                      }
                                      return null;
                                    },
                                    dropdownSearchDecoration: InputDecoration(
                                      isCollapsed: true,
                                      hintText: 'المدينة*',
                                      hintStyle: context.textTheme.titleSmall?.copyWith(color: Colors.grey),
                                      contentPadding: HWEdgeInsetsDirectional.only(start: 12, end: 12),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.primary),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.primary),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.primary),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.primary),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.error),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.error),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                    ),
                                    // InputDecoration(border: InputBorder.none),
                                  );
                                },
                              ),
                            ),
                            10.horizontalSpace,
                            Expanded(
                              child: AppTextField(
                                labelText: "عنوان العميل*",
                                maxLines: 1,
                                validator: HelperFunctions.instance.requiredFiled,
                                controller: addressClientController,
                              ),
                            ),
                          ],
                        ),
                        15.verticalSpace,
                        if (isEdit)
                          if (_privilegeCubit.checkPrivilege('27') == false) ...{
                            AppTextField(
                              labelText: "الموقع",
                              maxLines: 1,
                              controller: locationController,
                            ),
                            15.verticalSpace,
                          },
                        if (!isEdit) ...{
                          AppTextField(
                            labelText: "الموقع",
                            maxLines: 1,
                            controller: locationController,
                          ),
                          15.verticalSpace,
                        },
                        AppTextField(
                          labelText: "رقم آخر",
                          maxLines: 1,
                          textInputType: TextInputType.phone,
                          maxLength: 15,
                          controller: anotherNumberController,
                        ),
                        15.verticalSpace,
                        AppDropdownButtonFormField<String, String>(
                          items: sourceClientsList,
                          onChange: (value) {
                            if (value == null) {
                              return;
                            }

                            setState(() {
                              selectedSourceClient = value.toString();
                              if (selectedSourceClient != 'عميل موصى به' && _selectedARecommendedClient != null) {
                                _selectedARecommendedClient = null;
                              }
                            });
                          },
                          hint: "مصدر العميل*",
                          validator: HelperFunctions.instance.requiredFiled,
                          itemAsValue: (String? item) => item,
                          itemAsString: (item) => item!,
                          value: selectedSourceClient,
                        ),
                        15.verticalSpace,
                        if (selectedSourceClient == 'عميل موصى به') ...{
                          BlocBuilder<ClientsListBloc, ClientsListState>(
                            builder: (context, state) {
                              final recommendedList = state.recommendedClientsState.getDataWhenSuccess ?? [];

                              return AppDropdownButtonFormField<RecommendedClient, String>(
                                itemAsValue: (item) => item!.fkClient,
                                hint: 'العملاء*',
                                onChange: (value) {
                                  if (value == null) {
                                    return;
                                  }
                                  setState(() {
                                    _selectedARecommendedClient = value.toString();
                                  });
                                },
                                validator: HelperFunctions.instance.requiredFiled,
                                value: _selectedARecommendedClient,
                                items: recommendedList,
                                itemAsString: (item) => item!.nameEnterprise!,
                                icon: state.recommendedClientsState.isLoading ? AppLoader(size: 15.r) : null,
                              );
                            },
                          ),
                          15.verticalSpace,
                        },
                        Consumer<CompanyProvider>(
                          builder: (context, company, _) {
                            return AppDropdownButtonFormField<CompanyModel, String>(
                              items: company.list_company,
                              onChange: (value) {
                                company.changevalueOut(value.toString());
                              },
                              hint: "نظام سابق",
                              itemAsValue: (CompanyModel? item) => item?.id_Company,
                              itemAsString: (item) => item!.name_company!,
                              value: company.selectedValueOut,
                            );
                          },
                        ),
                        10.verticalSpace,
                        if (_privilegeCubit.checkPrivilege('27') && isShowingClientStatus && isEdit) ...{
                          AppDropdownButtonFormField<String, String>(
                            items: clientTypeProvider.type_of_client,
                            onChange: (status) {
                              clientTypeProvider.changevalue(status.toString());
                            },
                            hint: "حالة العميل",
                            itemAsValue: (String? item) => item,
                            itemAsString: (item) => item!,
                            value: clientTypeProvider.selectedValuemanag,
                          ),
                          10.verticalSpace,
                        },
                        if (_privilegeCubit.checkPrivilege('27') &&
                            isEdit &&
                            clientTypeProvider.selectedValuemanag == "عرض سعر") ...{
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: AppTextField(
                                  labelText: "عرض سعر",
                                  maxLines: 1,
                                  controller: offerPriceController,
                                  textInputType: TextInputType.number,
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                flex: 5,
                                child: TextFormField(
                                  validator: (value) {
                                    if (dateOfferPrice == DateTime(1, 1, 1)) {
                                      return 'يرجى تعيين التاريخ ';
                                    }
                                    return null;
                                  },
                                  style: context.textTheme.titleSmall.r?.copyWith(
                                    color: context.colorScheme.onBackground,
                                    decoration: TextDecoration.none,
                                    decorationColor: context.colorScheme.borderTextField,
                                  ),
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.date_range,
                                        color: kMainColor,
                                      ),
                                      hintStyle: const TextStyle(
                                          color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                                      hintText: intl.DateFormat("yyyy/MM/dd")
                                          .format(Provider.of<datetime_vm>(context, listen: true).valuedateTime),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.primary),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.primary),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: context.colorScheme.primary),
                                        borderRadius: BorderRadius.circular(10).r,
                                      ),
                                      filled: false,
                                      isDense: true,
                                      isCollapsed: true),
                                  readOnly: true,
                                  onTap: () {
                                    _selectDate(context, DateTime.now());
                                  },
                                ),
                              ),
                            ],
                          ),
                          10.verticalSpace,
                        },
                        if (_privilegeCubit.checkPrivilege('27') &&
                            isEdit &&
                            clientTypeProvider.selectedValuemanag == "مستبعد") ...{
                          BlocBuilder<ManageWithdrawalsCubit, ManageWithdrawalsState>(
                            builder: (context, state) {
                              return ValueListenableBuilder<String?>(
                                  valueListenable: reasonReject,
                                  builder: (context, value, _) {
                                    return AppDropdownButtonFormField<RejectReason, String>(
                                      items: state.rejectReasonsStat.getDataWhenSuccess ?? [],
                                      onChange: (reason) {
                                        reasonReject.value = reason;
                                      },
                                      hint: "أسباب الاستبعاد",
                                      itemAsValue: (RejectReason? item) => item!.idRejectClient!,
                                      itemAsString: (item) => item!.nameReasonReject!,
                                      value: value,
                                      validator: HelperFunctions.instance.requiredFiled,
                                    );
                                  });
                            },
                          ),
                          10.verticalSpace,
                          AppTextField(
                            labelText: "سبب الاستبعاد",
                            maxLines: 1,
                            controller: reasonController,
                            validator: HelperFunctions.instance.requiredFiled,
                          ),
                          10.verticalSpace,
                        },
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
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                        ),
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
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, DateTime currentDate) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3000));
    if (pickedDate != null) {
      setState(() {
        dateOfferPrice = pickedDate;
      });
      context.read<datetime_vm>().setdatetimevalue1(dateOfferPrice);
    }
  }

  bool get isShowingClientStatus => widget.client?.typeClient != "مشترك" && widget.client?.typeClient != "منسحب";

  bool get isEdit => widget.client != null;

  void _onEditClient() {
    final EditClientParams editClientParams = EditClientParams(
      nameClient: nameClientController.text,
      nameEnterprise: nameEnterpriseController.text,
      city: selectedCity!,
      mobile: mobileController.text,
      anotherPhoneNumber: anotherNumberController.text,
      addressClient: addressClientController.text,
      selectedActivityIdType: activityViewmodel.selectedActivity!.id_activity_type,
      isMarketing: selectedSourceClient != 'ميداني' ? (selectedSourceClient == "عميل موصى به" ? '2' : '1') : '0',
      sourceClient: selectedSourceClient!,
      descriptionActivity: descriptionActivityController.text,
      email: emailController.text,
      selectedActivitySizeType: _selectedActivitySizeType,
      selectedARecommendedClient: _selectedARecommendedClient,
      location: locationController.text,
      statusClient: context.read<CompanyProvider>().selectedValueOut,
      typeClient: widget.client?.typeClient != "مشترك" && widget.client?.typeClient != "منسحب"
          ? _clientTypeProvider.selectedValuemanag!
          : widget.client!.typeClient!,
      userActionID: _userProvider.currentUser.idUser!,
      clientId: widget.client!.idClients!,
      offerPrice: offerPriceController.text,
      reason: reasonController.text,
      dateChangeType: _clientTypeProvider.selectedValuemanag != null ? formatter.format(DateTime.now()) : null,
      datePrice: _clientTypeProvider.selectedValuemanag == "عرض سعر" ? dateOfferPrice.toIso8601String() : null,
      rejectId: reasonReject.value,
    );

    _clientsListBloc.add(EditClientEvent(
      editClientParams,
      onSuccess: (client) {
        Navigator.pop(context, client);
      },
    ));
  }

  void _onAddClient() {
    final AddClientParams addClientParams = AddClientParams(
      nameClient: nameClientController.text,
      nameEnterprise: nameEnterpriseController.text,
      city: selectedCity!,
      mobile: mobileController.text,
      anotherPhoneNumber: anotherNumberController.text,
      addressClient: addressClientController.text,
      selectedActivityIdType: activityViewmodel.selectedActivity!.id_activity_type,
      isMarketing: selectedSourceClient != 'ميداني' ? (selectedSourceClient == "عميل موصى به" ? '2' : '1') : '0',
      sourceClient: selectedSourceClient!,
      descriptionActivity: descriptionActivityController.text,
      user: _userProvider.currentUser,
      email: emailController.text,
      selectedActivitySizeType: _selectedActivitySizeType,
      selectedARecommendedClient: _selectedARecommendedClient,
      location: locationController.text,
      statusClient: context.read<CompanyProvider>().selectedValueOut,
    );

    _clientsListBloc.add(AddClientEvent(
      addClientParams,
      onSuccess: (client) => Navigator.pop(context, client),
    ));
  }
}
