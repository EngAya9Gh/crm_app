import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../common/helpers/helper_functions.dart';
import '../../../../constants.dart';
import '../../../../view_model/datetime_vm.dart';
import '../../../../view_model/typeclient.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../app/presentation/widgets/app_drop_down.dart';
import '../../../app/presentation/widgets/app_elvated_button.dart';
import '../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../manage_withdrawals/data/models/reject_reason.dart';
import '../../../manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart';
import '../../data/models/clients_list_response.dart';
import '../../domain/use_cases/approve_reject_client_usecase.dart';
import '../../domain/use_cases/change_type_client_usecase.dart';
import '../manager/clients_list_bloc.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart' as intl;
class dailog_change_type extends StatefulWidget {
  dailog_change_type({Key? key,this.client}) : super(key: key);

  ClientModel? client;

  @override
  State<dailog_change_type> createState() => _dailog_change_typeState();
}

class _dailog_change_typeState extends State<dailog_change_type> {

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
  late ClientTypeProvider _clientTypeProvider;
  @override void initState() {
    // TODO: implement initState
    _manageWithdrawalsCubit = GetIt.I<ManageWithdrawalsCubit>()
      ..getReasonReject();

    reasonReject = ValueNotifier(widget.client?.rejectId);

    _clientsListBloc = context.read<ClientsListBloc>();
    _clientTypeProvider = context.read<ClientTypeProvider>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _clientTypeProvider.type_of_client =
      widget.client?.typeClient == "تفاوض" ||
          widget.client?.typeClient == "عرض سعر" ||
          widget.client?.typeClient == "مستبعد"
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
          TextEditingController(text: widget.client?.offerPrice);
      _clientTypeProvider.changevalue(_clientTypeProvider.selectedValuemanag);

      Provider.of<datetime_vm>(context, listen: false).setdatetimevalue1(
          intl.DateFormat('yyyy-MM-dd')
              .parse(widget.client!.datePrice.toString()),
          isInit: true);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SimpleDialog(
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
                  textDirection: TextDirection.rtl,
                  child: Form(
                      key: _globalKey,
                      child: Consumer<ClientTypeProvider>(
                          builder: (context, clientTypeProvider, child) {
                            return
                              Column(children: [

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
                                    maxLines: 1,
                                    controller: reasonController,
                                    validator: HelperFunctions.instance.requiredFiled,
                                  ),
                                  10.verticalSpace,
                                },
                                10.verticalSpace,
                                widget.client!.typeClient != "معلق استبعاد"
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
                                                  //Navigator.pop(context, client);
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
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                                          .client!.idClients
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
                                                  //  Navigator.pop(context, client);
                                                }));
                                          },
                                        ),
                                        AppElevatedButton(
                                          isLoading: state
                                              .actionClientBlocStatus
                                              .isLoading(),
                                          text: "رفض",
                                          style: ElevatedButton.styleFrom(

                                            backgroundColor:Colors.red,
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
                                                          .client!.idClients
                                                          .toString(),
                                                      isAppprove: '0',
                                                      userId: Provider.of<
                                                          UserProvider>(
                                                          context,
                                                          listen: false)
                                                          .currentUser
                                                          .idUser!,
                                                    ),
                                                    onSuccess: (client) {
                                                      Navigator.pop(
                                                          context, client);
                                                      //  Navigator.pop(context, client);
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
  }
}
