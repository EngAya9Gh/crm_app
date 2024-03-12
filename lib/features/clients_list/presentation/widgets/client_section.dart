import 'dart:ui' as myui;

import 'package:crm_smart/core/common/models/page_state/page_state.dart';
import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart';
import 'package:crm_smart/features/clients_list/domain/use_cases/change_type_client_usecase.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/client/transfer_client.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../core/common/helpers/helper_functions.dart';
import '../../../../core/di/di_container.dart';
import '../../../../function_global.dart';
import '../../../../model/clientmodel.dart';
import '../../../../view_model/datetime_vm.dart';
import '../../../../view_model/typeclient.dart';
import '../../../app/presentation/widgets/app_drop_down.dart';
import '../../../app/presentation/widgets/app_elvated_button.dart';
import '../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../manage_withdrawals/data/models/reject_reason.dart';
import '../../../manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart';
import '../../../task_management/presentation/manager/task_cubit.dart';
import '../../../task_management/presentation/widgets/add_manual_task_button.dart';
import '../../domain/use_cases/approve_reject_client_usecase.dart';
import '../manager/clients_list_bloc.dart';
import '../pages/action_client_page.dart';

class ClientSection extends StatefulWidget {
  ClientSection(
      {this.clienttransfer,
      required this.invoice,
      this.typeinvoice,
      required this.idclient,
      this.client,
      Key? key})
      : super(key: key);
  String idclient;
  InvoiceModel? invoice;
  String? clienttransfer;
  String? typeinvoice;
  ClientModel1? client;

  //bool? itemapprove;
  @override
  _ClientSectionState createState() => _ClientSectionState();
}

class _ClientSectionState extends State<ClientSection> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late ClientModel1 clientModel1;
  bool isUpdate = false;
  late ClientTypeProvider _clientTypeProvider;
  late ManageWithdrawalsCubit _manageWithdrawalsCubit;
  late final ClientsListBloc _clientsListBloc;
  late ChangeTypeClientParam changeTypeClientParams;
  late ValueNotifier<String?> reasonReject;

  final _globalKey = GlobalKey<FormState>();
  late final TextEditingController reasonController;
  late final TextEditingController offerPriceController;
  DateTime dateOfferPrice = DateTime.now();

  // late ClientModel clientModel = ClientModel();
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

      context
          .read<datetime_vm>()
          .setdatetimevalue1(dateOfferPrice, isInit: true);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _manageWithdrawalsCubit = getIt<ManageWithdrawalsCubit>()
      ..getReasonReject();

    reasonReject = ValueNotifier(widget.client?.fk_rejectClient);

    _clientsListBloc = context.read<ClientsListBloc>();
    _clientTypeProvider = context.read<ClientTypeProvider>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _clientTypeProvider.type_of_client =
          widget.client?.typeClient == "تفاوض" ||
                  widget.client?.typeClient == "عرض سعر"
              ? ['تفاوض', 'عرض سعر', 'مستبعد']
              : _clientTypeProvider.type_of_client =
                  widget.client?.typeClient == "معلق استبعاد"
                      ? ['معلق استبعاد']
                      : [];
      if (widget.client?.typeClient == "تفاوض" ||
          widget.client?.typeClient == "عرض سعر" ||
          widget.client?.typeClient == "معلق استبعاد" ||
          widget.client?.typeClient == "مستبعد") {
        _clientTypeProvider.selectedValuemanag =
            widget.client?.typeClient.toString();
      }
      if (widget.client?.typeClient == "مشترك") {
        _clientTypeProvider.selectedValuemanag = null;
      }

      reasonController =
          TextEditingController(text: widget.client?.reasonChange);
      offerPriceController =
          TextEditingController(text: widget.client?.offer_price);
      _clientTypeProvider.changevalue(_clientTypeProvider.selectedValuemanag);

      Provider.of<datetime_vm>(context, listen: false).setdatetimevalue1(
          intl.DateFormat('yyyy-MM-dd').parse(widget.client?.date_price ?? ''),
          isInit: true);
    });

    super.initState();
  }

  showAlertDialog(BuildContext context) {
    Widget dialog = SimpleDialog(
        titlePadding: const EdgeInsets.fromLTRB(24.0, 1.0, 24.0, 10.0),
        insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        title:
            Center(child: Text('', style: TextStyle(fontFamily: kfontfamily2))),
        children: [
          StatefulBuilder(builder:
              (BuildContext context, void Function(void Function()) refresh) {
            return BlocProvider(
              create: (context) => _manageWithdrawalsCubit,
              child: Directionality(
                  textDirection: myui.TextDirection.rtl,
                  child: Form(
                      key: _globalKey,
                      child: Consumer<ClientTypeProvider>(
                          builder: (context, clientTypeProvider, child) {
                        return Column(children: [
                          SizedBox(height: 10),
                          if (context
                              .read<PrivilegeCubit>()
                              .checkPrivilege('27')) ...{
                            AppDropdownButtonFormField<String, String>(
                              items: clientTypeProvider.type_of_client,
                              onChange: (status) {
                                clientTypeProvider
                                    .changevalue(status.toString());
                              },
                              hint: "حالة العميل",
                              itemAsValue: (String? item) => item,
                              itemAsString: (item) => item!,
                              value: clientTypeProvider.selectedValuemanag,
                            ),
                            10.verticalSpace,
                          },
                          if (context
                                  .read<PrivilegeCubit>()
                                  .checkPrivilege('27') &&
                              clientTypeProvider.selectedValuemanag ==
                                  "عرض سعر") ...{
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: AppTextField(
                                    validator: (value) {
                                      if (offerPriceController.text.isEmpty) {
                                        return 'حقل مطلوب';
                                      }
                                      return null;
                                    },
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
                                    style: context.textTheme.titleSmall.r
                                        ?.copyWith(
                                      color: context.colorScheme.onBackground,
                                      decoration: TextDecoration.none,
                                      decorationColor:
                                          context.colorScheme.borderTextField,
                                    ),
                                    textAlignVertical: TextAlignVertical.center,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.date_range,
                                          color: kMainColor,
                                        ),
                                        hintStyle: const TextStyle(
                                            color: Colors.black45,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                        hintText: intl.DateFormat("yyyy/MM/dd")
                                            .format(Provider.of<datetime_vm>(
                                                    context,
                                                    listen: true)
                                                .valuedateTime),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  context.colorScheme.primary),
                                          borderRadius:
                                              BorderRadius.circular(10).r,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  context.colorScheme.primary),
                                          borderRadius:
                                              BorderRadius.circular(10).r,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  context.colorScheme.primary),
                                          borderRadius:
                                              BorderRadius.circular(10).r,
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
                          if (context
                                  .read<PrivilegeCubit>()
                                  .checkPrivilege('27') &&
                              clientTypeProvider.selectedValuemanag ==
                                  "مستبعد") ...{
                            BlocBuilder<ManageWithdrawalsCubit,
                                ManageWithdrawalsState>(
                              builder: (context, state) {
                                return ValueListenableBuilder<String?>(
                                    valueListenable: reasonReject,
                                    builder: (context, value, _) {
                                      return AppDropdownButtonFormField<
                                          RejectReason, String>(
                                        items: state.rejectReasonsStat
                                                .getDataWhenSuccess ??
                                            [],
                                        onChange: (reason) {
                                          reasonReject.value = reason;
                                        },
                                        hint: "أسباب الاستبعاد",
                                        itemAsValue: (RejectReason? item) =>
                                            item!.idRejectClient!,
                                        itemAsString: (item) =>
                                            item!.nameReasonReject!,
                                        value: value,
                                        validator: HelperFunctions
                                            .instance.requiredFiled,
                                      );
                                    });
                              },
                            ),
                            10.verticalSpace,
                            AppTextField(
                              labelText: "سبب الاستبعاد",
                              maxLines: 3,
                              controller: reasonController,
                              validator: HelperFunctions.instance.requiredFiled,
                            ),
                            10.verticalSpace,
                          },
                          10.verticalSpace,
                          clientModel1.typeClient != "معلق استبعاد"
                              ? BlocBuilder<ClientsListBloc, ClientsListState>(
                                  builder: (context, state) {
                                    return AppElevatedButton(
                                      isLoading: state.actionClientBlocStatus
                                          .isLoading(),
                                      text: "حفظ",
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0)),
                                      ),
                                      onPressed: () async {
                                        if (!_globalKey.currentState!
                                            .validate()) {
                                          return;
                                        }

                                        // code comment #
                                        changeTypeClientParams =
                                            ChangeTypeClientParam(
                                          type_client: _clientTypeProvider
                                              .selectedValuemanag!,
                                          //!= "مشترك" && widget.client?.typeClient != "منسحب"
                                          //? _clientTypeProvider.selectedValuemanag!
                                          // : widget.client!.typeClient!,
                                          // clientId: widget.client!.idClients!,
                                          userId: Provider.of<UserProvider>(
                                                  context,
                                                  listen: false)
                                              .currentUser
                                              .idUser!,
                                          fk_rejectClient: reasonReject.value,

                                          reason_change: reasonController.text,

                                          offer_price:
                                              offerPriceController.text,
                                          // dateChangeType: _clientTypeProvider.selectedValuemanag != null ?
                                          // formatter.format(DateTime.now()) : null,
                                          date_price: _clientTypeProvider
                                                      .selectedValuemanag ==
                                                  "عرض سعر"
                                              ? dateOfferPrice.toIso8601String()
                                              : null,
                                          id_clients: widget.client!.idClients
                                              .toString(),
                                        );
                                        _clientsListBloc.add(
                                            ChangeTypeClientEvent(
                                                changeTypeClientParams,
                                                onSuccess: (client) {
                                          Navigator.pop(context, client);
                                          Navigator.pop(context, client);
                                        }));
                                      },
                                    );
                                  },
                                )
                              : context
                                      .read<PrivilegeCubit>()
                                      .checkPrivilege('177')
                                  ? BlocBuilder<ClientsListBloc,
                                      ClientsListState>(
                                      builder: (context, state) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            AppElevatedButton(
                                              isLoading: state
                                                  .actionClientBlocStatus
                                                  .isLoading(),
                                              text: "موافقة",
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0)),
                                              ),
                                              onPressed: () async {
                                                _clientsListBloc.add(
                                                    ApproveRejectClientEvent(
                                                        ApproveRejectClientPararm(
                                                          id_clients: widget
                                                              .idclient
                                                              .toString(),
                                                          isAppprove: '1',
                                                          userId: Provider.of<
                                                                      UserProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .currentUser
                                                              .idUser!,
                                                        ), onSuccess: (client) {
                                                  Navigator.pop(
                                                      context, client);
                                                  Navigator.pop(
                                                      context, client);
                                                }));
                                              },
                                            ),
                                            AppElevatedButton(
                                              isLoading: state
                                                  .actionClientBlocStatus
                                                  .isLoading(),
                                              text: "رفض",
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0)),
                                              ),
                                              onPressed: () async {
                                                _clientsListBloc.add(
                                                    ApproveRejectClientEvent(
                                                        ApproveRejectClientPararm(
                                                          id_clients: widget
                                                              .idclient
                                                              .toString(),
                                                          isAppprove: '0',
                                                          userId: Provider.of<
                                                                      UserProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .currentUser
                                                              .idUser!,
                                                        ), onSuccess: (client) {
                                                  Navigator.pop(
                                                      context, client);
                                                  Navigator.pop(
                                                      context, client);
                                                }));
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    )
                                  : Container()
                        ]);
                      }))),
            );
          })
        ]);

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientProvider>(builder: (context, state, _) {
      if (state.currentClientModel.isLoading ||
          state.currentClientModel.isInit) {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (state.currentClientModel.isFailure) {
        return Scaffold(
          body: Center(
            child: IconButton(
              onPressed: () => context
                  .read<ClientProvider>()
                  .get_byIdClient(widget.idclient.toString()),
              icon: Icon(Icons.refresh),
            ),
          ),
        );
      }
      if (!isUpdate) {
        clientModel1 = state.currentClientModel.data!;
      }
      print("Client name: ${clientModel1.nameClient}");
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          // height: MediaQuery.of(context).size.height*0.73,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 10),
            child: SingleChildScrollView(
              child: Column(children: [
                AddManualTaskButton(
                  list: clientPublicTypeList,
                  clientId: clientModel1.idClients,
                ),
                // InkWell(
                //     onTap: ()async{
                //       await FlutterPhoneDirectCaller.callNumber(clientModel.mobile.toString());
                //     },
                //     child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          //color: kMainColor,
                          decoration: BoxDecoration(
                              color: kMainColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: IconButton(
                            onPressed: () async {
                              await FlutterPhoneDirectCaller.callNumber(
                                  clientModel1.mobile.toString());
                            },
                            icon: Icon(Icons.call),
                            iconSize: 15,
                            color: kWhiteColor,
                          ),
                        ),
                        (context.read<PrivilegeCubit>().checkPrivilege('133') ==
                                true)
                            ? IconButton(
                                onPressed: () {
                                  if ((context
                                          .read<PrivilegeCubit>()
                                          .checkPrivilege('147') ==
                                      true))
                                    context
                                        .read<ClientProvider>()
                                        .setTagClient();
                                },
                                icon: Icon(
                                  (clientModel1.tag ?? false)
                                      ? CupertinoIcons.checkmark_seal_fill
                                      : CupertinoIcons.checkmark_seal,
                                  color: (clientModel1.tag ?? false)
                                      ? Colors.amber
                                      : null,
                                ),
                                tooltip: (clientModel1.tag ?? false)
                                    ? "مميز"
                                    : "غير مميز",
                              )
                            : IgnorePointer(),
                      ],
                    ),
                    TextButton(
                      onPressed: () async {
                        await FlutterPhoneDirectCaller.callNumber(
                            clientModel1.mobile.toString());
                      },
                      child: Text(
                        clientModel1.mobile.toString(),
                        style: TextStyle(
                            fontFamily: kfontfamily2, color: kMainColor),
                      ),
                    ),
                    // Text(clientModel.mobile.toString(),
                    //   style: TextStyle(
                    //       fontFamily: kfontfamily2,
                    //       color: Colors.black
                    //   ),
                    // ),
                  ],
                ),
                //cardRow(  title:'رقم الهاتف',value:clientModel.mobile.toString())
                // ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onLongPress: () async {
                      await Clipboard.setData(ClipboardData(
                              text: clientModel1.serialNumber.toString()))
                          .then((value) => ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                "تم النسخ إلى الحافظة",
                                textDirection: TextDirection.rtl,
                              ))));
                    },
                    child: cardRow(
                        title: 'الرقم المرجعي',
                        value: clientModel1.serialNumber.toString())),
                cardRow(
                    title: 'تاريخ الاضافة',
                    value: clientModel1.dateCreate.toString()),
                cardRow(
                  title: 'المؤسسة',
                  value: clientModel1.nameEnterprise.toString(),
                  isExpanded: true,
                ),
                cardRow(
                  title: 'اسم العميل',
                  value: clientModel1.nameClient.toString(),
                  isExpanded: true,
                ),
                cardRow(
                    title: ' الفرع',
                    value: clientModel1.name_regoin.toString()),

                cardRow(
                    title: ' نوع النشاط',
                    value: clientModel1.activity_type_title?.toString() ??
                        "لا يوجد"),
                clientModel1.size_activity != null
                    ? cardRow(
                        title: 'حجم النشاط',
                        value: clientModel1.size_activity.toString())
                    : IgnorePointer(),
                clientModel1.email != null
                    ? cardRow(
                        title: 'البريد الالكتروني',
                        value: clientModel1.email.toString())
                    : IgnorePointer(),

                cardRow(
                    title: ' مدينة العميل',
                    value: clientModel1.name_city.toString()),
                cardRow(
                    title: ' المنطقة',
                    value: clientModel1.namemaincity.toString()),

                clientModel1.phone == '' || clientModel1.phone == null
                    ? IgnorePointer()
                    : cardRow(
                        title: ' رقم آخر',
                        value: clientModel1.phone.toString()),

                cardRow(
                    title: 'حالة العميل',
                    value: clientModel1.typeClient.toString()),
                clientModel1.typeClient == 'مستبعد'
                    ? cardRow(
                        value: clientModel1.nameUserApproveRreject.toString(),//nameuserdoning
                        title: 'قام بتحويل حالة العميل')
                    : IgnorePointer(),

                clientModel1.typeClient == 'مستبعد'
                    ? cardRow(
                        value: clientModel1.date_approve_reject.toString(),//clientModel1.dateChangetype.toString(),
                        title: 'تاريخ تحويل حالة العميل')
                    : IgnorePointer(),
                clientModel1.typeClient == 'مستبعد'
                    ? cardRow(
                        value: clientModel1.reasonChange.toString(),
                        title: 'تفاصيل الاستبعاد')
                    : IgnorePointer(),
                clientModel1.typeClient == 'مستبعد'
                    ? cardRow(
                        value: clientModel1.NameReason_reject.toString(),
                        title: 'سبب الاستبعاد')
                    : IgnorePointer(),

                clientModel1.typeClient == 'عرض سعر'
                    ? cardRow(
                        title: 'مبلغ عرض السعر',
                        value: clientModel1.offer_price.toString())
                    : IgnorePointer(),

                clientModel1.typeClient == 'عرض سعر'
                    ? cardRow(
                        title: 'تاريخ عرض السعر',
                        value: clientModel1.date_price.toString())
                    : IgnorePointer(),

                clientModel1.user_do != null
                    ? cardRow(
                        title: 'الموظف الذي قام بتغيير حالة العميل',
                        value: clientModel1.nameuserdoning.toString())
                    : IgnorePointer(),

                cardRow(
                    title: 'الموظف الذي أضاف العميل',
                    value: getnameshort(clientModel1.nameAdduser.toString())),
                cardRow(
                    title: 'الموظف',
                    value: getnameshort(clientModel1.nameUser.toString())),

                cardRow(
                    title: 'رقم الموظف',
                    value: clientModel1.mobileuser.toString()),

                if (clientModel1.reasonTransfer != null)
                  context.read<PrivilegeCubit>().checkPrivilege('150') ==
                              true &&
                          clientModel1.fkusertrasfer != null
                      ? cardRow(
                          title: 'قام بتحويل العميل',
                          value: getnameshort(
                              clientModel1.nameusertransfer.toString()))
                      : IgnorePointer()
                else
                  clientModel1.fkusertrasfer != null
                      ? cardRow(
                          title: 'قام بتحويل العميل',
                          value: getnameshort(
                              clientModel1.nameusertransfer.toString()))
                      : IgnorePointer(),

                context.read<PrivilegeCubit>().checkPrivilege('150') == true &&
                        (clientModel1.reasonTransfer != null) &&
                        clientModel1.fkusertrasfer != null
                    ? cardRow(
                        title: 'تحويل العميل إلى',
                        value: clientModel1.nameTransferTo.toString())
                    : IgnorePointer(),

                context.read<PrivilegeCubit>().checkPrivilege('150') == true &&
                        (clientModel1.reasonTransfer == null) &&
                        clientModel1.fkusertrasfer != null
                    ? cardRow(title: 'حالة التحويل', value: 'تم قبول التحويل')
                    : IgnorePointer(),

                context.read<PrivilegeCubit>().checkPrivilege('150') == true &&
                        (clientModel1.reasonTransfer != null) &&
                        clientModel1.fkusertrasfer != null
                    ? cardRow(title: 'حالة التحويل', value: 'معلق')
                    : IgnorePointer(),

                // (clientModel.reasonTransfer == null) &&
                clientModel1.fkusertrasfer != null
                    ? cardRow(
                        title: 'تاريخ التحويل',
                        value: clientModel1.dateTransfer.toString())
                    : IgnorePointer(),

                clientModel1.location.toString() == ''
                    ? IgnorePointer()
                    : cardRow(
                        title: ' الموقع',
                        value: clientModel1.location.toString()),

                clientModel1.ismarketing == '1'
                    ? cardRow(
                        title: ' عميل تسويق الكتروني',
                        value: clientModel1.ismarketing == '1' ? 'نعم' : '')
                    : IgnorePointer(),

                clientModel1.type_record != null &&
                        clientModel1.type_record.toString().trim().isNotEmpty &&
                        clientModel1.type_record != ""
                    ? cardRow(
                        title: 'نوع التسجيل',
                        value: clientModel1.type_record.toString())
                    : IgnorePointer(),

                clientModel1.type_classification != null &&
                        clientModel1.type_classification
                            .toString()
                            .trim()
                            .isNotEmpty &&
                        clientModel1.type_classification != "null"
                    ? cardRow(
                        title: 'نوع التصنيف',
                        value: clientModel1.type_classification.toString())
                    : IgnorePointer(),
                clientModel1.reason_class != null &&
                        clientModel1.reason_class
                            .toString()
                            .trim()
                            .isNotEmpty &&
                        clientModel1.reason_class != "null"
                    ? cardRow(
                        title: 'سبب الإدخال',
                        value: clientModel1.reason_class.toString())
                    : IgnorePointer(),
                cardRow(
                    title: 'عنوان العميل',
                    value: clientModel1.address_client == null
                        ? ''
                        : clientModel1.address_client.toString()),

                clientModel1.presystem == null ||
                        clientModel1.presystem.toString().trim().isEmpty
                    ? IgnorePointer()
                    : cardRow(
                        title: 'نظام سابق',
                        value: clientModel1.presystemtitle == null
                            ? ''
                            : clientModel1.presystemtitle.toString()),

                cardRow(
                    title: 'مصدر العميل',
                    value: clientModel1.sourcclient == null
                        ? ''
                        : clientModel1.sourcclient.toString()),
                if (clientModel1.sourcclient == 'عميل موصى به')
                  cardRow(
                      title: 'تمت التوصية من:',
                      value: clientModel1.NameClient_recomand == null
                          ? ''
                          : clientModel1.NameClient_recomand.toString()),

                clientModel1.activity_type_fk == null
                    ? cardRow(
                        title: 'نوع النشاط',
                        value: clientModel1.activity_type_title.toString())
                    : IgnorePointer(),

                clientModel1.activity_type_fk == null
                    ? cardRow(
                        title: 'وصف النشاط',
                        value: clientModel1.descActivController.toString())
                    : IgnorePointer(),

                widget.clienttransfer == 'transfer'
                    ? IgnorePointer()
                    : Center(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                clientModel1.typeClient == "عرض سعر" ||
                                        clientModel1.typeClient == "تفاوض" ||
                                        // clientModel1.typeClient == "مستبعد" ||
                                        clientModel1.typeClient ==
                                            'معلق استبعاد'
                                    ? Expanded(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      kMainColor)),
                                          onPressed: () async {
                                            ClientModel? result =
                                                // await Navigator.push(
                                                //   context,
                                                //   CupertinoPageRoute(
                                                //     builder: (context) =>
                                                //         dailog_change_type(
                                                //             client: clientModel1.mapToClientModel()),
                                                //   ),
                                                // );
                                                await showAlertDialog(context);
                                            print('result.nameEnterprise');
                                            print(result?.nameEnterprise);
                                            if (result != null)
                                              setState(() {
                                                print('result.nameEnterprise');
                                                print(result?.nameEnterprise);
                                                clientModel1 =
                                                    result.mapToClientModel1();
                                              });
                                          },
                                          // showDialog<void>
                                          // (context: context,
                                          // builder: (context) =>  dialog),

                                          child: Text('اجراءات'),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                kMainColor)),
                                    onPressed: () async =>
                                        _onPressedUpdate(context),
                                    child: Text('تعديل بيانات العميل'),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                clientModel1.typeClient == "عرض سعر" ||
                                        clientModel1.typeClient == "تفاوض"
                                    ? SizedBox(
                                        width: 5,
                                      )
                                    : IgnorePointer(),
                                clientModel1.reasonTransfer == null
                                    ? Expanded(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      kMainColor)),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        transferClient(
                                                          name_enterprise:
                                                              clientModel1
                                                                  .nameEnterprise
                                                                  .toString(),
                                                          idclient: clientModel1
                                                              .idClients
                                                              .toString(),
                                                          type: "client",
                                                        ),
                                                    fullscreenDialog: true));
                                          },
                                          child: Text('تحويل العميل'),
                                        ),
                                      )
                                    : IgnorePointer(),
                                SizedBox(
                                  height: 3,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                SizedBox(
                  height: 15,
                ),
                // Provider.of<privilge_vm>(context,listen: true)
                //     .checkprivlge('2')==true ||
                //     Provider.of<privilge_vm>(context,listen: true)
                //         .checkprivlge('7')==true?

                widget.clienttransfer == null ||
                        context.read<PrivilegeCubit>().checkPrivilege('150') ==
                            true
                    ? IgnorePointer()
                    :
                    // Provider.of<PrivilegeProvider>(context, listen: true).checkPrivilege('150') == true &&

                    clientModel1.reasonTransfer ==
                            Provider.of<UserProvider>(context, listen: false)
                                .currentUser
                                .idUser
                                .toString()
                        ? Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  kMainColor)),
                                      onPressed: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return ModalProgressHUD(
                                              inAsyncCall:
                                                  Provider.of<ClientProvider>(
                                                          context)
                                                      .isapproved,
                                              child: Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: AlertDialog(
                                                  titlePadding:
                                                      const EdgeInsets.fromLTRB(
                                                          24.0,
                                                          10.0,
                                                          24.0,
                                                          15.0),
                                                  insetPadding: EdgeInsets.only(
                                                      left: 10,
                                                      right: 10,
                                                      bottom: 10),
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 24,
                                                          right: 24,
                                                          bottom: 10),
                                                  title: Center(
                                                      child:
                                                          Text('Confirmation')),
                                                  content: Text(
                                                      ' هل تريد تأكيد العملية؟  '),
                                                  actions: <Widget>[
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                                      kMainColor)),
                                                      onPressed: () async {
                                                        String?
                                                            reason_transfer =
                                                            null;
                                                        //update fkuser to new user
                                                        Provider.of<ClientProvider>(
                                                                context,
                                                                listen: false)
                                                            .setfkUserApprove({
                                                          'approve': '1',
                                                          'reason_transfer':
                                                              reason_transfer
                                                                  .toString(),
                                                          'fkuser': Provider.of<
                                                                      UserProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .currentUser
                                                              .idUser
                                                              .toString(),
                                                          //user reciept
                                                          // 'nameusertransfer':
                                                          // Provider.of<user_vm_provider>(context,listen: false)
                                                          //     .currentUser.nameUser.toString(),//الموظف الذي حول العميل
                                                          'name_enterprise':
                                                              clientModel1
                                                                  .nameEnterprise,
                                                          'fk_regoin': Provider
                                                                  .of<UserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                              .currentUser
                                                              .fkRegoin
                                                              .toString(),
                                                          //'idclient':
                                                        }, widget.idclient).then(
                                                                (value) => value !=
                                                                        false
                                                                    ? clear()
                                                                    : error());
                                                      },
                                                      child: Text('نعم'),
                                                    ),
                                                    new ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                                      kMainColor)),
                                                      onPressed: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .pop(
                                                                false); // dismisses only the dialog and returns false
                                                      },
                                                      child: Text('لا'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        //Navigator.pop(context);
                                      },
                                      child: Text('قبول تحويل العميل')),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.redAccent)),
                                      onPressed: () async {
                                        // Navigator.pushAndRemoveUntil(context,
                                        //     CupertinoPageRoute(builder: (context)=>Home()),
                                        //         (route) => true
                                        // );
                                        String? reason_transfer = null;
                                        await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return ModalProgressHUD(
                                              inAsyncCall:
                                                  Provider.of<ClientProvider>(
                                                          context)
                                                      .isapproved,
                                              child: Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: AlertDialog(
                                                  titlePadding:
                                                      const EdgeInsets.fromLTRB(
                                                          24.0,
                                                          10.0,
                                                          24.0,
                                                          15.0),
                                                  insetPadding: EdgeInsets.only(
                                                      left: 10,
                                                      right: 10,
                                                      bottom: 10),
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 24,
                                                          right: 24,
                                                          bottom: 10),
                                                  title: Center(
                                                      child:
                                                          Text('Confirmation')),
                                                  content: Text(
                                                      ' هل تريد تأكيد العملية؟  '),
                                                  actions: <Widget>[
                                                    new ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                                      kMainColor)),
                                                      onPressed: () async {
                                                        Provider.of<ClientProvider>(
                                                                context,
                                                                listen: false)
                                                            .setfkUserApprove({
                                                          'userrefuse':
                                                              Provider.of<UserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .currentUser
                                                                  .nameUser,
                                                          'fkuserclient':
                                                              clientModel1
                                                                  .fkUser
                                                                  .toString(), //صاحب العميل
                                                          'reason_transfer':
                                                              reason_transfer
                                                                  .toString(),
                                                          'fkusertrasfer':
                                                              reason_transfer
                                                                  .toString(),
                                                          'date_transfer':
                                                              reason_transfer
                                                                  .toString(),
                                                          'name_enterprise':
                                                              clientModel1
                                                                  .nameEnterprise,
                                                        }, widget.idclient).then(
                                                                (value) => value !=
                                                                        false
                                                                    ? clear()
                                                                    : error() // clear()
                                                                // _scaffoldKey.currentState!.showSnackBar(
                                                                //     SnackBar(content: Text('هناك مشكلة ما'))
                                                                // )
                                                                );
                                                      },
                                                      child: Text('نعم'),
                                                    ),
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                                      kMainColor)),
                                                      onPressed: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .pop(
                                                                false); // dismisses only the dialog and returns false
                                                      },
                                                      child: Text('لا'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Text('رفض تحويل العميل')),
                                ),
                              ],
                            ),
                          )
                        : IgnorePointer(),
                widget.invoice != null
                    ? widget.invoice!.isApprove == null
                        ? Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  kMainColor)),
                                      onPressed: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return ModalProgressHUD(
                                              inAsyncCall:
                                                  Provider.of<invoice_vm>(
                                                          context)
                                                      .isapproved,
                                              child: Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: AlertDialog(
                                                  titlePadding:
                                                      const EdgeInsets.fromLTRB(
                                                          24.0,
                                                          10.0,
                                                          24.0,
                                                          15.0),
                                                  insetPadding: EdgeInsets.only(
                                                      left: 10,
                                                      right: 10,
                                                      bottom: 10),
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 24,
                                                          right: 24,
                                                          bottom: 10),
                                                  title: Center(
                                                      child:
                                                          Text('Confirmation')),
                                                  content: Text(
                                                      ' هل تريد تأكيد العملية؟  '),
                                                  actions: <Widget>[
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                                      kMainColor)),
                                                      onPressed: () async {
                                                        // Navigator.of(context,
                                                        //     rootNavigator: true)
                                                        //     .pop(true);
                                                        // update client to approved client
                                                        Provider.of<invoice_vm>(
                                                                context,
                                                                listen: false)
                                                            .setApproveclient_vm(
                                                                {
                                                              "id_clients": widget
                                                                  .invoice!
                                                                  .fkIdClient,
                                                              //'idApproveClient':widget.itemapprove!.idApproveClient,
                                                              'date_approve':
                                                                  DateTime.now()
                                                                      .toString(),
                                                              "fk_user": widget
                                                                  .invoice!
                                                                  .fkIdUser, //صاحب العميل
                                                              "fk_regoin": widget
                                                                  .invoice!
                                                                  .fk_regoin,
                                                              "regoin": widget
                                                                  .invoice!
                                                                  .name_regoin,
                                                              "fk_country": widget
                                                                  .invoice!
                                                                  .fk_country,
                                                              "isApprove": "1",
                                                              "name_enterprise":
                                                                  widget
                                                                      .invoice!
                                                                      .name_enterprise,
                                                              "fkusername": widget
                                                                  .invoice!
                                                                  .nameUser, //موظف المبيعات
                                                              //"message":"",//
                                                              "nameuserApproved":
                                                                  Provider.of<UserProvider>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .currentUser
                                                                      .nameUser,
                                                              "iduser_approve": Provider.of<
                                                                          UserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .currentUser
                                                                  .idUser //معتمد الاشتراك
                                                            },
                                                                widget.invoice!
                                                                    .idInvoice).then(
                                                                (value) => value !=
                                                                        false
                                                                    ? clear()
                                                                    : error() // clear()
                                                                // _scaffoldKey.currentState!.showSnackBar(
                                                                //     SnackBar(content: Text('هناك مشكلة ما')))
                                                                );
                                                      },
                                                      child: Text('نعم'),
                                                    ),
                                                    new ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                                      kMainColor)),
                                                      onPressed: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .pop(
                                                                false); // dismisses only the dialog and returns false
                                                      },
                                                      child: Text('لا'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        //Navigator.pop(context);
                                      },
                                      child: Text('Approve')),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.redAccent)),
                                      onPressed: () async {
                                        // Navigator.pushAndRemoveUntil(context,
                                        //     CupertinoPageRoute(builder: (context)=>Home()),
                                        //         (route) => true
                                        // );
                                        await showDialog(
                                          context: context,
                                          builder: (context) {
                                            return ModalProgressHUD(
                                              inAsyncCall:
                                                  Provider.of<invoice_vm>(
                                                          context)
                                                      .isapproved,
                                              child: Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: AlertDialog(
                                                  titlePadding:
                                                      const EdgeInsets.fromLTRB(
                                                          24.0,
                                                          10.0,
                                                          24.0,
                                                          15.0),
                                                  insetPadding: EdgeInsets.only(
                                                      left: 10,
                                                      right: 10,
                                                      bottom: 10),
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 24,
                                                          right: 24,
                                                          bottom: 10),
                                                  title: Center(
                                                      child:
                                                          Text('Confirmation')),
                                                  content: Text(
                                                      ' هل تريد تأكيد العملية؟  '),
                                                  actions: <Widget>[
                                                    new ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                                      kMainColor)),
                                                      onPressed: () async {
                                                        Provider.of<invoice_vm>(
                                                                context,
                                                                listen: false)
                                                            .setApproveclient_vm(
                                                                {
                                                              "id_clients": widget
                                                                  .invoice!
                                                                  .fkIdClient,
                                                              //'idApproveClient':widget.itemapprove!.idApproveClient,
                                                              "fk_user": widget
                                                                  .invoice!
                                                                  .fkIdUser,
                                                              "fk_regoin": widget
                                                                  .invoice!
                                                                  .fk_regoin,
                                                              "regoin": widget
                                                                  .invoice!
                                                                  .name_regoin,
                                                              "fk_country": widget
                                                                  .invoice!
                                                                  .fk_country,
                                                              "isApprove": "0",
                                                              "name_enterprise":
                                                                  widget
                                                                      .invoice!
                                                                      .name_enterprise,
                                                              "fkusername": widget
                                                                  .invoice!
                                                                  .nameUser, //موظف المبيعات
                                                              //"message":"",//
                                                              "nameuserApproved":
                                                                  Provider.of<UserProvider>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .currentUser
                                                                      .nameUser,
                                                              "iduser_approve": Provider.of<
                                                                          UserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .currentUser
                                                                  .idUser //معتمد الاشتراك
                                                            },
                                                                widget.invoice!
                                                                    .idInvoice).then(
                                                                (value) => value !=
                                                                        false
                                                                    ? clear()
                                                                    : error() // clear()
                                                                // _scaffoldKey.currentState!.showSnackBar(
                                                                //     SnackBar(content: Text('هناك مشكلة ما'))
                                                                // )
                                                                );
                                                      },
                                                      child: Text('نعم'),
                                                    ),
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                                      kMainColor)),
                                                      onPressed: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .pop(
                                                                false); // dismisses only the dialog and returns false
                                                      },
                                                      child: Text('لا'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                        //send notification
                                        //Navigator.pop(context);
                                      },
                                      child: Text('Refuse')),
                                ),
                              ],
                            ),
                          )
                        : IgnorePointer()
                    : IgnorePointer(), //:IgnorePointer(),

                //approve finance
                widget.invoice != null
                    ? widget.invoice!.isApprove != 1 &&
                            widget.invoice!.isApproveFinance == null &&
                            Provider.of<PrivilegeCubit>(context, listen: true)
                                    .checkPrivilege('111') ==
                                true &&
                            widget.typeinvoice == 'f'
                        ? Center(
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(kMainColor)),
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ModalProgressHUD(
                                        inAsyncCall:
                                            Provider.of<invoice_vm>(context)
                                                .isapproved,
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: AlertDialog(
                                            titlePadding:
                                                const EdgeInsets.fromLTRB(
                                                    24.0, 10.0, 24.0, 15.0),
                                            insetPadding: EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                bottom: 10),
                                            contentPadding: EdgeInsets.only(
                                                left: 24,
                                                right: 24,
                                                bottom: 10),
                                            title: Center(
                                                child: Text('Confirmation')),
                                            content: Text(
                                                ' هل تريد تأكيد العملية؟  '),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(kMainColor)),
                                                onPressed: () async {
                                                  // Navigator.of(context,
                                                  //     rootNavigator: true)
                                                  //     .pop(true);
                                                  // update client to approved client
                                                  Provider.of<invoice_vm>(
                                                          context,
                                                          listen: false)
                                                      .setApproveFclient_vm(
                                                          {
                                                        "id_clients": widget
                                                            .invoice!
                                                            .fkIdClient,
                                                        //'idApproveClient':widget.itemapprove!.idApproveClient,
                                                        'Date_FApprove':
                                                            DateTime.now()
                                                                .toString(),
                                                        "fk_user": widget
                                                            .invoice!
                                                            .fkIdUser, //صاحب العميل
                                                        "fk_regoin": widget
                                                            .invoice!.fk_regoin,
                                                        "regoin": widget
                                                            .invoice!
                                                            .name_regoin,
                                                        "fk_country": widget
                                                            .invoice!
                                                            .fk_country,
                                                        "isApproveFinance": "1",
                                                        "name_enterprise": widget
                                                            .invoice!
                                                            .name_enterprise,
                                                        "fkusername": widget
                                                            .invoice!
                                                            .nameUser, //موظف المبيعات
                                                        //"message":"",//
                                                        "nameuserApproved":
                                                            Provider.of<UserProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .currentUser
                                                                .nameUser,
                                                        "iduser_FApprove": Provider
                                                                .of<UserProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                            .currentUser
                                                            .idUser //معتمد الاشتراك
                                                      },
                                                          widget.invoice!
                                                              .idInvoice).then(
                                                          (value) => value !=
                                                                  false
                                                              ? clear()
                                                              : error() // clear()
                                                          // _scaffoldKey.currentState!.showSnackBar(
                                                          //     SnackBar(content: Text('هناك مشكلة ما')))
                                                          );
                                                },
                                                child: Text('نعم'),
                                              ),
                                              new ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(kMainColor)),
                                                onPressed: () {
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .pop(
                                                          false); // dismisses only the dialog and returns false
                                                },
                                                child: Text('لا'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );

                                  //Navigator.pop(context);
                                },
                                child: Text('Approve')))
                        : IgnorePointer()
                    : IgnorePointer(),
              ]),
            ),
          ),
        ),
      );
    });
  }

  _onPressedUpdate(BuildContext context) async {
    isUpdate = true;
    print(clientModel1.serialNumber);
    ClientModel result = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) =>
            ActionClientPage(client: clientModel1.mapToClientModel()),
      ),
    );
    setState(() {
      clientModel1 = result.mapToClientModel1();
    });
    print(result.serialNumber);
    print(clientModel1.serialNumber);
  }

  clear() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.pop(context);
  }

  error() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.pop(context);
  }
}

//region Extension

extension ClientModelExtension on ClientModel1 {
  ClientModel mapToClientModel() {
    return ClientModel(
      idClients: idClients,
      nameClient: nameClient,
      nameEnterprise: nameEnterprise,
      typeJob: typeJob,
      city: city,
      location: location,
      // fkRegoin: fkRegoin,
      fkCountry: fkcountry,
      dateCreate: dateCreate,
      typeClient: typeClient,
      fkUser: fkUser,
      dateTransfer: dateTransfer,
      mobile: mobile,
      dateChangeType: dateChangetype,
      reasonChange: reasonChange,
      reasonTransfer: reasonTransfer,
      nameCountry: nameCountry,
      nameUser: nameUser,
      nameRegion: name_regoin,
      total: total,
      amountPaid: amount_paid,
      offerPrice: offer_price,
      datePrice: date_price,
      userDo: user_do,
      isApprove: isApprove,
      nameUserDoing: nameuserdoning,
      nameUserTransfer: nameusertransfer,
      fkUserTrasfer: fkusertrasfer,
      mobileUser: mobileuser,
      totalPaid: total_paid,
      isMarketing: ismarketing,
      addressClient: address_client,
      descriptionActiveController: descActivController,
      preSystem: presystem,
      preSystemTitle: presystemtitle,
      sourceClient: sourcclient,
      activityTypeFk: activity_type_fk,
      activityTypeTitle: activity_type_title,
      phone: phone,
      userAdd: user_add,
      nameAdduser: nameAdduser,
      dateVisitClient: date_visit_Client,
      tag: tag,
      // doneVisit: doneVisit,
      // doneTransfer: doneTransfer,
      nameCity: name_city,
      nameMainCity: namemaincity,
      idMainCity: id_maincity,
      // customerId: customerId,
      // userAddEmail: userAddEmail,
      // dateReceive: dateReceive,
      email: email,
      sizeActivity: size_activity,
      serialNumber: serialNumber,
      type_record: type_record,
      type_classification: type_classification,
      reason_class: reason_class,

      nameClientRecommend: NameClient_recomand,
      nameReasonReject: NameReason_reject,
    );
  }
}

extension ClientModel1Extension on ClientModel {
  ClientModel1 mapToClientModel1() {
    return ClientModel1(
      idClients: idClients,
      nameClient: nameClient,
      nameEnterprise: nameEnterprise,
      typeJob: typeJob,
      city: city,
      location: location,
      fkRegoin: fkRegion,
      // Note: Assuming you meant to use fkRegion
      fkcountry: fkCountry,
      dateCreate: dateCreate,
      typeClient: typeClient,
      fkUser: fkUser,
      dateTransfer: dateTransfer,
      mobile: mobile,
      dateChangetype: dateChangeType,
      reasonChange: reasonChange,
      reasonTransfer: reasonTransfer,
      nameCountry: nameCountry,
      nameUser: nameUser,
      name_regoin: nameRegion,
      // Note: Assuming you meant to use nameRegion
      total: total,
      amount_paid: amountPaid,
      offer_price: offerPrice,
      date_price: datePrice,
      user_do: userDo,
      isApprove: isApprove,
      nameuserdoning: nameUserDoing,
      nameusertransfer: nameUserTransfer,
      fkusertrasfer: fkUserTrasfer,
      mobileuser: mobileUser,
      total_paid: totalPaid,
      ismarketing: isMarketing,
      address_client: addressClient,
      descActivController: descriptionActiveController,
      presystem: preSystem,
      presystemtitle: preSystemTitle,
      sourcclient: sourceClient,
      activity_type_fk: activityTypeFk,
      activity_type_title: activityTypeTitle,
      phone: phone,
      user_add: userAdd,
      nameAdduser: nameAdduser,
      date_visit_Client: dateVisitClient,
      tag: tag,
      // doneVisit: doneVisit,
      // doneTransfer: doneTransfer,
      name_city: nameCity,
      namemaincity: nameMainCity,
      id_maincity: idMainCity,
      // customerId: IDcustomer, // Note: Assuming you meant to use IDcustomer
      // userAddEmail: userAddEmail,
      // dateReceive: dateReceive,
      email: email,
      size_activity: sizeActivity,
      serialNumber: serialNumber,
      type_record: type_record,
      type_classification: type_classification,
      reason_class: reason_class,
      reason_change: reasonChange,
      NameClient_recomand: nameClientRecommend,
      NameReason_reject: nameReasonReject,
      // fkClientSource: fkClientSource,
      // nameReasonReject: NameReason_reject,
      // nameClientRecommend: NameClient_recomand,
      // rejectId: fk_rejectClient, // Note: Assuming you meant to use fk_rejectClient
    );
  }
}

//endregion
