import 'package:crm_smart/features/clients_care/evaluation_across_system/domain/use_cases/get_elevation_sys_support_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/sys_support_rating_bloc.dart';
import '../widgets/card_elevation_sys_support.dart';
import '../widgets/switch_communication_type.dart';

class SysSupportRatingPage extends StatefulWidget {
  const SysSupportRatingPage({super.key});

  @override
  State<SysSupportRatingPage> createState() =>
      _PeriodicCommunicationState();
}

class _PeriodicCommunicationState extends State<SysSupportRatingPage> {
  late final SysSupportRatingBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<SysSupportRatingBloc>()
      ..add(GetListSysOrSupportRatingEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'تقييمات النظام'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            15.height,
            Row(
              children: [
                Expanded(
                  child: CustomSearchWidget(
                    searchController: TextEditingController(),
                    onChanged: (value) {},
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    final value = await AppBottomSheet.show(
                      context: context,
                      child: FilterElevationSysSupportSheet(),
                    );
                    // if (value != true) {
                    //   _cubit.returnToPreviousState();
                    // }
                  },
                ),
                8.width,
              ],
            ),
            15.height,
            SwitchElevationType(),
            15.height,
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   child: CountPaginatedList<SysSupportRatingBloc,
            //       SysSupportRatingState>(
            //     countSelector: (state) {
            //       return _cubit.pageVariables.allList.length;
            //     },
            //     totalCount: (state) {
            //       return _cubit.pageVariables.totalCount;
            //     },
            //   ),
            // ),
            Expanded(
              child: BlocBuilder<SysSupportRatingBloc,
                  SysSupportRatingState>(
                buildWhen: (previous, current) {
                  return previous.listRating != current.listRating;
                },
                builder: (context, state) {
                  return state.listRating.when(
                    success: (data) =>
                        ListView.builder(
                          itemBuilder: (context, index) => ElevationSysOrSupportCard(elevationModel: data![index], tabElevationIndex: 1),
                          itemCount: data?.length ?? 0,),
                    failure: (error, data) =>
                        AppErrorWidget(
                          message: error,
                          onPressed: () {},
                        ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
