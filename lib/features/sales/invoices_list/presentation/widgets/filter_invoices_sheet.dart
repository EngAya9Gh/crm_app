import 'dart:ui' as myui;

import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:crm_smart/core/common/models/user_entity.dart';
import 'package:crm_smart/core/common/widgets/app_elvated_button.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/core/common/widgets/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/enums/client/client_status_enum.dart';
import '../../../../../core/common/enums/devices_state_enum.dart';
import '../../../../../core/common/enums/seller_type_enum.dart';
import '../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../view_model/agent_collaborators_invoices_vm.dart';
import '../../../../../view_model/regoin_vm.dart';
import '../../../../../view_model/typeclient.dart';
import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../manager/invoices_section_cubit.dart';

class FilterInvoicesSheet extends StatefulWidget {
  const FilterInvoicesSheet({
    Key? key,
    required this.onFilter,
  });

  final VoidCallback onFilter;
  // final ValueChanged<GetClientsWithFilterParams> onFilter;

  @override
  State<FilterInvoicesSheet> createState() => _FilterInvoicesSheetState();
}

class _FilterInvoicesSheetState extends State<FilterInvoicesSheet> {
  late final InvoicesSectionCubit _invoicesTabCubit;
  late final PrivilegeCubit _privilegeCubit;
  late final AgentsCollaboratorsInvoicesViewmodel _agentsViewModel;
  ClientStatusEnum selectedValueFilterNotReady = ClientStatusEnum.all;
  DevicesStateFilterEnum selectedValueFilterHasDevices =
      DevicesStateFilterEnum.all;

  @override
  void initState() {
    _invoicesTabCubit = context.read<InvoicesSectionCubit>();
    _privilegeCubit = context.read<PrivilegeCubit>();
    _agentsViewModel = context.read<AgentsCollaboratorsInvoicesViewmodel>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: myui.TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            CustomDropDown<SellerTypeEnum>(
              hint: "النوع",
              items: SellerTypeEnum.values,
              itemAsString: (item) => item!.value,
              height: 160.h,
              selectedItem: _invoicesTabCubit.filterInvoicesSellerType.value,
              onChanged: (value) async {
                _invoicesTabCubit.filterInvoicesSellerType.value = value;
                _invoicesTabCubit.getUsers();
              },
            ),
            SizedBox(height: 10),
            ListenableBuilder(
              listenable: _invoicesTabCubit.filterInvoicesSellerType,
              builder: (context, child) {
                if (_isAgentOrParticipate()) {
                  return BlocBuilder<InvoicesSectionCubit,
                      InvoicesSectionState>(
                    builder: (context, state) {
                      return getSellerNameChild(state);
                    },
                  );
                }
                return SizedBox.shrink();
              },
            ),
            Row(
              children: [
                SizedBox(width: 15),
                // Selector<AgentsCollaboratorsInvoicesViewmodel, SellerTypeEnum>(
                //   selector: (_, vm) => vm.selectedSellerTypeFilter,
                //   builder: (context, selectedSellerTypeFilter, _) {
                //     return Expanded(
                //       flex: 3,
                //       child: DropdownButton<SellerTypeEnum>(
                //         isExpanded: true,
                //         hint: Text("النوع"),
                //         items: (SellerTypeEnum.values).map((type) {
                //           return DropdownMenuItem<SellerTypeEnum>(
                //             child: Text(
                //               type.value,
                //               textDirection: myui.TextDirection.rtl,
                //             ),
                //             value: type,
                //           );
                //         }).toList(),
                //         value: selectedSellerTypeFilter,
                //         onChanged: (value) async {
                //           if (value == null) return;
                //           _invoicesTabCubit.getInvoicesParams =
                //               _invoicesTabCubit.getInvoicesParams.copyWith(
                //             typeSeller: value,
                //           );
                //           selectedSellerTypeFilter = value;
                //           await _agentsViewModel
                //             ..onChangeSellerTypeFilter(value)
                //             ..clearUser();
                //           _invoicesTabCubit.getInvoicesByPrivileges();
                //           setState(() {});
                //         },
                //       ),
                //     );
                //   },
                // ),
                // Consumer<AgentsCollaboratorsInvoicesViewmodel>(
                //   builder: (context, vm, child) {
                //     return getSellerNameChild(vm);
                //   },
                // ),
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
                        _invoicesTabCubit.getInvoicesParams =
                            _invoicesTabCubit.getInvoicesParams.copyWith(
                          fkRegionInvoice: value,
                        );
                        _invoicesTabCubit.getInvoicesByPrivileges();
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
                      BlocBuilder<InvoicesSectionCubit, InvoicesSectionState>(
                        builder: (context, state) {
                          return TextFormField(
                            validator: (value) {
                              if (_invoicesTabCubit.dateFrom ==
                                  DateTime(1, 1, 1)) {
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
                              hintText: _invoicesTabCubit.dateFrom ==
                                      DateTime(1, 1, 1)
                                  ? 'from'
                                  : HelperFunctions.formatDate(
                                      _invoicesTabCubit.dateFrom,
                                    ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                            ),
                            readOnly: true,
                            onTap: () async {
                              final date =
                                  await selectDate(context, DateTime.now());
                              if (date == null) return;
                              _invoicesTabCubit.dateFrom = date;
                              setState(() {});
                              _invoicesTabCubit.getInvoicesParams =
                                  _invoicesTabCubit.getInvoicesParams.copyWith(
                                from: DateFormat('yyyy-MM-dd')
                                    .format(_invoicesTabCubit.dateFrom),
                              );
                              _invoicesTabCubit.getInvoicesByPrivileges();
                            },
                          );
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
                          if (_invoicesTabCubit.dateTo == DateTime(1, 1, 1)) {
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
                          hintText:
                              _invoicesTabCubit.dateTo == DateTime(1, 1, 1)
                                  ? 'to' //_currentDate.toString()
                                  : DateFormat('yyyy-MM-dd')
                                      .format(_invoicesTabCubit.dateTo),
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
                                _invoicesTabCubit.dateTo = date;
                                _invoicesTabCubit.getInvoicesParams =
                                    _invoicesTabCubit.getInvoicesParams
                                        .copyWith(
                                  to: DateFormat('yyyy-MM-dd')
                                      .format(_invoicesTabCubit.dateTo),
                                );
                                _invoicesTabCubit.getInvoicesByPrivileges();
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
            Row(
              children: [
                if (_privilegeCubit.checkPrivilege('156') == true) ...[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 8),
                      child: Consumer<ClientTypeProvider>(
                          builder: (context, cart, child) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return DropdownButton<ClientStatusEnum>(
                              isExpanded: true,
                              hint: Text('حالة الفاتورة'),
                              items: ClientStatusEnum.values.map((value) {
                                return DropdownMenuItem(
                                  child: Text(value.name),
                                  value: value,
                                );
                              }).toList(),
                              value: selectedValueFilterNotReady,
                              onChanged: (value) {
                                setState(() {
                                  selectedValueFilterNotReady = value!;
                                });
                                _invoicesTabCubit.getInvoicesParams =
                                    _invoicesTabCubit.getInvoicesParams
                                        .copyWith(
                                  typeReadyClient: value!.toParam,
                                );
                                _invoicesTabCubit.getInvoicesByPrivileges();
                              },
                            );
                          },
                        );
                      }),
                    ),
                  ),
                ],
                if (_privilegeCubit.checkPrivilege('193')) ...[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 8),
                      child: Consumer<ClientTypeProvider>(
                          builder: (context, cart, child) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return DropdownButton<DevicesStateFilterEnum>(
                              isExpanded: true,
                              hint: Text('الأجهزة'),
                              items: DevicesStateFilterEnum.values.map((value) {
                                return DropdownMenuItem(
                                  child: Text(value.value),
                                  value: value,
                                );
                              }).toList(),
                              value: selectedValueFilterHasDevices,
                              onChanged: (value) {
                                setState(() {
                                  selectedValueFilterHasDevices = value!;
                                });
                                _invoicesTabCubit.getInvoicesParams =
                                    _invoicesTabCubit.getInvoicesParams
                                        .copyWith(
                                  hasDevices: value!.toParam,
                                );
                                _invoicesTabCubit.getInvoicesByPrivileges();
                              },
                            );
                          },
                        );
                      }),
                    ),
                  ),
                ],
              ],
            ),
            SizedBox(height: 10),
            AppElevatedButton(
              text: 'تطبيق',
              onPressed: () {
                widget.onFilter();
                AppNavigator.pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  bool _isAgentOrParticipate() {
    if ((_invoicesTabCubit.filterInvoicesSellerType.value
                ?.isAgentOrDistributor() ??
            false) ||
        (_invoicesTabCubit.filterInvoicesSellerType.value?.isParticipate() ??
            false)) {
      return true;
    }
    return false;
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

  Widget refreshIcon(VoidCallback onPressed) {
    return IconButton(
      key: Key("IconButton"),
      onPressed: onPressed,
      icon: Icon(Icons.refresh),
    );
  }

  Widget getSellerNameChild(InvoicesSectionState state) {
    if (state.getUsersState.isLoading()) {
      return CustomLoadingIndicator();
    } else if (state.getUsersState.isFailed()) {
      return CustomErrorWidget(
        message: "حدث خطأ أثناء تحميل البيانات",
        onPressed: () => _invoicesTabCubit.getUsers(),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: CustomSearchableDropDown<UserEntity>(
        hint: _invoicesTabCubit.filterInvoicesSellerType.value?.value ?? '',
        items: state.getUsersState.data ?? [],
        selectedItem: _invoicesTabCubit.filterSelectedUser.value,
        itemAsString: (item) => item!.name,
        filterFn: (item, query) {
          return item.name.contains(query);
        },
        onChanged: (user) {
          if (user == null) return;

          _invoicesTabCubit.filterSelectedUser.value = user;
        },
      ),
    );
  }
}
