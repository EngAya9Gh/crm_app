import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_status_chip.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../sales/invoices_list/presentation/manager/invoices_section_cubit.dart';
import '../manager/verified_client_bloc.dart';
import '../widgets/insure_transfer_client_dialog.dart';

class VerifiedClientPage extends StatefulWidget {
  const VerifiedClientPage({super.key});

  @override
  State<VerifiedClientPage> createState() => _VerifiedClientPageState();
}

class _VerifiedClientPageState extends State<VerifiedClientPage> {
  late final VerifiedClientBloc _bloc;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = getIt<VerifiedClientBloc>();
    _bloc.add(GetVerifiedClientEvent());
    context.read<InvoicesSectionCubit>().clearFilters();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: AppScaffold(
        appBar: CustomAppBar(
          title: 'عملاء للتوثيق',
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText('عدد العملاء: '),
                      BlocBuilder<VerifiedClientBloc, VerifiedClientState>(
                        builder: (context, state) {
                          return ((state.verifiedClientList.data ?? []).isEmpty)
                              ? SizedBox.shrink()
                              : AppText('${state.verifiedClientList.data?.length ?? ''}/${state.totalCount}');
                        },
                      ),
                    ],
                  )),
              SizedBox(height: 10),
              BlocBuilder<VerifiedClientBloc, VerifiedClientState>(
                builder: (context, state) {
                  if (state.verifiedClientList.isLoading() && state.verifiedClientList.isEmpty()) {
                    return Expanded(child: AppLoader());
                  } else if (state.verifiedClientList.isFailed() && state.verifiedClientList.isEmpty()) {
                    return AppErrorWidget(
                      onPressed: () {
                        _bloc.add(GetVerifiedClientEvent());
                      },
                    );
                  } else if (state.verifiedClientList.isEmpty()) {
                    return AppErrorWidget(message: 'لا توجد فواتير');
                  }
                  return Expanded(
                    child: AppPaginatedList(
                      scrollController: ScrollController(),
                      isLoading: state.verifiedClientList.isLoading(),
                      items: state.verifiedClientList.data ?? [],
                      // hasReachedEnd: _invoicesSectionCubit.hasReachedEnd,
                      onLoadMore: () {
                        // _invoicesSectionCubit.getInvoicesByPrivileges(isNewFilter: false);
                      },
                      itemBuilder: (context, index) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      offset: Offset(1.0, 1.0),
                                      blurRadius: 8.0,
                                      color: Colors.black87.withOpacity(0.2),
                                    ),
                                  ],
                                  borderRadius: BorderRadiusDirectional.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppText(
                                            state.verifiedClientList.data?[index].clientModel.nameRegion,
                                            color: AppColors.primaryMain,
                                            fontSize: 16,
                                          ),
                                          AppText(
                                            state.verifiedClientList.data?[index].clientModel.dateCreate,
                                            color: AppColors.primaryMain,
                                            fontSize: 16,
                                          ),
                                        ],
                                      ),
                                      5.height,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          if (state.verifiedClientList.data?[index].clientModel.idClients != null)
                                            AppText(
                                              "${state.verifiedClientList.data?[index].clientModel.idClients}#  ",
                                              fontFamily: AppFonts.fontFamily1,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.secondaryMain,
                                            ),
                                          Expanded(
                                            child: AppText(
                                              state.verifiedClientList.data?[index].clientModel.nameEnterprise,
                                              fontSize: 18,
                                              fontFamily: AppFonts.fontFamily1,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          AppStatusChip(
                                            status: state.verifiedClientList.data?[index].clientModel.typeClient??'',
                                            color: AppColors.primaryMain,
                                          ),
                                        ],
                                      ),
                                      5.height,
                                      if(state.verifiedClientList.data?[index].clientModel.city?.isNotEmpty??false)Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppText(
                                            'اسم المدينة',
                                            fontSize: 14,
                                            fontFamily: AppFonts.fontFamily1,
                                            color: AppColors.primaryMain,
                                          ),
                                          AppText(
                                            state.verifiedClientList.data?[index].clientModel.city,
                                            fontSize: 14,
                                            fontFamily: AppFonts.fontFamily1,
                                            color: AppColors.primaryMain,
                                          ),
                                        ],
                                      ),
                                      if (state.verifiedClientList.data?[index].lastOperation != null &&
                                          state.verifiedClientList.data?[index].userDidOperation != null) ...{
                                        5.height,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                AppText(
                                                  state.verifiedClientList.data?[index].lastOperation,
                                                  fontFamily: AppFonts.fontFamily1,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                                SizedBox(width: 4),
                                                AppText(
                                                  "(${state.verifiedClientList.data?[index].userDidOperation})",
                                                  fontFamily: AppFonts.fontFamily1,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ],
                                            ),
                                            AppText(
                                              state.verifiedClientList.data?[index].dateLastOperation,
                                              fontFamily: AppFonts.fontFamily1,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            )
                                          ],
                                        ),
                                      },
                                      5.height,
                                      Center(
                                        child: AppElevatedButton(
                                          text: 'ترحيل العميل',
                                          onPressed: () {
                                            AppConstants.showAppDialog(
                                              child: InsureTransferClientDialog(
                                                bloc: _bloc,
                                                clientModel: state.verifiedClientList.data![index],
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox.shrink(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
