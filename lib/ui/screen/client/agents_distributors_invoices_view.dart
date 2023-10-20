import 'dart:async';

import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../model/agent_distributor_model.dart';
import '../../../model/participatModel.dart';
import '../../../view_model/agent_collaborators_invoices_vm.dart';
import '../../../view_model/invoice_vm.dart';
import '../../../view_model/regoin_vm.dart';
import '../../../view_model/typeclient.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../../view_model/vm.dart';
import '../../widgets/invoice_widget/Card_invoice_client.dart';
import 'dart:ui' as myui;

enum SellerTypeFilter { distributor, agent, collaborator, employee, all }

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
  late TextEditingController _searchTextField;
  DateTime _selectedDatefrom = DateTime.now();
  DateTime _selectedDateto = DateTime.now();

  @override
  void initState() {
    super.initState();
    privilegeVm = context.read<privilge_vm>();
    _searchTextField = TextEditingController();
    _searchTextField.addListener(onSearch);
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
  void dispose() {
    _searchTextField
      ..removeListener(onSearch)
      ..dispose();
    super.dispose();
  }

  void onSearch() {
    viewmodel.onSearch(_searchTextField.text);
  }

  Future<void> _selectDatefrom(BuildContext context, DateTime currentDate) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3010));
    if (pickedDate != null)
      setState(() {
        // Navigator.pop(context);
        _selectedDatefrom = pickedDate;
        print('_selectedDatefrom ' + _selectedDatefrom.toString());
        print('_selectedDateto ' + _selectedDateto.toString());
        // if(_selectedDateto!=DateTime(1, 1, 1)&&_selectedDatefrom!=DateTime(1, 1, 1))
        Provider.of<AgentsCollaboratorsInvoicesViewmodel>(context, listen: false)
            .onChange_date(_selectedDatefrom, _selectedDateto);
      });
  }

  Future<void> _selectDateto(BuildContext context, DateTime currentDate) async {
    DateTime? pickedDate = await showDatePicker(
        // initialEntryMode: DatePickerEntryMode.calendarOnly,
        // initialDatePickerMode: DatePickerMode.year,
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3010));
    if (pickedDate != null)
      setState(() {
        // Navigator.pop(context);
        _selectedDateto = pickedDate;
        print('_selectedDateto ' + _selectedDateto.toString());
        // if(_selectedDateto!=DateTime(1, 1, 1)&&_selectedDatefrom!=DateTime(1, 1, 1))
        Provider.of<AgentsCollaboratorsInvoicesViewmodel>(context, listen: false)
            .onChange_date(_selectedDatefrom, _selectedDateto);
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
                              child: Text(type.text, textDirection: myui.TextDirection.rtl),
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
            Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('from'),
                      TextFormField(
                        validator: (value) {
                          if (_selectedDatefrom == DateTime(1, 1, 1)) {
                            return 'يرجى تعيين التاريخ ';
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: kMainColor,
                          ),
                          hintStyle: const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                          hintText: _selectedDatefrom == DateTime(1, 1, 1)
                              ? 'from' //_currentDate.toString()
                              : DateFormat('yyyy-MM-dd').format(_selectedDatefrom),
                          //_invoice!.dateinstall_task.toString(),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                        ),
                        readOnly: true,
                        onTap: () {
                          setState(() {
                            _selectDatefrom(context, DateTime.now());

                            // viewmodel.onChange_date( _selectedDatefrom,_selectedDateto);
                          });

                          // _selectDate(context, DateTime.now());
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
                          if (_selectedDateto == DateTime(1, 1, 1)) {
                            return 'يرجى تعيين التاريخ ';
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: kMainColor,
                          ),
                          hintStyle: const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                          hintText: _selectedDateto == DateTime(1, 1, 1)
                              ? 'to' //_currentDate.toString()
                              : DateFormat('yyyy-MM-dd').format(_selectedDateto),
                          //_invoice!.dateinstall_task.toString(),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                        ),
                        readOnly: true,
                        onTap: () {
                          setState(() {
                            _selectDateto(context, DateTime.now());
                            // viewmodel.onChange_date( _selectedDatefrom,_selectedDateto);
                          });
                          // if(_selectedDateto!=DateTime(1, 1, 1)&&_selectedDatefrom!=DateTime(1, 1, 1))
                          //   getData();
                          // _selectDate(context, DateTime.now());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                controller: _searchTextField,
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
                    style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                  ),
                  Consumer2<invoice_vm, AgentsCollaboratorsInvoicesViewmodel>(
                      builder: (context, value, agentCollaboratorsVm, child) {
                    final list = (agentCollaboratorsVm.from == DateTime(1, 1, 1) ||
                                agentCollaboratorsVm.to == DateTime(1, 1, 1)) &&
                            (agentCollaboratorsVm.selectedSellerTypeFilter == SellerTypeFilter.all &&
                                _searchTextField.text.trim().isEmpty &&
                                (agentCollaboratorsVm.selectedRegion == null ||
                                    agentCollaboratorsVm.selectedRegion == '0'))
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
                final list = (agentCollaboratorsVm.from == DateTime(1, 1, 1) ||
                            agentCollaboratorsVm.to == DateTime(1, 1, 1)) &&
                        (agentCollaboratorsVm.selectedSellerTypeFilter == SellerTypeFilter.all &&
                            _searchTextField.text.trim().isEmpty &&
                            (agentCollaboratorsVm.selectedRegion == null || agentCollaboratorsVm.selectedRegion == '0'))
                    ? value.listInvoicesAccept //
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
                        invoice: list[index],
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
                  child: Text((item as ParticipateModel).name_participate, textDirection: myui.TextDirection.rtl),
                  value: item,
                );
              } else if (T == AgentDistributorModel) {
                return DropdownMenuItem(
                  child: Text((item as AgentDistributorModel).nameAgent, textDirection: myui.TextDirection.rtl),
                  value: item,
                );
              } else {
                return DropdownMenuItem(
                  child: Text((item as UserModel).nameUser!, textDirection: myui.TextDirection.rtl),
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
                viewmodel.onChangeSelectedCollaborator(seller as ParticipateModel);
              } else if (T == AgentDistributorModel) {
                viewmodel.onChangeSelectedAgentDistributor(seller as AgentDistributorModel);
              } else {
                viewmodel.onChangeEmployee(seller as UserModel);
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
    final selectedCollaborator = vm.selectedCollaborator;
    final selectedEmployee = vm.selectedEmployee;
    final sellerStatus = vm.sellerStatus;
    final isCollaborate = selectedSellerTypeFilter == SellerTypeFilter.collaborator;
    final isEmp = selectedSellerTypeFilter == SellerTypeFilter.employee;

    var agentsDistributorsList = vm.agentDistributorsState.data ?? [];
    final collaboratorsEmployeeStateList = vm.collaboratorsEmployeeState.data ?? [];
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
      return Consumer<user_vm_provider>(
        builder: (context, value, child) => Expanded(
          flex: 5,
          child: sellerDropdown<UserModel>(
            value.usersSalesManagement,
            selectedValue: selectedEmployee,
          ),
        ),
      );
    else if (selectedSellerTypeFilter != SellerTypeFilter.all) {
      List<AgentDistributorModel> agentsListtemp = [];

      agentsDistributorsList.forEach((element) {
        if (element.typeAgent == viewmodel.selectedSellerTypeFilter!.index.toString()) agentsListtemp.add(element);
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
