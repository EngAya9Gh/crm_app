import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/core/common/widgets/app_dialog.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/features/finance/client_dept/data/models/client_dept.dart';
import 'package:crm_smart/features/finance/client_dept/presentation/management/client_dept_bloc.dart';
import 'package:crm_smart/features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' hide TextDirection;
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/helpers/number_formatter.dart';
import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/app_status_chip.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../ui/widgets/custom_widget/card_expansion.dart';
import '../../../../../ui/widgets/custom_widget/card_row.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../../sales/invoices_list/presentation/manager/invoices_section_cubit.dart';
import 'package:collection/collection.dart';

import '../../domain/use_cases/report_client_dept_usecase.dart';

class ClientDeptPage extends StatefulWidget {
  const ClientDeptPage({super.key});

  @override
  State<ClientDeptPage> createState() => ClientDeptPageState();
}

class ClientDeptPageState extends State<ClientDeptPage> {
  late final ClientDeptBloc _bloc;

  final TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController amountController = TextEditingController();
  final ValueNotifier<String?> amountNotifier = ValueNotifier('');

  @override
  void initState() {
    super.initState();
    _bloc = context.read<ClientDeptBloc>()..add(GetClientDeptEvents());
    context.read<InvoicesSectionCubit>().clearFilters();
  }

  @override
  void deactivate() {
    _bloc.add(ResetFilterEvent());

    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'مدوينية العملاء'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            10.height,
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText('عدد العناصر: '),
                    BlocBuilder<ClientDeptBloc, ClientDeptState>(
                      builder: (context, state) {
                        return ((state.getClientDeptList.data ?? []).isEmpty)
                            ? SizedBox.shrink()
                            : AppText('${state.getClientDeptList.data?.length ?? ''}/${state.totalCount}');
                      },
                    ),
                  ],
                )),
            10.height,
            Expanded(
              child: BlocBuilder<ClientDeptBloc, ClientDeptState>(
                builder: (context, state) => state.getClientDeptList.when(
                  success: (data) => AppPaginatedList(
                    scrollController: ScrollController(),
                    items: state.getClientDeptList.data ?? [],
                    hasReachedEnd: state.hasReachedMax,
                    onLoadMore: () {
                      if (state.hasReachedMax) {
                        return;
                      }
                      _bloc.add(GetClientDeptEvents(
                          getInvoicesByPrivilegesParams: (state.getInvoicesByPrivilegesParams ?? GetInvoicesByPrivilegesParams())
                              .copyWith(skip: (state.getInvoicesByPrivilegesParams?.skip ?? 1) + 1)));
                    },
                    itemBuilder: (context, index) {
                      return buildcardExpansion(
                          '',
                          '',
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                ...((data?[index].payments ?? []))
                                    .mapIndexed(
                                      (i, element) => Column(
                                        children: [
                                          CardRow(
                                            title: 'رقم الفاتورة',
                                            value: '${element.fkInvoice}',
                                            withDivider: false,
                                            valueFontColor: AppColors.primaryMain,
                                          ),
                                          CardRow(
                                            title: 'قيمة الدفعة',
                                            value: '${element.amountPaid}',
                                            withDivider: false,
                                            valueFontColor: AppColors.primaryMain,
                                          ),
                                          CardRow(
                                            title: 'تاريخ الدفعة',
                                            value: '${DateFormat('yyyy-MM-dd').format(element.dateUpdatePayment!)}',
                                            withDivider: false,
                                            valueFontColor: AppColors.primaryMain,
                                          ),
                                          CardRow(
                                            title: 'اسم من قام بالدفعة',
                                            value: '${element.nameUser}',
                                            withDivider: false,
                                            valueFontColor: AppColors.primaryMain,
                                          ),
                                          Divider(),
                                        ],
                                      ),
                                    )
                                    .toList(),
                                AppElevatedButton(
                                  text: 'مصادقة من العميل',
                                  onPressed: () {
                                    AppConstants.showAppDialog(
                                        child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: AppDialog(
                                        title: 'مصادقة',
                                        children: [
                                          Form(
                                            key: _formKey,
                                            child: AppTextField(
                                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                              inputType: TextInputType.number,
                                              hintText: 'المبلغ',
                                              controller: amountController,
                                              onChange: (val) {
                                                amountNotifier.value = val;
                                              },
                                              validator: InputValidator.requiredFiled,
                                            ),
                                          ),
                                          AppText('الرسالة التي ستظهر للعميل : '),
                                          10.height,
                                          ValueListenableBuilder(
                                            valueListenable: amountNotifier,
                                            builder: (context, value, child) => RichText(
                                              text: TextSpan(
                                                  text: 'تم استلام دفعة لصالح شركة سمارت لايف بقيمة',
                                                  style: AppStyles.textStyle.copyWith(),
                                                  children: [
                                                    TextSpan(text: value, style: AppStyles.textStyle.copyWith(color: AppColors.primaryMain)),
                                                    TextSpan(text: ' يرجى التواصل في حال اي خلاف بالمبلغ المذكور'),
                                                  ]),
                                            ),
                                          ),
                                          if (context.read<PrivilegesCubit>().checkPrivilege('319'))
                                            BlocBuilder<ClientDeptBloc, ClientDeptState>(
                                              builder: (context, state) {
                                                return AppElevatedButton(
                                                  isLoading: state.reportPayoutClientStatus.isLoading(),
                                                  text: 'تأكيد',
                                                  onPressed: () {
                                                    if (_formKey.currentState!.validate()) {
                                                      context.read<ClientDeptBloc>().add(ReportPayoutClientDeptEvents(
                                                            params: ReportClientParams(
                                                                clientId: data![index].idClients!, amount: double.parse(amountNotifier.value ?? '0')),
                                                            onSuccess: () {
                                                              context.pop();
                                                              AppSnackbar.showSnakeBar('تم المصادقة بنجاح');
                                                            },
                                                          ));
                                                    }
                                                  },
                                                );
                                              },
                                            ),
                                          10.height,
                                          AppElevatedButton(
                                            text: 'رجوع',
                                            onPressed: () {
                                              context.pop();
                                            },
                                          ),
                                        ],
                                      ),
                                    ));
                                  },
                                )
                              ],
                            ),
                          ),
                          subTitleWidget: Column(
                            children: [
                              10.height,
                              CardRow(
                                title: 'المبلغ الكلي',
                                value: formatNumber(data?[index].totalInvoices),
                                withDivider: false,
                              ),
                              5.height,
                              CardRow(
                                title: 'المبلغ المدفوع',
                                value: formatNumber(data?[index].totalPaid),
                                withDivider: false,
                              ),
                              5.height,
                              CardRow(
                                title: 'المبلغ المتبقي',
                                value: formatNumber(data?[index].remaining),
                                withDivider: false,
                                valueFontColor: AppColors.primaryMain,
                              ),
                            ],
                          ),
                          titleWidget: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              AppText(data?[index].nameEnterprise),
                              PositionedDirectional(
                                  end: -50,
                                  child: AppStatusChip(
                                    status: data?[index].nameRegoin ?? '',
                                    color: AppColors.primaryMain,
                                    fontSize: 13,
                                  )),
                            ],
                          ));
                    },
                    separatorBuilder: (_, __) => const SizedBox.shrink(),
                  ),
                  failure: (error, data) => AppErrorWidget(
                    message: error,
                    onPressed: () {
                      // _bloc.add(GetPackagesOffersEvent());
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
