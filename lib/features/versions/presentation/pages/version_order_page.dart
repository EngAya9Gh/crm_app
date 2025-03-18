import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:crm_smart/core/common/widgets/app_status_chip.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/app_fonts.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/versions/data/models/demand_model.dart';
import 'package:crm_smart/features/versions/presentation/manager/versions_bloc.dart';
import 'package:crm_smart/features/versions/presentation/widgets/demand_card.dart';
import 'package:crm_smart/features/versions/presentation/widgets/order_new_version_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' hide TextDirection;
import '../../../../../core/common/widgets/custom_app_bar.dart';

class VersionOrderPage extends StatefulWidget {
  const VersionOrderPage({super.key});

  @override
  State<VersionOrderPage> createState() => _VersionOrderPageState();
}

class _VersionOrderPageState extends State<VersionOrderPage> {
  late final VersionsBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<VersionsBloc>();
    _bloc.add(GetDenmadsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'طلبات التحديثات', showBackButton: true),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryMain,
        onPressed: () {
          AppConstants.showAppDialog(
            child: OrderNewVersionDialog(),
          ).then(
            (value) {
              if (value) _bloc.add(GetDenmadsEvent());
            },
          );
        },
        child: Icon(
          Icons.add_circle_outline_sharp,
          color: AppColors.white,
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<VersionsBloc, VersionsState>(
          builder: (context, state) {
            return AppPaginatedList(
              items: state.getDemands.data ?? [],
              itemBuilder: (context, index) {
                var status = (DemandVersion.values.firstWhereOrNull(
                      (element) => element.text == state.getDemands.data?[index].status,
                    ) ??
                    DemandVersion.review);
                var item = state.getDemands.data![index];
                return demandCardWidget(status: status, item: item);
              },
              isLoading: state.getDemands.isLoading(),
              hasReachedEnd: true,
              onLoadMore: () {},
            );
          },
        ),
      ),
    );
  }
}
