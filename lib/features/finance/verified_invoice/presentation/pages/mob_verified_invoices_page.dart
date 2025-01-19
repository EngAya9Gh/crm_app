import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/features/finance/verified_invoice/presentation/manager/verified_invoice_bloc.dart';
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
import '../../../../../core/utils/app_constants.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';

class MobClientsInvoicesPage extends StatefulWidget {
  const MobClientsInvoicesPage({super.key});

  @override
  State<MobClientsInvoicesPage> createState() => _MobClientsInvoicesPageState();
}

class _MobClientsInvoicesPageState extends State<MobClientsInvoicesPage> {
  late final VerifiedInvoiceBloc _bloc;

  // late final PrivilegesCubit _privilegeCubit;
  //
  @override
  void initState() {
    super.initState();
    _bloc = getIt<VerifiedInvoiceBloc>();
    _bloc.add(GetVerifiedInvoiceEvent());
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
}
