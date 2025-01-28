import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/features/finance/verified_client/presentation/pages/verified_client_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../sales/invoices_list/presentation/manager/invoices_section_cubit.dart';
import '../manager/verified_client_bloc.dart';

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
                        if (state.hasReachedMax) {
                          return;
                        }
                        _bloc.add(GetVerifiedClientEvent(
                            getInvoicesByPrivilegesParams:
                                state.getInvoicesByPrivilegesParams?.copyWith(skip: (state.getInvoicesByPrivilegesParams?.skip ?? -1) + 1)));
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
                      // hasReachedEnd: ,
                      onLoadMore: () {
                        _bloc.add(GetVerifiedClientEvent());
                      },
                      itemBuilder: (context, index) {
                        return VerifiedClientCard(verifiedClientModel: state.verifiedClientList.data![index]);
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
