import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_fonts.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../view_model/client_vm.dart';
import '../../../../../../view_model/page_state.dart';
import '../../../../../../view_model/typeclient.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../clients_care/clients_tickets/presentation/pages/transfer_client_page.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../../../mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart';
import '../../../../../task_management/presentation/manager/task_cubit.dart';
import '../../../../../task_management/presentation/widgets/add_manual_task_button.dart';
import '../../domain/use_cases/receive_client_usecase.dart';
import '../manager/clients_list_bloc.dart';
import '../pages/client_add_edit_page.dart';
import 'ClientInfoButtons.dart';
import 'client_info_details.dart';
import 'dialog_client_section.dart';
import 'special_client_icon_button.dart';

class ClientInfoSection extends StatefulWidget {
  const ClientInfoSection({
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
  State<ClientInfoSection> createState() => _ClientInfoSectionState();
}

class _ClientInfoSectionState extends State<ClientInfoSection> {
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
        return AppErrorWidget(onPressed: () {
          _clientProvider.getClientById(widget.idClient.toString());
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
              listenWhen: (previous, current) {
                return current.receiveClientStatus.isSuccess() &&
                    previous.receiveClientStatus != current.receiveClientStatus;
              },
              listener: (context, state) {
                if (state.receiveClientStatus.isSuccess()) {
                  clientModel = state.receiveClientStatus.data!;
                  _clientsListBloc.currentClient = clientModel;
                }
              },
              buildWhen: (previous, current) {
                return current.receiveClientStatus.isSuccess() &&
                    previous.receiveClientStatus != current.receiveClientStatus;
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
                            height: 50.scaleIconsSize,
                            width: 50.scaleIconsSize,
                            //color: AppColors.kMainColor,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: IconButton(
                              onPressed: () async {
                                if (kIsWeb) {
                                  HelperFunctions.copyToClipboard(
                                      clientModel.mobile.toString());
                                  return;
                                }
                                await FlutterPhoneDirectCaller.callNumber(
                                    clientModel.mobile.toString());
                              },
                              icon: AppIcon(
                                kIsWeb ? Icons.copy : Icons.call,
                              ),
                              color: AppColors.kWhiteColor,
                            ),
                          ),
                          SpecialClientIconButton()
                        ],
                      ),
                      TextButton(
                        onPressed: () async {
                          if (kIsWeb) {
                            HelperFunctions.copyToClipboard(
                                clientModel.mobile.toString());
                            return;
                          }
                          await FlutterPhoneDirectCaller.callNumber(
                              clientModel.mobile.toString());
                        },
                        child: AppText(
                          clientModel.mobile.toString(),
                          fontFamily: AppFonts.fontFamily2,
                          color: AppColors.primaryColor,
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
                                          await AppNavigator.go(
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
    return context.read<PrivilegesCubit>().checkPrivilege("187") && noFkUser;
  }

  _onPressedUpdate(BuildContext context) async {
    isUpdate = true;
    ClientModel? result =
        await AppNavigator.go(ClientAddEditPage(client: clientModel));

    if (result != null) {
      setState(() {
        clientModel = result;
      });
    }
  }
}
