import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/models/client_model.dart';
import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../../view_model/client_vm.dart';
import '../../../../../view_model/page_state.dart';
import '../../../../../view_model/typeclient.dart';
import '../../../../clients_care/clients_tickets/presentation/pages/transfer_client_page.dart';
import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart';
import '../../../../task_management/presentation/manager/task_cubit.dart';
import '../../../../task_management/presentation/widgets/add_manual_task_button.dart';
import '../../domain/use_cases/receive_client_usecase.dart';
import '../manager/clients_list_bloc.dart';
import '../pages/client_add_edit_page.dart';
import 'ClientInfoButtons.dart';
import 'client_info_details.dart';
import 'dialog_client_section.dart';
import 'special_client_icon_button.dart';

class ClientSection extends StatefulWidget {
  const ClientSection({
    super.key,
    required this.idClient,
    required this.invoice,
    required this.client,
    this.clientTransfer,
    this.typeInvoice,
  });

  final String idClient;
  final InvoiceModel? invoice;
  final ClientModel? client;
  final String? clientTransfer;
  final String? typeInvoice;

  @override
  State<ClientSection> createState() => _ClientSectionState();
}

class _ClientSectionState extends State<ClientSection> {
  late ClientModel clientModel;
  bool isUpdate = false;
  late ClientTypeProvider _clientTypeProvider;
  late final ClientProvider _clientProvider;
  late final ClientsListBloc _clientsListBloc;

  bool disableWithdrawal = false;

  @override
  void initState() {
    _clientProvider = context.read<ClientProvider>();
    _clientsListBloc = context.read<ClientsListBloc>();

    _clientsListBloc.currentClient = widget.client;
    context.read<ManageWithdrawalsCubit>()..getReasonReject();

    _clientTypeProvider = context.read<ClientTypeProvider>();
    disableWithdrawal = widget.client?.typeClient == "مستبعد";
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _clientTypeProvider.prepareTypesList(widget.client);
      _clientTypeProvider.prepareSelectedManage(widget.client);
    });

    super.initState();
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
        return CustomErrorWidget(onPressed: () {
          _clientProvider.get_byIdClient(widget.idClient.toString());
        });
      }
      if (!isUpdate) {
        clientModel = state.currentClientModel.data!;
      }
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 10),
          child: SingleChildScrollView(
            child: BlocConsumer<ClientsListBloc, ClientsListState>(
              buildWhen: (previous, current) {
                return current.receiveClientStatus.isSuccess() &&
                    previous.receiveClientStatus != current.receiveClientStatus;
              },
              listener: (context, state) {
                if (state.receiveClientStatus.isSuccess()) {
                  clientModel = state.receiveClientStatus.data!;
                  _clientsListBloc.currentClient = clientModel;
                }
              },
              builder: (context, state) {
                return Column(children: [
                  AddManualTaskButton(
                    list: clientPublicTypeList,
                    clientId: clientModel.idClients,
                  ),
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
                                    clientModel.mobile.toString());
                              },
                              icon: Icon(Icons.call),
                              iconSize: 15,
                              color: kWhiteColor,
                            ),
                          ),
                          SpecialClientIconButton()
                        ],
                      ),
                      TextButton(
                        onPressed: () async {
                          await FlutterPhoneDirectCaller.callNumber(
                              clientModel.mobile.toString());
                        },
                        child: Text(
                          clientModel.mobile.toString(),
                          style: TextStyle(
                              fontFamily: kfontfamily2, color: kMainColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ClientInfoDetails(),
                  if (widget.clientTransfer != 'transfer') ...[
                    Center(
                      child: Column(
                        children: [
                          if (clientModel.typeClient == "عرض سعر" ||
                              clientModel.typeClient == "تفاوض" ||
                              clientModel.typeClient == "مستبعد" ||
                              clientModel.typeClient == 'معلق استبعاد') ...[
                            SizedBox(
                              width: double.infinity,
                              child: AppElevatedButton(
                                onPressed: () async {
                                  ClientModel? result = await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return DialogClientSection(
                                        disableWithdrawal: disableWithdrawal,
                                        client: clientModel,
                                        idClient: widget.idClient,
                                      );
                                    },
                                  );
                                  if (result != null)
                                    setState(() {
                                      clientModel = result;
                                    });
                                },
                                child: Text('اجراءات'),
                              ),
                            ),
                          ],
                          AppElevatedButton(
                            width: double.infinity,
                            onPressed: () async => _onPressedUpdate(context),
                            child: Text('تعديل بيانات العميل'),
                          ),
                          Row(
                            children: [
                              if (clientModel.nameTransferTo == null) ...[
                                Expanded(
                                  child: AppElevatedButton(
                                    onPressed: () async {
                                      final transferredClient =
                                          await AppNavigator.push(
                                              TransferClientPage(
                                        nameEnterprise: clientModel
                                            .nameEnterprise
                                            .toString(),
                                        idClient:
                                            clientModel.idClients.toString(),
                                        type: "client",
                                      ));
                                      if (transferredClient != null) {
                                        final newClient =
                                            (transferredClient as ClientModel);
                                        _clientProvider
                                            .changevalueclient(newClient);
                                      }
                                    },
                                    child: Text('تحويل العميل'),
                                  ),
                                ),
                                if (_isValidForReceiving()) ...[
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: BlocBuilder<ClientsListBloc,
                                        ClientsListState>(
                                      builder: (context, state) {
                                        return AppElevatedButton(
                                          isLoading: state.receiveClientStatus
                                              .isLoading(),
                                          onPressed: () async {
                                            _clientsListBloc
                                                .add(ReceiveClientEvent(
                                              ReceiveClientParams(
                                                idClient:
                                                    clientModel.idClients!,
                                              ),
                                            ));
                                          },
                                          child: Text('استلام العميل'),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                  SizedBox(height: 15),
                  ClientInfoButtons(
                    idClient: widget.idClient,
                    client: clientModel,
                    invoice: widget.invoice,
                    typeInvoice: widget.typeInvoice,
                    clientTransfer: widget.clientTransfer,
                  ),
                ]);
              },
            ),
          ),
        ),
      );
    });
  }

  bool _isValidForReceiving() {
    final bool noFkUser =
        clientModel.fkUser == null || clientModel.fkUser!.isEmpty;
    return context.read<PrivilegeCubit>().checkPrivilege("187") && noFkUser;
  }

  _onPressedUpdate(BuildContext context) async {
    isUpdate = true;
    ClientModel? result = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => ClientAddEditPage(client: clientModel),
      ),
    );
    if (result != null) {
      setState(() {
        clientModel = result;
      });
    }
  }
}
