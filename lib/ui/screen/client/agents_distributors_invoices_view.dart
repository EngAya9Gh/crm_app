import 'dart:async';

import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../model/agent_distributor_model.dart';
import '../../../model/participatModel.dart';
import '../../../view_model/agent_collaborators_invoices_vm.dart';
import '../../../view_model/invoice_vm.dart';
import '../../../view_model/regoin_vm.dart';
import '../../../view_model/typeclient.dart';
import '../../../view_model/vm.dart';
import '../../widgets/invoice_widget/Card_invoice_client.dart';

enum SellerTypeFilter { all, distributor, agent, collaborator, employee }

extension SellerExt on SellerTypeFilter {
  String get text {
    switch (this) {
      case SellerTypeFilter.all:
        return "الكل";
      case SellerTypeFilter.distributor:
        return "موزع";
      case SellerTypeFilter.agent:
        return "وكيل";

      case SellerTypeFilter.collaborator:
        return "متعاون";

      case SellerTypeFilter.employee:
        return "موظف";
    }
  }
}

class AgentsDistributorsInvoicesView extends StatefulWidget {
  const AgentsDistributorsInvoicesView({Key? key}) : super(key: key);

  @override
  State<AgentsDistributorsInvoicesView> createState() => _AgentsDistributorsInvoicesViewState();
}

class _AgentsDistributorsInvoicesViewState extends State<AgentsDistributorsInvoicesView>
    with StateViewModelMixin<AgentsDistributorsInvoicesView, AgentsCollaboratorsInvoicesViewmodel> {
  late privilge_vm privilegeVm;

  @override
  void initState() {
    super.initState();
    privilegeVm = context.read<privilge_vm>();
    final privilegeList = privilegeVm.privilgelist;
    scheduleMicrotask(() {
      viewmodel.init();
      context.read<regoin_vm>().changeVal(null);
      context.read<typeclient>().changelisttype_install(null);
      context.read<invoice_vm>()
        ..setvaluepriv(privilegeList)
        ..getinvoice_Localwithprev();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'فواتير العملاء والموزعين',
          style: TextStyle(color: kWhiteColor),
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 15),
                Selector<AgentsCollaboratorsInvoicesViewmodel, SellerTypeFilter>(
                    selector: (_, vm) => vm.selectedSellerTypeFilter,
                    builder: (context, selectedSellerTypeFilter, _) {
                      return Expanded(
                        flex: 3,
                        child: DropdownButton<SellerTypeFilter>(
                          isExpanded: true,
                          hint: Text("النوع"),
                          items: (SellerTypeFilter.values).map((type) {
                            return DropdownMenuItem<SellerTypeFilter>(
                              child: Text(type.text, textDirection: TextDirection.rtl),
                              value: type,
                            );
                          }).toList(),
                          value: selectedSellerTypeFilter,
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            viewmodel.onChangeSellerTypeFilter(value);
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
            if (privilegeVm.checkprivlge('1'))
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Consumer<regoin_vm>(
                  builder: (context, cart, child) {
                    return DropdownButton<String?>(
                      isExpanded: true,
                      hint: Text("الفرع"),
                      items: cart.listregoinfilter.map((level_one) {
                        return DropdownMenuItem(
                          child: Text(level_one.name_regoin),
                          value: level_one.id_regoin,
                        );
                      }).toList(),
                      value: cart.selectedValueLevel,
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        cart.changeVal(value.toString());
                        viewmodel.onChangeRegion(value);
                      },
                    );
                  },
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
                    style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                  ),
                  Consumer2<invoice_vm, AgentsCollaboratorsInvoicesViewmodel>(
                      builder: (context, value, agentCollaboratorsVm, child) {

                    final list = agentCollaboratorsVm.selectedSellerTypeFilter == SellerTypeFilter.all &&
                            (agentCollaboratorsVm.selectedRegion == null || agentCollaboratorsVm.selectedRegion == '0')
                        ? value.listInvoicesAccept
                        : agentCollaboratorsVm.invoicesFiltered;

                    return Text(
                      list.length.toString(),
                      style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(height: 10),
            Consumer2<invoice_vm, AgentsCollaboratorsInvoicesViewmodel>(
              builder: (context, value, agentCollaboratorsVm, child) {
                final list = agentCollaboratorsVm.selectedSellerTypeFilter == SellerTypeFilter.all &&
                    (agentCollaboratorsVm.selectedRegion == null || agentCollaboratorsVm.selectedRegion == '0')
                    ? value.listInvoicesAccept
                    : agentCollaboratorsVm.invoicesFiltered;

                if (value.isloading) {
                  return loadingWidget;
                } else if (list.length == 0) {
                  return Center(child: Text(messageNoData));
                }

                return Expanded(
                  child: ListView.separated(
                    itemCount: list.length,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    separatorBuilder: (_, __) => const SizedBox.shrink(),
                    itemBuilder: (context, index) {
                      return CardInvoiceClient(
                        type: 'profile',
                        itemProd: list[index],
                      );
                    },
                  ),
                );
              },
            ),
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
                  child: Text((item as ParticipateModel).name_participate, textDirection: TextDirection.rtl),
                  value: item,
                );
              } else {
                return DropdownMenuItem(
                  child: Text((item as AgentDistributorModel).nameAgent, textDirection: TextDirection.rtl),
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
                viewmodel.onChangeSelectedCollaboratorEmployee(seller as ParticipateModel);
              } else {
                viewmodel.onChangeSelectedAgentDistributor(seller as AgentDistributorModel);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget getSellerNameChild(AgentsCollaboratorsInvoicesViewmodel vm) {
    //region Variables
    final selectedSellerTypeFilter = vm.selectedSellerTypeFilter;
    final selectedAgentDistributor = vm.selectedAgentDistributor;
    final selectedCollaboratorEmployee = vm.selectedCollaboratorEmployee;
    final sellerStatus = vm.sellerStatus;
    final isCollaborateEmployee =
        [SellerTypeFilter.collaborator, SellerTypeFilter.employee].contains(selectedSellerTypeFilter);

    final agentsDistributorsList = vm.agentDistributorsState.data ?? [];
    final collaboratorsEmployeeStateList = vm.collaboratorsEmployeeState.data ?? [];
    //endregion

    if (sellerStatus == SellerStatus.loading)
      return loadingWidget;
    else if (sellerStatus == SellerStatus.failed)
      return refreshIcon(() {});
    else if (isCollaborateEmployee)
      // return Container(color: Colors.red);
      return Expanded(
        flex: 5,
        child: sellerDropdown<ParticipateModel>(
          collaboratorsEmployeeStateList,
          selectedValue: selectedCollaboratorEmployee,
        ),
      );
    else if (selectedSellerTypeFilter != SellerTypeFilter.all)
      // return Container(color: Colors.blue);
      return Expanded(
        flex: 5,
        child: sellerDropdown<AgentDistributorModel>(
          agentsDistributorsList,
          selectedValue: selectedAgentDistributor,
        ),
      );
    else
      return SizedBox.shrink();
  }
}