import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:crm_smart/core/common/widgets/section_with_action.dart';
import 'package:crm_smart/features/sales/clients/clients_list/presentation/widgets/dialog_client_type.dart';
import 'package:crm_smart/features/task_management/presentation/pages/add_manual_task_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/app_fonts.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../ui/widgets/custom_widget/card_row.dart';
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
import 'link_client_dailog.dart';
import 'special_client_icon_button.dart';
import '../../../../../../core/common/widgets/add_action_button.dart';
import '../../../../../../core/common/widgets/action_menu_item.dart';

class LinkedClient {
  final String id;
  final String nameEnterprise;
  final bool isLinked;
  bool isSelected;

  LinkedClient({
    required this.id,
    required this.nameEnterprise,
    required this.isLinked,
    this.isSelected = false,
  });

  factory LinkedClient.fromJson(Map<String, dynamic> json) {
    return LinkedClient(
      id: json['id_clients'],
      nameEnterprise: json['name_enterprise'],
      isLinked: json['is_linked'] == '1',
    );
  }
}

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
  late final ClientsListBloc _linkClientBloc;

  bool disableWithdrawal = false;

  @override
  void initState() {
    super.initState();
    _clientProvider = context.read<ClientProvider>();
    _clientsListBloc = context.read<ClientsListBloc>();
    _linkClientBloc = context.read<ClientsListBloc>();
    // _linkClientBloc = LinkClientBloc(
    //   FetchLinkClientsUseCase(context.read<ClientRepository>()),
    // );

    _clientsListBloc.currentClient = widget.client;
    // context.read<ManageWithdrawalsCubit>()..getReasonReject();

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
        return const Scaffold(
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
        child: Scaffold(
          body: Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 10),
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
                return ListView(
                    children: [
                    // قسم المهام
                    SectionWithAction(
                      title: 'Tasks',
                      onAddPressed: () async {
                        final result = await showDialog(
                          context: context,
                          builder: (context) => AddManualTaskPage(
                            list: PublicType.values,
                            clientId: clientModel.idClients,
                          ),
                        );
                      },
                      child: Container(), // سيتم إضافة قائمة المهام هنا
                    ),
                    // const SizedBox(height: 2),
                    // قسم معلومات العميل
                    SectionWithAction(
                      title: 'الإجراءات',
                      onAddPressed: () => _showActionMenu(context),
                      child: Column(
                        children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SpecialClientIconButton(
                                    idClients: clientModel.idClients,
                                  ),
                                  if (clientModel.isParent != null)
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.link,
                                        color: AppColors.secondaryMain,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ClientInfoDetails(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),

                  ClientInfoButtons(
                    idClient: widget.idClient,
                    client: clientModel,
                    invoice: widget.invoice,
                    typeInvoice: widget.typeInvoice,
                    clientTransfer: widget.clientTransfer,
                  ),
                    // قسم الإجراءات
                    // if (widget.clientTransfer != 'transfer')
                    //   SectionWithAction(
                    //     title: 'الإجراءات',
                    //     onAddPressed: () {},
                    //     child: Column(
                    //       children: [
                    //         if (clientModel.typeClient == "عرض سعر" ||
                    //             clientModel.typeClient == "تفاوض" ||
                    //             clientModel.typeClient == "مستبعد" ||
                    //             clientModel.typeClient == 'معلق استبعاد') ...[
                    //           SizedBox(
                    //             width: double.infinity,
                    //             child: AppElevatedButton(
                    //               text: 'اجراءات',
                    //               onPressed: () async {
                    //                 ClientModel? result =
                    //                     await AppConstants.showAppDialog(
                    //                   child: DialogClientSection(
                    //                     disableWithdrawal: disableWithdrawal,
                    //                     client: clientModel,
                    //                     idClient: widget.idClient,
                    //                   ),
                    //                 );

                    //                 if (result != null) {
                    //                   clientModel = result;
                    //                   _clientsListBloc.currentClient =
                    //                       clientModel;
                    //                 }
                    //               },
                    //             ),
                    //           ),
                    //           const SizedBox(height: 5),
                    //         ],
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: AppElevatedButton(
                    //     text: 'نوع العميل',
                    //     onPressed: () async {
                    //       ClientModel? result = await showDialog(
                    //         context: context,
                    //         builder: (BuildContext context) {
                    //           return DialogClientType(
                    //             disableWithdrawal: disableWithdrawal,
                    //             client: clientModel,
                    //             idClient: widget.idClient,
                    //           );
                    //         },
                    //       );
                    //       if (result != null) {
                    //         clientModel = result;
                    //         _clientProvider.getClientById(
                    //             widget.idClient.toString());
                    //       }
                    //     },
                    //   ),
                    // ),
                    // const SizedBox(height: 5),
                    // if (clientModel.nameTransferTo == null) ...[
                    //   Row(
                    //     children: [
                    //       Expanded(
                    //         child: AppElevatedButton(
                    //           text: 'تحويل العميل',
                    //           onPressed: () async {
                    //             final transferredClient =
                    //                 await AppNavigator.go(
                    //               TransferClientPage(
                    //                 nameEnterprise: clientModel
                    //                     .nameEnterprise
                    //                     .toString(),
                    //                 idClient: clientModel.idClients
                    //                     .toString(),
                    //                 type: "client",
                    //               ),
                    //               isNew: false,
                    //             );
                    //             if (transferredClient != null) {
                    //               final newClient = (transferredClient
                    //                   as ClientModel);
                    //               _clientProvider
                    //                   .changevalueclient(newClient);
                    //             }
                    //           },
                    //         ),
                    //       ),
                    //       if (_isValidForReceiving()) ...[
                    //         const SizedBox(width: 8),
                    //         Expanded(
                    //           child: BlocBuilder<ClientsListBloc,
                    //               ClientsListState>(
                    //             builder: (context, state) {
                    //               return AppElevatedButton(
                    //                 text: 'استلام العميل',
                    //                 isLoading: state.receiveClientStatus
                    //                     .isLoading(),
                    //                 onPressed: () async {
                    //                   _clientsListBloc
                    //                       .add(ReceiveClientEvent(
                    //                     ReceiveClientParams(
                    //                       idClient:
                    //                           clientModel.idClients!,
                    //                     ),
                    //                   ));
                    //                 },
                    //               );
                    //             },
                    //           ),
                    //         ),
                    //       ],
                    //     ],
                    //   ),
                    // ],
                    //       ],
                    //    ),
                    // ),
                  ],
                );
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
    ClientModel? result = await AppNavigator.go(
      ClientAddEditPage(client: clientModel),
      isNew: false,
    );

    if (result != null) {
      setState(() {
        clientModel = result;
      });
    }
  }

  void _showActionMenu(BuildContext context) {
    context.read<ManageWithdrawalsCubit>()..getReasonReject();
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.clientTransfer != 'transfer') ...[
              ActionMenuItem(
                title: 'تعديل بيانات العميل',
                icon: Icons.edit,
                onTap: () async {
                  Navigator.pop(context);
                  await _onPressedUpdate(context);
                },
              ),
              if (clientModel.typeClient == "عرض سعر" ||
                  clientModel.typeClient == "تفاوض" ||
                  clientModel.typeClient == "مستبعد" ||
                  clientModel.typeClient == 'معلق استبعاد') ...[
                ActionMenuItem(
                  title: 'اجراءات',
                  icon: Icons.list_alt,
                  onTap: () async {
                    Navigator.pop(context);
                    ClientModel? result = await AppConstants.showAppDialog(
                      child: DialogClientSection(
                        disableWithdrawal: disableWithdrawal,
                        client: clientModel,
                        idClient: widget.idClient,
                      ),
                    );

                    if (result != null) {
                      clientModel = result;
                      _clientsListBloc.currentClient = clientModel;
                    }
                  },
                ),
              ],
              ActionMenuItem(
                title: 'نوع العميل',
                icon: Icons.category,
                onTap: () async {
                  Navigator.pop(context);
                  ClientModel? result = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DialogClientType(
                        disableWithdrawal: disableWithdrawal,
                        client: clientModel,
                        idClient: widget.idClient,
                      );
                    },
                  );
                  if (result != null) {
                    clientModel = result;
                    _clientProvider.getClientById(widget.idClient.toString());
                  }
                },
              ),
              if (clientModel.nameTransferTo == null) ...[
                ActionMenuItem(
                  title: 'تحويل العميل',
                  icon: Icons.transform,
                  onTap: () async {
                    Navigator.pop(context);
                    final transferredClient = await AppNavigator.go(
                      TransferClientPage(
                        nameEnterprise: clientModel.nameEnterprise.toString(),
                        idClient: clientModel.idClients.toString(),
                        type: "client",
                      ),
                      isNew: false,
                    );
                    if (transferredClient != null) {
                      final newClient = (transferredClient as ClientModel);
                      _clientProvider.changevalueclient(newClient);
                    }
                  },
                ),
                if (_isValidForReceiving()) ...[
                  ActionMenuItem(
                    title: 'استلام العميل',
                    icon: Icons.person_add,
                    onTap: () {
                      Navigator.pop(context);
                      _clientsListBloc.add(ReceiveClientEvent(
                        ReceiveClientParams(
                          idClient: clientModel.idClients!,
                        ),
                      ));
                    },
                  ),
                ],
              ],
              ActionMenuItem(
                title: 'ربط العميل',
                icon: Icons.link,
                onTap: () async {
                  Navigator.pop(context);
                  _linkClientBloc.add(FetchLinkClients(clientModel.idClients!));
                  final result = await showDialog<bool>(
                    context: context,
                    builder: (BuildContext context) {
                      return BlocBuilder<ClientsListBloc, ClientsListState>(
                        bloc: _linkClientBloc,
                        builder: (context, state) {
                          return LinkClientDialog(
                            clientId: clientModel.idClients!,
                          );
                        },
                      );
                    },
                  );
                  if (result == true) {
                    setState(() {});
                  }
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildActionItem({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryMain),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          // fontFamily: 'Cairo',
        ),
      ),
      onTap: onTap,
    );
  }
}
