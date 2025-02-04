import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/Card_invoice_client.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/finance/commission_for_collaborators/presentation/pages/analytics_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../sales/invoices_list/presentation/manager/invoices_section_cubit.dart';
import '../../domain/use_cases/get_commission_collaborators_usecase.dart';
import '../management/commission_collaborators_bloc.dart';

class CommissionCollaboratorsPage extends StatefulWidget {
  const CommissionCollaboratorsPage({super.key});

  @override
  State<CommissionCollaboratorsPage> createState() => CommissionCollaboratorsPageState();
}

class CommissionCollaboratorsPageState extends State<CommissionCollaboratorsPage> {
  late final CommissionCollaboratorsBloc _bloc;

  final TextEditingController searchController = TextEditingController();
  int currentPage = 2;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<CommissionCollaboratorsBloc>()..add(GetCommissionCollaboratorsEvent());
    context.read<InvoicesSectionCubit>().clearFilters();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'عمولة المشاركين'),
      backgroundColor: Colors.grey.shade100,
      body: BlocBuilder<CommissionCollaboratorsBloc, CommissionCollaboratorsState>(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                10.height,
                CustomSearchWidget(
                  searchController: searchController,
                  onChanged: (value) {
                    AppConstants.debounceFunction(
                      () => _bloc.add(GetCommissionCollaboratorsEvent(
                        params: CommissionCollaboratorsParams(page: 1, filter: searchController.text),
                        onSuccess: (value) {
                          currentPage = 2;
                        },
                      )),
                      tag: "search_commission_collaborators_list",
                      isDebounced: true,
                    );
                  },
                ),
                10.height,
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText('عدد العناصر: '),
                        ((state.commissionCollaboratorsResponse.data?.invoiceModel ?? []).isEmpty)
                            ? SizedBox.shrink()
                            : AppText('${state.commissionCollaboratorsResponse.data?.invoiceModel?.length ?? ''}/${state.totalCount}'),
                      ],
                    )),
                ExpansionTile(
                  title: AppText('اضهار الاحصائيات'),
                  children: [
                    10.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Spacer(),
                        Expanded(
                          flex: 3,
                          child: AnalyticsCard(
                            value: (state.commissionCollaboratorsResponse.data?.totalSale ?? 0).toStringAsFixed(2),
                            text: 'اجمالي المبيعات',
                            icon: Icon(Icons.analytics_outlined, size: 28, color: Colors.black),
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          flex: 3,
                          child: AnalyticsCard(
                            value: (state.commissionCollaboratorsResponse.data?.totalPaid ?? 0).toStringAsFixed(2),
                            text: 'اجمالي المدفوعات',
                            icon: Icon(Icons.analytics_outlined, size: 28, color: Colors.black),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    10.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Spacer(),
                        Expanded(
                          flex: 3,
                          child: AnalyticsCard(
                            value: (state.commissionCollaboratorsResponse.data?.totalDue ?? 0).toStringAsFixed(2),
                            text: 'اجمالي ',
                            icon: Icon(Icons.analytics_outlined, size: 28, color: Colors.black),
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          flex: 3,
                          child: AnalyticsCard(
                            value: (state.commissionCollaboratorsResponse.data?.totalProgram ?? 0).toStringAsFixed(2),
                            text: 'اجمالي البرامج',
                            icon: Icon(Icons.analytics_outlined, size: 28, color: Colors.black),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    10.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Spacer(),
                        Expanded(
                          flex: 3,
                          child: AnalyticsCard(
                            value: (state.commissionCollaboratorsResponse.data?.totalDevices ?? 0).toStringAsFixed(2),
                            text: 'اجمالي الاجهزة',
                            icon: Icon(Icons.analytics_outlined, size: 28, color: Colors.black),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
                10.height,
                Expanded(
                  child: state.commissionCollaboratorsResponse.when(
                    success: (data) => AppPaginatedList(
                      scrollController: ScrollController(),
                      items: state.commissionCollaboratorsResponse.data?.invoiceModel ?? [],
                      hasReachedEnd: state.hasReachedMax,
                      onLoadMore: () {
                        _bloc.add(GetCommissionCollaboratorsEvent(
                          params: CommissionCollaboratorsParams(page: currentPage, filter: searchController.text),
                          onSuccess: (value) {
                            currentPage = value;
                          },
                        ));
                      },
                      itemBuilder: (context, index) {
                        return CardInvoiceClient(
                          type: 'profile',
                          invoice: state.commissionCollaboratorsResponse.data!.invoiceModel![index],
                          commissionWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                state.commissionCollaboratorsResponse.data!.invoiceModel![index].participateInfo?.first.nameParticipate,
                                fontFamily: AppFonts.fontFamily1,
                                color: AppColors.primaryMain,
                                fontSize: 14,
                              ),
                              SizedBox(width: 4),
                              AppText(
                                "${state.commissionCollaboratorsResponse.data!.invoiceModel![index].rate_participate ?? ''}",
                                fontFamily: AppFonts.fontFamily1,
                                color: AppColors.primaryMain,
                                fontSize: 14,
                              ),
                            ],
                          ),
                        );
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
              ],
            ),
          );
        },
      ),
    );
  }
}
