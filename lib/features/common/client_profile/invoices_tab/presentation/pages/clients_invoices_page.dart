import 'dart:async';
import 'dart:ui' as myui;

import 'package:crm_smart/core/common/enums/seller_type_enum.dart';
import 'package:crm_smart/features/common/client_profile/invoices_tab/presentation/manager/invoices_tab_cubit/invoices_tab_cubit.dart';
import 'package:crm_smart/features/common/client_profile/invoices_tab/presentation/pages/invoices_paginated_list.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/services/di/di_container.dart';
import '../../../../../../model/agent_distributor_model.dart';
import '../../../../../../model/participatModel.dart';
import '../../../../../../view_model/agent_collaborators_invoices_vm.dart';
import '../../../../../../view_model/invoice_vm.dart';
import '../../../../../../view_model/regoin_vm.dart';
import '../../../../../../view_model/typeclient.dart';
import '../../../../../../view_model/user_vm_provider.dart';
import '../../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';

class ClientsInvoicesPage extends StatefulWidget {
  const ClientsInvoicesPage({Key? key}) : super(key: key);

  @override
  State<ClientsInvoicesPage> createState() => _ClientsInvoicesPageState();
}

class _ClientsInvoicesPageState extends State<ClientsInvoicesPage> {
  late final PrivilegeCubit _privilegeCubit;
  late final InvoicesTabCubit invoicesTabCubit;
  late final AgentsCollaboratorsInvoicesViewmodel viewmodel;

  DateTime selectedDatefrom = DateTime.now();

  @override
  void initState() {
    super.initState();
    _privilegeCubit = context.read<PrivilegeCubit>();
    invoicesTabCubit = context.read<InvoicesTabCubit>()
      ..getInvoicesByPrivileges();
    viewmodel = Provider.of<AgentsCollaboratorsInvoicesViewmodel>(context,
        listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewmodel.init();
      context.read<RegionProvider>().changeVal(null);
      context.read<ClientTypeProvider>()
        ..changelisttype_install(null)
        ..changevalueNotReady(null);
      context
          .read<invoice_vm>()
          .getinvoice_Localwithprev(getIt<PrivilegeCubit>());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'فواتير العملاء',
          style: TextStyle(color: kWhiteColor),
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: myui.TextDirection.rtl,
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 15),
                Selector<AgentsCollaboratorsInvoicesViewmodel, SellerTypeEnum>(
                    selector: (_, vm) => vm.selectedSellerTypeFilter,
                    builder: (context, selectedSellerTypeFilter, _) {
                      return Expanded(
                        flex: 3,
                        child: DropdownButton<SellerTypeEnum>(
                          isExpanded: true,
                          hint: Text("النوع"),
                          items: (SellerTypeEnum.values).map((type) {
                            return DropdownMenuItem<SellerTypeEnum>(
                              child: Text(
                                type.name,
                                textDirection: myui.TextDirection.rtl,
                              ),
                              value: type,
                            );
                          }).toList(),
                          value: selectedSellerTypeFilter,
                          onChanged: (value) {
                            if (value == null) return;
                            invoicesTabCubit.getInvoicesParams =
                                invoicesTabCubit.getInvoicesParams.copyWith(
                              typeSeller: value,
                            );
                            invoicesTabCubit.getInvoicesByPrivileges();
                          },
                        ),
                      );
                    }),
                Consumer<AgentsCollaboratorsInvoicesViewmodel>(
                  builder: (context, vm, child) {
                    return getSellerNameChild(vm);
                  },
                ),
                SizedBox(width: 15),
              ],
            ),
            SizedBox(height: 10),
            if (_privilegeCubit.checkPrivilege('1'))
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Consumer<RegionProvider>(
                  builder: (context, cart, child) {
                    return DropdownButton<String?>(
                      isExpanded: true,
                      hint: Text("الفرع"),
                      items: cart.listRegionFilter.map((level_one) {
                        return DropdownMenuItem(
                          child: Text(level_one.regionName),
                          value: level_one.regionId,
                        );
                      }).toList(),
                      value: cart.selectedRegionId,
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        invoicesTabCubit.getInvoicesParams =
                            invoicesTabCubit.getInvoicesParams.copyWith(
                          fkRegionInvoice: value,
                        );
                        invoicesTabCubit.getInvoicesByPrivileges();
                        cart.changeVal(value.toString());
                      },
                    );
                  },
                ),
              ),
            Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('from'),
                      TextFormField(
                        validator: (value) {
                          if (selectedDatefrom == DateTime(1, 1, 1)) {
                            return 'يرجى تعيين التاريخ ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: kMainColor,
                          ),
                          hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          hintText: selectedDatefrom == DateTime(1, 1, 1)
                              ? 'from' //_currentDate.toString()
                              : DateFormat('yyyy-MM-dd')
                                  .format(selectedDatefrom),
                          //_invoice!.dateinstall_task.toString(),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                        ),
                        readOnly: true,
                        onTap: () {
                          setState(() async {
                            final date =
                                await selectDate(context, DateTime.now());
                            if (date != null)
                              setState(() {
                                invoicesTabCubit.dateFrom = date;
                                invoicesTabCubit.getInvoicesParams =
                                    invoicesTabCubit.getInvoicesParams.copyWith(
                                  from: DateFormat('yyyy-MM-dd')
                                      .format(selectedDatefrom),
                                );
                                invoicesTabCubit.getInvoicesByPrivileges();
                              });
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      Text('to'),
                      TextFormField(
                        validator: (value) {
                          if (invoicesTabCubit.dateTo == DateTime(1, 1, 1)) {
                            return 'يرجى تعيين التاريخ ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: kMainColor,
                          ),
                          hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          hintText: invoicesTabCubit.dateTo == DateTime(1, 1, 1)
                              ? 'to' //_currentDate.toString()
                              : DateFormat('yyyy-MM-dd')
                                  .format(invoicesTabCubit.dateTo),
                          //_invoice!.dateinstall_task.toString(),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                        ),
                        readOnly: true,
                        onTap: () {
                          setState(() async {
                            final date =
                                await selectDate(context, DateTime.now());
                            if (date != null) {
                              setState(() {
                                invoicesTabCubit.dateTo = date;
                                invoicesTabCubit.getInvoicesParams =
                                    invoicesTabCubit.getInvoicesParams.copyWith(
                                  to: DateFormat('yyyy-MM-dd')
                                      .format(invoicesTabCubit.dateTo),
                                );
                                invoicesTabCubit.getInvoicesByPrivileges();
                              });
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _privilegeCubit.checkPrivilege('156') == true
                ? Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 8),
                    child: Consumer<ClientTypeProvider>(
                        builder: (context, cart, child) {
                      return DropdownButton(
                        isExpanded: true,
                        hint: Text('حالة الفاتورة'),
                        items: cart.listtype_notReady.map((level_one) {
                          return DropdownMenuItem(
                            child: Text(level_one),
                            value: level_one,
                          );
                        }).toList(),
                        value: cart.selectedValufilter_NotReady,
                        onChanged: (value) {
                          invoicesTabCubit.getInvoicesParams =
                              invoicesTabCubit.getInvoicesParams.copyWith(
                            typeReadyClient: value,
                          );
                          cart.changevalueNotReady(value.toString());
                          invoicesTabCubit.getInvoicesByPrivileges();
                        },
                      );
                    }),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                controller: invoicesTabCubit.searchController,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "ابحث هنا...",
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'عدد الفواتير',
                    style: TextStyle(
                        fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                  ),
                  BlocBuilder<InvoicesTabCubit, InvoicesTabState>(
                    buildWhen: (previous, current) => true,
                    builder: (context, state) {
                      return Text(
                        invoicesTabCubit.invoicesList.length.toString(),
                        style: TextStyle(
                            fontFamily: kfontfamily2,
                            fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            InvoicesPaginatedList(),
          ],
        ),
      ),
    );
  }

  Widget refreshIcon(VoidCallback onPressed) {
    return IconButton(
      key: Key("IconButton"),
      onPressed: onPressed,
      icon: Icon(Icons.refresh),
    );
  }

  Widget get loadingWidget {
    return Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }

  Widget sellerDropdown<T>(
    List<T> sellerNames, {
    T? selectedValue,
  }) {
    return Row(
      key: ValueKey(selectedValue),
      children: [
        SizedBox(width: 10),
        Expanded(
          child: DropdownButton<T>(
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
            hint: Text("اختر البائع"),
            items: sellerNames.map((item) {
              if (T == ParticipateModel) {
                return DropdownMenuItem(
                  child: Text((item as ParticipateModel).name_participate,
                      textDirection: myui.TextDirection.rtl),
                  value: item,
                );
              } else if (T == AgentDistributorModel) {
                return DropdownMenuItem(
                  child: Text((item as AgentDistributorModel).nameAgent,
                      textDirection: myui.TextDirection.rtl),
                  value: item,
                );
              } else {
                return DropdownMenuItem(
                  child: Text((item as UserModel).nameUser!,
                      textDirection: myui.TextDirection.rtl),
                  value: item,
                );
              }
            }).toList(),
            value: selectedValue,
            onChanged: (seller) {
              if (seller == null) {
                return;
              }

              if (T == ParticipateModel) {
                invoicesTabCubit.getInvoicesParams =
                    invoicesTabCubit.getInvoicesParams.copyWith(
                        participateFk:
                            (seller as ParticipateModel).id_participate);
                viewmodel
                    .onChangeSelectedCollaborator(seller as ParticipateModel);
              } else if (T == AgentDistributorModel) {
                invoicesTabCubit.getInvoicesParams =
                    invoicesTabCubit.getInvoicesParams.copyWith(
                        fkAgent: (seller as AgentDistributorModel).idAgent);
                viewmodel.onChangeSelectedAgentDistributor(
                    seller as AgentDistributorModel);
              } else {
                invoicesTabCubit.getInvoicesParams = invoicesTabCubit
                    .getInvoicesParams
                    .copyWith(fkIdUser: (seller as UserModel).idUser);
                viewmodel.onChangeEmployee(seller as UserModel);
              }
            },
          ),
        ),
      ],
    );
  }

  Future<DateTime?> selectDate(
    BuildContext context,
    DateTime currentDate,
  ) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      currentDate: currentDate,
      initialDate: currentDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(3010),
    );

    return pickedDate;
  }

  Widget getSellerNameChild(AgentsCollaboratorsInvoicesViewmodel vm) {
    //region Variables
    final selectedSellerTypeFilter = vm.selectedSellerTypeFilter;
    final selectedAgentDistributor = vm.selectedAgentDistributor;
    final selectedCollaborator = vm.selectedCollaborator;
    final selectedEmployee = vm.selectedEmployee;
    final sellerStatus = vm.sellerStatus;
    final isCollaborate =
        selectedSellerTypeFilter == SellerTypeEnum.collaborator;
    final isEmp = selectedSellerTypeFilter == SellerTypeEnum.employee;

    var agentsDistributorsList = vm.agentDistributorsState.data ?? [];
    final collaboratorsEmployeeStateList =
        vm.collaboratorsEmployeeState.data ?? [];
    //endregion

    if (sellerStatus == SellerStatus.loading)
      return loadingWidget;
    else if (sellerStatus == SellerStatus.failed)
      return refreshIcon(() {});
    else if (isCollaborate)
      return Expanded(
        flex: 5,
        child: sellerDropdown<ParticipateModel>(
          collaboratorsEmployeeStateList,
          selectedValue: selectedCollaborator,
        ),
      );
    else if (isEmp)
      return Consumer<UserProvider>(
        builder: (context, value, child) => Expanded(
          flex: 5,
          child: sellerDropdown<UserModel>(
            value.usersSalesManagement,
            selectedValue: selectedEmployee,
          ),
        ),
      );
    else if (selectedSellerTypeFilter != SellerTypeEnum.all) {
      List<AgentDistributorModel> agentsListtemp = [];

      agentsDistributorsList.forEach((element) {
        if (element.typeAgent ==
            viewmodel.selectedSellerTypeFilter.index.toString())
          agentsListtemp.add(element);
      });
      agentsDistributorsList = List.from(agentsListtemp);
      // return Container(color: Colors.blue);
      return Expanded(
        flex: 5,
        child: sellerDropdown<AgentDistributorModel>(
          agentsDistributorsList,
          selectedValue: selectedAgentDistributor,
        ),
      );
    } else
      return SizedBox.shrink();
  }
}
