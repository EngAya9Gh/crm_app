import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/Card_invoice_client.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/common/client_profile/invoices_tab/presentation/widgets/modern_invoice_card.dart';
import 'package:crm_smart/features/finance/commission_for_collaborators/presentation/widgets/analytics_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../sales/clients/clients_list/presentation/manager/clients_list_bloc.dart';
import '../../../../sales/invoices_list/presentation/manager/invoices_section_cubit.dart';
import '../../domain/use_cases/get_commission_collaborators_usecase.dart';
import '../management/commission_collaborators_bloc.dart';
import '../widgets/filter_commission_ccollaborators_sheet.dart';

class CommissionCollaboratorsPage extends StatefulWidget {
  const CommissionCollaboratorsPage({super.key});

  @override
  State<CommissionCollaboratorsPage> createState() =>
      CommissionCollaboratorsPageState();
}

class CommissionCollaboratorsPageState
    extends State<CommissionCollaboratorsPage> {
  late final CommissionCollaboratorsBloc _bloc;
  late final ClientsListBloc userBloc;
  CommissionCollaboratorsParams params = CommissionCollaboratorsParams();
  final TextEditingController searchController = TextEditingController();
  int nextPage = 2;

  @override
  void initState() {
    super.initState();
    userBloc = context.read<ClientsListBloc>()..add(GetUsersSales());
    _bloc = context.read<CommissionCollaboratorsBloc>()
      ..add(GetCommissionCollaboratorsEvent())
      ..add(GetParticipateSelectEvent());
    context.read<InvoicesSectionCubit>().clearFilters();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'عمولة المتعاونين'),
      backgroundColor: Colors.grey.shade100,
      body: BlocBuilder<CommissionCollaboratorsBloc,
          CommissionCollaboratorsState>(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                10.height,
                Row(
                  children: [
                    Expanded(
                      child: CustomSearchWidget(
                        searchController: searchController,
                        onChanged: (value) {
                          params = CommissionCollaboratorsParams(
                              page: 1, filter: searchController.text);

                          ///after search success form page 1 should increase second page
                          AppConstants.debounceFunction(
                            () => _bloc.add(GetCommissionCollaboratorsEvent(
                              params: params,
                              onSuccess: (value) {
                                nextPage = 2;
                              },
                            )),
                            tag: "search_commission_collaborators_list",
                            isDebounced: true,
                          );
                        },
                      ),
                    ),
                    CustomFilterIcon(
                      onTap: () async {
                        final value = await AppBottomSheet.show(
                          context: context,
                          child: FilterCommissionCollaboratorsSheet(
                            params: params,
                            bloc: _bloc,
                            userBloc: userBloc,
                          ),
                        );
                        if (value != null) {
                          params = value;
                        }
                      },
                    ),
                    8.width,
                  ],
                ),
                10.height,
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
                            value: (state.commissionCollaboratorsResponse.data
                                        ?.totalSale ??
                                    0)
                                .toStringAsFixed(2),
                            text: 'اجمالي المبيعات',
                            icon: Icon(Icons.analytics_outlined,
                                size: 28, color: Colors.black),
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          flex: 3,
                          child: AnalyticsCard(
                            value: (state.commissionCollaboratorsResponse.data
                                        ?.totalPaid ??
                                    0)
                                .toStringAsFixed(2),
                            text: 'اجمالي المدفوعات',
                            icon: Icon(Icons.analytics_outlined,
                                size: 28, color: Colors.black),
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
                            value: (state.commissionCollaboratorsResponse.data
                                        ?.totalDue ??
                                    0)
                                .toStringAsFixed(2),
                            text: 'الاجمالي ',
                            icon: Icon(Icons.analytics_outlined,
                                size: 28, color: Colors.black),
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          flex: 3,
                          child: AnalyticsCard(
                            value: (state.commissionCollaboratorsResponse.data
                                        ?.totalProgram ??
                                    0)
                                .toStringAsFixed(2),
                            text: 'اجمالي البرامج',
                            icon: Icon(Icons.analytics_outlined,
                                size: 28, color: Colors.black),
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
                            value: (state.commissionCollaboratorsResponse.data
                                        ?.totalDevices ??
                                    0)
                                .toStringAsFixed(2),
                            text: 'اجمالي الاجهزة',
                            icon: Icon(Icons.analytics_outlined,
                                size: 28, color: Colors.black),
                          ),
                        ),
                        Spacer(),
                        Spacer(
                          flex: 3,
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
                10.height,
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText('عدد العناصر: '),
                        ((state.commissionCollaboratorsResponse.data
                                        ?.invoiceModel ??
                                    [])
                                .isEmpty)
                            ? SizedBox.shrink()
                            : AppText(
                                '${state.commissionCollaboratorsResponse.data?.invoiceModel?.length ?? ''}/${state.totalCount}'),
                      ],
                    )),
                10.height,
                Expanded(
                  child: state.commissionCollaboratorsResponse.when(
                    success: (data) => AppPaginatedList(
                      scrollController: ScrollController(),
                      isLoading: state.gettingData.isLoading(),
                      items: state.commissionCollaboratorsResponse.data
                              ?.invoiceModel ??
                          [],
                      hasReachedEnd: state.hasReachedMax,
                      onLoadMore: () {
                        params = CommissionCollaboratorsParams(
                            page: nextPage, filter: searchController.text);
                        _bloc.add(GetCommissionCollaboratorsEvent(
                          params: params,
                          onSuccess: (value) {
                            nextPage = value;
                          },
                        ));
                      },
                      itemBuilder: (context, index) {
                        return ModernInvoiceCard(
                          type: 'profile',
                          invoice: state.commissionCollaboratorsResponse.data!
                              .invoiceModel![index],
                          commissionWidget: (state
                                      .commissionCollaboratorsResponse
                                      .data
                                      ?.invoiceModel?[index]
                                      .participateInfo
                                      ?.first
                                      .nameParticipate
                                      ?.isEmpty ??
                                  true)
                              ? SizedBox.shrink()
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      state
                                              .commissionCollaboratorsResponse
                                              .data
                                              ?.invoiceModel?[index]
                                              .participateInfo
                                              ?.first
                                              .nameParticipate ??
                                          '',
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
                                ), routeName: '',
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
