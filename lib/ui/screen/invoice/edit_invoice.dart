import 'dart:ui' as ii;

import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/enums/toast_colors_enum.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/enums/enums.dart';
import '../../../core/common/enums/users/active_state_enum.dart';
import '../../../core/common/helpers/helper_functions.dart';
import '../../../core/common/models/location/branch_model.dart';
import '../../../core/common/widgets/app_elevated_button.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../../../core/common/widgets/custom_dropdown.dart';
import '../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../features/sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../../../model/invoiceModel.dart';
import '../../../model/usermodel.dart';
import '../../../view_model/datetime_vm.dart';
import '../../../view_model/invoice_vm.dart';
import '../../../view_model/regoin_vm.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../widgets/custom_widget/app_separator_dots_line.dart';
import '../../widgets/custom_widget/card_row.dart';

class EditInvoice extends StatefulWidget {
  const EditInvoice({
    required this.invoiceModel,
    Key? key,
  }) : super(key: key);
  final InvoiceModel invoiceModel;

  @override
  State<EditInvoice> createState() => _EditInvoiceState();
}

class _EditInvoiceState extends State<EditInvoice> {
  String? iduser;
 late final privilegeCubit ;
  String? regoin;
  String? regoininvoice;
  DateTime? _currentDateApprove = DateTime.now();
  DateTime _currentDateCreate = DateTime.now();
  DateTime? _currentDateFinance = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  TextEditingController approvingDateController = TextEditingController();
  TextEditingController financeDateController = TextEditingController();
  TextEditingController createDateController = TextEditingController();

  Future<void> _handleApprovingInvoiceDate(BuildContext context, DateTime? pickedDate) async {
    if (pickedDate != null) //&& pickedDate != currentDate)
    {
      setState(() {
        _currentDateApprove = pickedDate;
        approvingDateController.text = HelperFunctions.formatDate(pickedDate);
      });
      Provider.of<datetime_vm>(context, listen: false)
          .setdatetimevalue1(_currentDateApprove!);
    }
  }  Future<void> _handleApprovingFinanceInvoiceDate(BuildContext context, DateTime? pickedDate) async {
    if (pickedDate != null) //&& pickedDate != currentDate)
    {
      setState(() {
        _currentDateFinance = pickedDate;
        financeDateController.text = HelperFunctions.formatDate(pickedDate);
      });
      Provider.of<datetime_vm>(context, listen: false)
          .setdatetimevalue1(_currentDateFinance!);
    }
  }

  void _handleCreatingInvoiceDate(BuildContext context, DateTime? pickedDate) {
    if (pickedDate != null) {

      if (mounted) {
        setState(() {
          _currentDateCreate = pickedDate;
          createDateController.text = HelperFunctions.formatDate(pickedDate);
        });
      }
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<datetime_vm>(context, listen: false).setdatetimevalue2(_currentDateCreate);
    });
  }

  final _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<ClientsListBloc>()..add(GetUsersSales(type: ActiveStateEnum.active.name.toString()));
    privilegeCubit = context.read<PrivilegesCubit>();
    iduser = widget.invoiceModel.fkIdUser.toString();
    regoin = widget.invoiceModel.fk_regoin.toString();
    regoininvoice = widget.invoiceModel.fk_regoin_invoice.toString();

    if (widget.invoiceModel.date_approve != null) {
      _currentDateApprove = DateTime.parse(widget.invoiceModel.date_approve.toString());
      Provider.of<datetime_vm>(context, listen: false).setdatetimevalue1(_currentDateApprove!);
    }
    if (widget.invoiceModel.Date_FApprove != null) {
      _currentDateFinance = DateTime.parse(widget.invoiceModel.Date_FApprove.toString());
      Provider.of<datetime_vm>(context, listen: false).setdatetimevalue3(_currentDateFinance!);
    }
    if (widget.invoiceModel.dateCreate != null) {
      _currentDateCreate = DateTime.parse(widget.invoiceModel.dateCreate.toString());
    }

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<datetime_vm>(context, listen: false).setdatetimevalue2(_currentDateCreate);
      Provider.of<datetime_vm>(context, listen: false).setdatetimevalue3(_currentDateFinance!);
      Provider.of<RegionProvider>(context, listen: false)
        ..getRegions()
        ..changeVal(regoin);
      Provider.of<UserProvider>(context, listen: false).changeValUserID(iduser);
    });
    approvingDateController.text = HelperFunctions.formatDate(widget.invoiceModel.date_approve);
    createDateController.text = HelperFunctions.formatDate(widget.invoiceModel.dateCreate);
    approvingDateController.text = HelperFunctions.formatDate(_currentDateApprove!);
    financeDateController.text = HelperFunctions.formatDate(_currentDateFinance!); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'تغيير بيانات الفاتورة', showBackButton: true),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<InvoiceVm>(context, listen: true).isloadingdone,
        child: Directionality(
          textDirection: ii.TextDirection.rtl,
          child: Form(
            key: _globalKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: ListView(
                children: [
                  AppText('الموظف'),
                  5.height,
                  BlocBuilder<ClientsListBloc, ClientsListState>(
                    builder: (context, state) {
                      return Consumer<UserProvider>(
                        builder: (context, cart, child) {
                          return CustomSearchableDropDown<UserModel>(
                            hint: 'الموظف',
                            items: state.usersSales.data ?? [],
                            itemAsString: (u) => u!.userAsString(),
                            onChanged: (data) {
                              iduser = data!.idUser;
                              cart.changeValUserID(data.idUser);
                            },
                            compareFn: (item, selectedItem) => item.id == selectedItem.id,
                            selectedItem: cart.selectedUser,
                            filterFn: (user, filter) => user.getfilteruser(filter),
                          );
                        },
                      );
                    },
                  ),
                  10.height,
                  AppText('الفرع'),
                  5.height,
                  Consumer<RegionProvider>(
                    builder: (context, cart, child) {
                      return CustomDropDown<BranchModel>(
                        hint: 'الفرع',
                        items: cart.listRegionFilter,
                        compareFn: (item, selectedItem) => item.branchId == selectedItem.branchId,
                        itemAsString: (branch) => branch!.branchName,
                        selectedItem: cart.listRegionFilter.firstWhereOrNull(
                          (element) => element.branchId == regoininvoice,
                        ),
                        onChanged: (data) {
                          cart.changeVal(data!.branchId);
                          regoininvoice = data.branchId;
                        },
                      );
                    },
                  ),
                  10.height,
                  AppText('تاريخ عقد الإشتراك'),
                  5.height,
                  CustomDateTimePicker(
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController: createDateController,
                    onDateChange: (dateTime, formattedDate) {
                      _handleCreatingInvoiceDate(context, dateTime);
                    },
                    style2: true,
                  ),
                  10.height,
                  AppText('تاريخ اعتماد الفاتورة'),
                  5.height,
                  CustomDateTimePicker(
                    isRequired: false,
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController: approvingDateController,
                    onDateChange: (dateTime, formattedDate) {
                      _handleApprovingInvoiceDate(context, dateTime);
                    },
                    style2: true,
                  ),
                  10.height,
                  if (privilegeCubit
                              .checkPrivilege('344')  ) ...[
                  AppText('تاريخ اعتماد المالية'),
                  5.height,
                  CustomDateTimePicker(
                    isRequired: false,
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController: financeDateController,
                    onDateChange: (dateTime, formattedDate) {
                      _handleApprovingFinanceInvoiceDate(context, dateTime);
                    },
                    style2: true,
                  ),],
                  10.height,
                  AppSeparatorDotsLine(),
                  20.height,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CardRow(
                        title: 'تاريخ عقد الإشتراك',
                        value: widget.invoiceModel.dateCreate == null
                            ? ""
                            : DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.invoiceModel.dateCreate!.toString()))),
                  ),
                  widget.invoiceModel.date_approve != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: CardRow(
                              title: 'تاريخ اعتماد الفاتورة',
                              value: widget.invoiceModel.date_approve == null
                                  ? ""
                                  : DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.invoiceModel.date_approve!.toString()))),
                        )
                      : Container(),
                  widget.invoiceModel.Date_FApprove != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: CardRow(
                              title: 'تاريخ اعتماد المالية',
                              value: widget.invoiceModel.Date_FApprove == null
                                  ? ""
                                  : DateFormat('yyyy-MM-dd').format(DateTime.parse(widget.invoiceModel.Date_FApprove!.toString()))),
                        )
                      : Container(),
                  widget.invoiceModel.dateinstall_task != null
                      ? CardRow(title: 'تاريخ التركيب', value: widget.invoiceModel.dateinstall_task.toString())
                      : Container(),
                  10.height,
                  AppElevatedButton(
                    text: 'تعديل',
                    width: double.infinity,
                    onPressed: () async {
                      if (_globalKey.currentState!.validate()) {
                        Map<String, dynamic> invoiceData = {
                          'date_create': _currentDateCreate.toString(),
                          'fk_idUser': iduser.toString(),
                          'fk_regoin_invoice': regoininvoice.toString(),

                        };
                        if (_currentDateApprove != null) {
                          invoiceData['date_approve'] = _currentDateApprove.toString();
                        }
                        if (_currentDateFinance != null) {
                          invoiceData['Date_FApprove'] = _currentDateFinance.toString();
                        }
                        Provider.of<InvoiceVm>(context, listen: false).edit_invoice(invoiceData, widget.invoiceModel.idInvoice).then(
                          (value) {
                            if (value) {
                              AppSnackbar.showSnakeBar(
                                " تم التعديل بنجاح",
                                color: ToastColorsEnum.success,
                              );
                              AppNavigator.pop();
                            }
                          },
                        );
                        setState(() {
                          widget.invoiceModel.dateCreate = _currentDateCreate.toString();
                          if (_currentDateApprove != null) {
                            widget.invoiceModel.date_approve = _currentDateApprove.toString();
                          }
                        });
                      }
                      ;
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
