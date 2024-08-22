import 'dart:ui' as myui;

import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/models/page_state/page_state.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../view_model/typeclient.dart';
import '../../../../../../view_model/user_vm_provider.dart';
import '../../../../../app/presentation/widgets/app_drop_down.dart';
import '../../../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../../mangement/manage_withdrawals/data/models/reject_reason.dart';
import '../../../../../mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart';
import '../../domain/use_cases/approve_reject_client_usecase.dart';
import '../../domain/use_cases/change_type_client_usecase.dart';
import '../manager/clients_list_bloc.dart';

class DialogClientSection extends StatefulWidget {
  const DialogClientSection({
    super.key,
    required this.idClient,
    required this.client,
    required this.disableWithdrawal,
  });

  final ClientModel client;
  final String idClient;
  final bool disableWithdrawal;

  @override
  State<DialogClientSection> createState() => _DialogClientSectionState();
}

class _DialogClientSectionState extends State<DialogClientSection> {
  late final ClientsListBloc _clientsListBloc;
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController offerPriceController = TextEditingController();
  final TextEditingController dateOfferPriceController =
      TextEditingController();
  final ValueNotifier<String?> reasonReject = ValueNotifier(null);

  @override
  void initState() {
    _clientsListBloc = BlocProvider.of<ClientsListBloc>(context);
    reasonController.text = widget.client.reasonChange ?? "";
    offerPriceController.text = widget.client.offer_price ?? "";
    dateOfferPriceController.text = widget.client.date_price ?? "";
    reasonReject.value = widget.client.fkRejectClient;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _globalKey = GlobalKey<FormState>();
    final _clientTypeProvider = Provider.of<ClientTypeProvider>(context);
    late final ChangeTypeClientParam changeTypeClientParams;

    return SimpleDialog(
      contentPadding: EdgeInsets.all(12),
      children: [
        Directionality(
          textDirection: myui.TextDirection.rtl,
          child: Form(
            key: _globalKey,
            child: Consumer<ClientTypeProvider>(
              builder: (context, clientTypeProvider, child) {
                return Column(
                  children: [
                    SizedBox(height: 10),
                    if (context
                        .read<PrivilegeCubit>()
                        .checkPrivilege('27')) ...{
                      AppDropdownButtonFormField<String, String>(
                        isDisabled: widget.disableWithdrawal,
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
                    if (context.read<PrivilegeCubit>().checkPrivilege('27') &&
                        clientTypeProvider.selectedValuemanag == "عرض سعر") ...{
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: AppTextField(
                              validator: InputValidator.requiredFiled,
                              labelText: "عرض سعر",
                              maxLines: 1,
                              controller: offerPriceController,
                              textInputType: TextInputType.number,
                            ),
                          ),
                          10.horizontalSpace,
                          Expanded(
                            flex: 5,
                            child: CustomDateTimePicker(
                              dateTimeType: DateTimeEnum.date,
                              dateTimeController: dateOfferPriceController,
                              style2: true,
                            ),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                    },
                    if (_isShowReasons(context, clientTypeProvider)) ...{
                      BlocBuilder<ManageWithdrawalsCubit,
                          ManageWithdrawalsState>(
                        builder: (context, state) {
                          return ValueListenableBuilder<String?>(
                              valueListenable: reasonReject,
                              builder: (context, value, _) {
                                return AppDropdownButtonFormField<RejectReason,
                                    String>(
                                  isDisabled: widget.disableWithdrawal,
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
                                  validator: InputValidator.requiredFiled,
                                );
                              });
                        },
                      ),
                      10.verticalSpace,
                      AppTextField(
                        labelText: "سبب الاستبعاد",
                        maxLines: 3,
                        controller: reasonController,
                        validator: InputValidator.requiredFiled,
                        enabled: !widget.disableWithdrawal,
                        contentPadding: EdgeInsets.all(10),
                      ),
                      10.verticalSpace,
                    },
                    10.verticalSpace,
                    if (widget.client.typeClient != "معلق استبعاد") ...[
                      BlocBuilder<ClientsListBloc, ClientsListState>(
                        builder: (context, state) {
                          return AppElevatedButton(
                            isLoading: state.actionClientBlocStatus.isLoading(),
                            isDisabled: widget.disableWithdrawal,
                            text: "حفظ",
                            onPressed: () async {
                              if (!_globalKey.currentState!.validate()) {
                                return;
                              }
                              changeTypeClientParams = ChangeTypeClientParam(
                                type_client:
                                    _clientTypeProvider.selectedValuemanag!,
                                userId: Provider.of<UserProvider>(context,
                                        listen: false)
                                    .currentUser
                                    .idUser!,
                                fk_rejectClient: reasonReject.value,
                                reason_change: reasonController.text,
                                offer_price: offerPriceController.text,
                                date_price:
                                    _clientTypeProvider.selectedValuemanag ==
                                            "عرض سعر"
                                        ? HelperFunctions.dateFromString(
                                                dateOfferPriceController.text)
                                            ?.toIso8601String()
                                        : null,
                                id_clients: widget.client.idClients.toString(),
                              );
                              _clientsListBloc.add(ChangeTypeClientEvent(
                                  changeTypeClientParams, onSuccess: (client) {
                                Navigator.pop(context, client);
                                Navigator.pop(context, client);
                              }));
                            },
                          );
                        },
                      )
                    ] else ...[
                      if (context.read<PrivilegeCubit>().checkPrivilege('177'))
                        BlocBuilder<ClientsListBloc, ClientsListState>(
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                AppElevatedButton(
                                  isLoading:
                                      state.actionClientBlocStatus.isLoading(),
                                  text: "موافقة",
                                  onPressed: () async {
                                    _approveRejectClient(context);
                                  },
                                ),
                                AppElevatedButton(
                                  isLoading:
                                      state.actionClientBlocStatus.isLoading(),
                                  text: "رفض",
                                  backgroundColor: Colors.red,
                                  onPressed: () async {
                                    _approveRejectClient(
                                      context,
                                      isRefuse: true,
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        )
                    ],
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  bool _isShowReasons(
    BuildContext context,
    ClientTypeProvider clientTypeProvider,
  ) {
    return context.read<PrivilegeCubit>().checkPrivilege('27') &&
        (clientTypeProvider.selectedValuemanag == "مستبعد" ||
            clientTypeProvider.selectedValuemanag == "معلق استبعاد");
  }

  void _approveRejectClient(BuildContext context, {bool isRefuse = false}) {
    _clientsListBloc.add(ApproveRejectClientEvent(
      ApproveRejectClientPararm(
        id_clients: widget.idClient,
        isApprove: isRefuse ? '0' : '1',
        reasonChange: reasonController.text,
        fkRejectClient: reasonReject.value!,
      ),
      onSuccess: (client) {
        AppNavigator.pop(result: client);
        AppNavigator.pop(result: client);
      },
    ));
  }
}
