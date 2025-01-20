import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/features/finance/verified_invoice/presentation/manager/verified_invoice_bloc.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/common/widgets/Card_invoice_client.dart';
import '../../../../../core/common/widgets/app_dialog.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import '../../../../sales/invoices_list/presentation/manager/invoices_section_cubit.dart';
import '../../../../sales/invoices_list/presentation/widgets/filter_invoices_sheet.dart';

import '../../../../../core/common/enums/client/client_status_enum.dart';
import '../../../../../core/common/enums/devices_state_enum.dart';
import '../../../../../core/common/enums/seller_type_enum.dart';

class VerifiedInvoicesPage extends StatefulWidget {
  const VerifiedInvoicesPage({super.key});

  @override
  State<VerifiedInvoicesPage> createState() => _VerifiedInvoicesPageState();
}

class _VerifiedInvoicesPageState extends State<VerifiedInvoicesPage> {
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
          title: 'فواتير بحاجة توثيق',
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
                                  getInvoicesByPrivilegesParams:
                                      (state.getInvoicesByPrivilegesParams ?? GetInvoicesByPrivilegesParams()).copyWith(searchQuery: value))),
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
                                  skip: state.verifiedInvoiceList.data?.length,
                                  typeSeller: _blocFilter.filtersEntity.filterInvoicesSellerType.value,
                                  participateFk: _blocFilter.prepareUserId(SellerTypeEnum.collaborator),
                                  fkAgent: _blocFilter.prepareUserId(SellerTypeEnum.agent),
                                  fkIdUser: _blocFilter.prepareUserId(SellerTypeEnum.employee),
                                  fkRegionInvoice: _blocFilter.filtersEntity.filterSelectedRegion.value?.branchId,
                                  from: _blocFilter.filtersEntity.dateFromController.text,
                                  to: _blocFilter.filtersEntity.dateToController.text,
                                  typeReadyClient: _blocFilter.filtersEntity.filterClientStatus.value?.toParam,
                                  invoiceType: () => _blocFilter.filtersEntity.filterInvoiceType.value?.value,
                                  hasDevices: _blocFilter.filtersEntity.filterDeviceState.value?.toParam,
                                );
                                _bloc.add(GetVerifiedInvoiceEvent(
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
                      isLoading: state.verifiedInvoiceList.isLoading(),
                      items: state.verifiedInvoiceList.data ?? [],
                      // hasReachedEnd: _invoicesSectionCubit.hasReachedEnd,
                      onLoadMore: () {
                        // _invoicesSectionCubit.getInvoicesByPrivileges(isNewFilter: false);
                      },
                      itemBuilder: (context, index) {
                        return CardInvoiceClient(
                          type: 'profile',
                          invoice: state.verifiedInvoiceList.data![index],
                          transferWidget: Center(
                            child: AppTextButton(
                              text: 'ترحيل الفاتورة',
                              onPressed: () {
                                AppConstants.showAppDialog(
                                  child: AppDialog(
                                    title: 'ترحيل الفاتورة',
                                    children: [
                                      20.height,
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          BlocBuilder<VerifiedInvoiceBloc, VerifiedInvoiceState>(
                                            bloc: _bloc,
                                            builder: (context, state) {
                                              return AppElevatedButton(
                                                isLoading: state.verifiedInvoiceList.isLoading(),
                                                text: 'تأكيد',
                                                onPressed: () {
                                                  _bloc
                                                    ..add(ChangeStatusVerifiedInvoiceEvent(invoiceModel: state.verifiedInvoiceList.data![index]))
                                                    ..add(GetVerifiedInvoiceEvent());
                                                  context.pop();
                                                },
                                              );
                                            },
                                          ),
                                          20.height,
                                          AppElevatedButton(
                                              text: 'رجوع',
                                              onPressed: () {
                                                context.pop();
                                              }),
                                        ],
                                      ),
                                      5.height,
                                    ],
                                  ),
                                );
                              },
                            ),
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

  String? _prepareUserId(SellerTypeEnum sellerType) {
    var _blocFilter = context.read<InvoicesSectionCubit>();

    if (sellerType == _blocFilter.filtersEntity.filterInvoicesSellerType.value) {
      return _blocFilter.filtersEntity.filterSelectedUser.value?.id;
    }
    if (sellerType.isAgent() && (_blocFilter.filtersEntity.filterInvoicesSellerType.value?.isDistributor() ?? false)) {
      return _blocFilter.filtersEntity.filterSelectedUser.value?.id;
    }

    return '';
  }
}
