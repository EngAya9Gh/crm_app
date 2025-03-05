import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/features/finance/verified_invoice/presentation/manager/verified_invoice_bloc.dart';
import 'package:crm_smart/features/finance/verified_invoice/presentation/widgets/insure_transfer_inoivce_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/client/client_status_enum.dart';
import '../../../../../core/common/enums/devices_state_enum.dart';
import '../../../../../core/common/enums/seller_type_enum.dart';
import '../../../../../core/common/widgets/Card_invoice_client.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import '../../../../sales/invoices_list/presentation/manager/invoices_section_cubit.dart';
import '../../../../sales/invoices_list/presentation/widgets/filter_invoices_sheet.dart';

class MobVerifiedInvoicesPage extends StatefulWidget {
  const MobVerifiedInvoicesPage({super.key});

  @override
  State<MobVerifiedInvoicesPage> createState() => _MobVerifiedInvoicesPageState();
}

class _MobVerifiedInvoicesPageState extends State<MobVerifiedInvoicesPage> {
  late final VerifiedInvoiceBloc _bloc;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = getIt<VerifiedInvoiceBloc>();
    _bloc.add(GetVerifiedInvoiceEvent());
    context.read<InvoicesSectionCubit>().clearFilters();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: AppScaffold(
        appBar: CustomAppBar(
          title: 'فواتير للتوثيق',
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              SizedBox(height: 10),
              BlocBuilder<VerifiedInvoiceBloc, VerifiedInvoiceState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Expanded(
                        child: CustomSearchWidget(
                          searchController: searchController,
                          hint: 'اسم المؤسسة، رقم الفاتورة...',
                          onChanged: (value) {
                            EasyDebounce.debounce(
                              'get_verified_invoices-debounce',
                              Duration(milliseconds: 500),
                              () => _bloc.add(GetVerifiedInvoiceEvent(
                                addNewFilter: true,
                                  getInvoicesByPrivilegesParams:
                                      (state.getInvoicesByPrivilegesParams ?? GetInvoicesByPrivilegesParams()).copyWith(filter:() =>  value,
                                        fromPage:true ,
                                      ))),
                            );
                          },
                        ),
                      ),
                      CustomFilterIcon(
                        onTap: () {
                          AppBottomSheet.show(
                            context: context,
                            child: FilterInvoicesSheet(
                              onFilter: () {
                                var _blocFilter = context.read<InvoicesSectionCubit>();
                                var params = (state.getInvoicesByPrivilegesParams ?? GetInvoicesByPrivilegesParams()).copyWith(
                                  fromPage:true ,
                                  typeSeller: _blocFilter.filtersEntity.filterInvoicesSellerType.value,
                                  participateFk: _blocFilter.prepareUserId(SellerTypeEnum.collaborator),
                                  fkAgent: _blocFilter.prepareUserId(SellerTypeEnum.agent),
                                  fkIdUser: _blocFilter.prepareUserId(SellerTypeEnum.employee),
                                  fkRegionInvoice: _blocFilter.filtersEntity.filterSelectedRegion.value?.branchId,
                                  from: _blocFilter.filtersEntity.dateFromController.text,
                                  to: _blocFilter.filtersEntity.dateToController.text,
                                  typeReadyClient: _blocFilter.filtersEntity.filterClientStatus.value?.toParam,
                                  invoiceType: () => _blocFilter.filtersEntity.filterInvoiceType.value,
                                  hasDevices: _blocFilter.filtersEntity.filterDeviceState.value?.toParam,
                                );
                                _bloc.add(GetVerifiedInvoiceEvent(
                                  addNewFilter: true,
                                  getInvoicesByPrivilegesParams: params,
                                ));
                                // InvoicesSectionCubit
                                // _cubit.getInvoicesByPrivileges();
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 8),
                    ],
                  );
                },
              ),
              SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText('عدد الفواتير: '),
                      BlocBuilder<VerifiedInvoiceBloc, VerifiedInvoiceState>(
                        builder: (context, state) {
                          return ((state.verifiedInvoiceList.data ?? []).isEmpty)
                              ? SizedBox.shrink()
                              : AppText('${state.verifiedInvoiceList.data?.length ?? ''}/${state.totalCount}');
                        },
                      ),
                    ],
                  )),
              SizedBox(height: 10),
              BlocBuilder<VerifiedInvoiceBloc, VerifiedInvoiceState>(
                builder: (context, state) {
                  if (state.verifiedInvoiceList.isLoading() && state.verifiedInvoiceList.isEmpty()) {
                    return Expanded(child: AppLoader());
                  } else if (state.verifiedInvoiceList.isFailed() && state.verifiedInvoiceList.isEmpty()) {
                    return AppErrorWidget(
                      onPressed: () {
                        _bloc.add(GetVerifiedInvoiceEvent());
                      },
                    );
                  } else if (state.verifiedInvoiceList.isEmpty()) {
                    return AppErrorWidget(message: 'لا توجد فواتير');
                  }
                  return Expanded(
                    child: AppPaginatedList(
                      scrollController: ScrollController(),
                      isLoading: state.gettingData.isLoading(),
                      items: state.verifiedInvoiceList.data ?? [],
                      hasReachedEnd: state.hasReachedMax,
                      onLoadMore: () {
                        if(state.hasReachedMax){
                          return;
                        }
                        _bloc.add(GetVerifiedInvoiceEvent(
                          getInvoicesByPrivilegesParams: (state.getInvoicesByPrivilegesParams ?? GetInvoicesByPrivilegesParams()).copyWith(
                            fromPage:true ,
                            page: ((state.getInvoicesByPrivilegesParams?.page??1)+1),
                          ),
                        ));
                      },
                      itemBuilder: (context, index) {
                        return CardInvoiceClient(
                          type: 'profile',
                          invoice: state.verifiedInvoiceList.data![index],
                          transferWidget: Column(

                            children: [
                              AppElevatedButton(
                                text: 'ترحيل الفاتورة',
                                onPressed: () {
                                  AppConstants.showAppDialog(
                                    child: InsureTransferInoivceDialog(
                                      bloc: _bloc,
                                      invoiceModel: state.verifiedInvoiceList.data![index],
                                    ),
                                  );
                                },
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
