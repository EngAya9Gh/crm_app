import 'dart:ui' as myui;

import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:crm_smart/core/common/widgets/app_dialog.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/sales/clients/clients_list/domain/use_cases/store_client_communication_usecase.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/client/type_client_enum.dart';
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/enums/periodic_communication_client_type_enum.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/models/page_state/page_state.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../model/communication_withdrawal_reason_model.dart';
import '../../../../../../ui/screen/care/communication_withdrawal_reasons_drop_down.dart';
import '../../../../../../view_model/typeclient.dart';
import '../../../../../../view_model/user_vm_provider.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../../../mangement/manage_withdrawals/data/models/reject_reason.dart';
import '../../../../../mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart';
import '../../domain/use_cases/approve_reject_client_usecase.dart';
import '../../domain/use_cases/change_client_communication_usecase.dart';
import '../../domain/use_cases/change_type_client_usecase.dart';
import '../manager/clients_list_bloc.dart';

class DialogClientType extends StatefulWidget {
  const DialogClientType({
    super.key,
    required this.idClient,
    required this.client,
    required this.disableWithdrawal,
  });

  final ClientModel client;
  final String idClient;
  final bool disableWithdrawal;

  @override
  State<DialogClientType> createState() => _DialogClientTypeState();
}

class _DialogClientTypeState extends State<DialogClientType> {
  late final ClientsListBloc _clientsListBloc;

  final _globalKey = GlobalKey<FormState>();
  ValueNotifier<PeriodicCommunicationClientTypeEnum?> clientTypeNotifier =
  ValueNotifier<PeriodicCommunicationClientTypeEnum?>(null);
  ValueNotifier<CommunicationWithdrawalReasonModel?> withdrawalReasonNotifier =
  ValueNotifier<CommunicationWithdrawalReasonModel?>(null);

  @override
  void initState() {
    _clientsListBloc = context.read<ClientsListBloc>();
    if (widget.client.communicationDetails != null &&
        widget.client.communicationDetails!.isNotEmpty &&
        PeriodicCommunicationClientTypeEnum.values.isNotEmpty) {
      if (PeriodicCommunicationClientTypeEnum.values.any((type) =>
      type.toString().split('.').last.toLowerCase()
          == widget.client.communicationDetails!.first.state?.toLowerCase(),)) {
        clientTypeNotifier.value = PeriodicCommunicationClientTypeEnum.values.firstWhere((type) =>
        type.toString().split('.').last.toLowerCase()
                  == widget.client.communicationDetails!.first.state?.toLowerCase(),);
      }
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    late final ChangeTypeClientParam changeTypeClientParams;
    return AppDialog(
      title: 'تغيير نوع العميل',
      children: [
        Directionality(
          textDirection: myui.TextDirection.rtl,
          child: Form(
            key: _globalKey,
            child: Consumer<ClientTypeProvider>(
              builder: (context, clientTypeProvider, child) {
                return Column(
                  children: [
                    CustomDropDown<PeriodicCommunicationClientTypeEnum>(
                      hint: "نوع العميل",
                      items: PeriodicCommunicationClientTypeEnum.values,
                      itemAsString: (item) => item!.value,
                      selectedItem: clientTypeNotifier.value,
                      onChanged: (value) => clientTypeNotifier.value = value,
                      height: 105.h,
                    ),
                    SizedBox(height: 10),
                    ListenableBuilder(
                      listenable: clientTypeNotifier,
                      builder: (context, child) {
                        if (clientTypeNotifier.value?.isWithdrawn ?? false) {
                          return CommunicationWithdrawalReasonsDropDown(
                            withdrawalReason: withdrawalReasonNotifier.value,
                            initialValue:widget.client.communicationDetails!.isEmpty?null:widget.client.communicationDetails!.first.reason,
                            onChanged: (value) {
                              withdrawalReasonNotifier.value = value;
                            },
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
                    SizedBox(height: 10),
                    BlocBuilder<ClientsListBloc, ClientsListState>(
                      builder: (context, state) {
                        return AppElevatedButton(
                          text: "حفظ",
                          isLoading: state.actionClientBlocStatus.isLoading(),
                          // isDisabled: _isDisabled(_clientTypeProvider),
                          onPressed: () async {
                            if (!_globalKey.currentState!.validate()) {
                              return;
                            }
                            if(widget.client.communicationDetails!=null && widget.client.communicationDetails!.isNotEmpty){
                              ChangeClientCommunicationParam changeClientCommunicationParam =
                              ChangeClientCommunicationParam(state: clientTypeNotifier.value!.name,
                                  clientRecordId: widget.client.communicationDetails!.first.id!,
                                  reasonId:clientTypeNotifier.value!= PeriodicCommunicationClientTypeEnum.withdrawn ?null:
                                      withdrawalReasonNotifier.value==null?null:withdrawalReasonNotifier.value!.idReason
                              );
                              _clientsListBloc.add(ChangeClientCommunicationEvent(
                                  changeClientCommunicationParam, onSuccess: (comDetails) {
                                    final client = widget.client.copyWith(communicationDetails: [comDetails]);
                                Navigator.pop(context, client);
                              }));
                            }else{
                              StoreClientCommunicationParam storeClientCommunicationParam =
                              StoreClientCommunicationParam(state: clientTypeNotifier.value!.name,
                                  clientId: widget.idClient,
                                  reasonId:clientTypeNotifier.value!= PeriodicCommunicationClientTypeEnum.withdrawn?null:
                                  withdrawalReasonNotifier.value==null?null:withdrawalReasonNotifier.value!.idReason                              );
                              _clientsListBloc.add(StoreClientCommunicationEvent(
                                  storeClientCommunicationParam, onSuccess: (comDetails) {
                                final client = widget.client.copyWith(communicationDetails: [comDetails]);
                                Navigator.pop(context, client);
                              }));
                            }

                          },
                        );
                      },
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
