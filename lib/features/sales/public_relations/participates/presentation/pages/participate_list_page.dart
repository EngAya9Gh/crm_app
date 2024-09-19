import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/responsive_padding.dart';
import '../../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../../common/cities/presentation/manager/cities_cubit.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/participate_list_bloc.dart';
import '../manager/participate_list_event.dart';
import '../manager/participate_list_state.dart';
import '../widgets/participate_card.dart';
import '../widgets/participates_filter_sheet.dart';
import 'action_participate_page.dart';

class ParticipateListPage extends StatefulWidget {
  const ParticipateListPage({super.key});

  @override
  State<ParticipateListPage> createState() => _ParticipateListPageState();
}

class _ParticipateListPageState extends State<ParticipateListPage> {
  late ParticipateListBloc _participateListBloc;

  @override
  void initState() {
    _participateListBloc = context.read<ParticipateListBloc>()..clear();
    context.read<CitiesCubit>()
      ..getAllCity(fkCountry: AppConstants.currentCountry)
      ..selectedCity = null;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _participateListBloc.add(GetParticipateListEvent(isNewFetch: true));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'المتعاونين',
        actions: [
          if (context.read<PrivilegesCubit>().checkPrivilege('201')) ...[
            Directionality(
              textDirection: TextDirection.rtl,
              child: AppTextButton(
                text: "إضافة\nمتعاون",
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute<void>(
                      builder: (BuildContext context) {
                        context.read<CitiesCubit>().selectedCity = null;
                        return ActionParticipate();
                      },
                      fullscreenDialog: true,
                    ),
                  );
                },
                appButtonStyle: AppButtonStyle.secondary,
                textStyle: AppStyles.textStyle.copyWith(
                  fontSize: (16.0).scaleFontSize,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            10.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: CustomSearchWidget(
                      hint: "اسم المتعاون, رقم الموبايل.....",
                      searchController: _participateListBloc.searchTextField,
                      onChanged: (value) {
                        EasyDebounce.debounce(
                          'searchParticipates',
                          Duration(milliseconds: 500),
                          () => _filterParticipates(context),
                        );
                      },
                    ),
                  ),
                  CustomFilterIcon(
                    onTap: () async {
                      final value = await AppBottomSheet.show(
                        context: context,
                        child: ParticipatesFilterSheet(
                          onFilter: () => _filterParticipates(context),
                        ),
                      );
                      if (value != true) {
                        _participateListBloc.loadPreviousState();
                      }
                    },
                  ),
                ],
              ),
            ),
            10.height,
            BlocBuilder<ParticipateListBloc, ParticipateListState>(
              buildWhen: (previous, current) {
                return _participateListBloc.isNewFetch;
              },
              builder: (context, state) {
                if (state.getParticipatesState.isLoading()) {
                  return AppLoader();
                } else if (state.getParticipatesState.isFailed()) {
                  return AppErrorWidget(
                    onPressed: () {
                      _participateListBloc.add(
                        GetParticipateListEvent(isNewFetch: true),
                      );
                    },
                  );
                } else if (_participateListBloc.countAllParticipates == 0) {
                  return Text("لا يوجد نتائج");
                }
                return Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: HWEdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText("عدد المتعاونين"),
                            BlocBuilder<ParticipateListBloc,
                                ParticipateListState>(
                              builder: (context, state) {
                                return AppText(
                                    "${_participateListBloc.allParticipates.length}/${_participateListBloc.countAllParticipates}");
                              },
                            ),
                          ],
                        ),
                      ),
                      10.verticalSpace,
                      Expanded(
                        child: BlocBuilder<ParticipateListBloc,
                            ParticipateListState>(
                          builder: (context, state) {
                            final _allParticipates =
                                _participateListBloc.allParticipates;
                            return BlocBuilder<ParticipateListBloc,
                                ParticipateListState>(
                              builder: (context, state) {
                                return AppPaginatedList(
                                  items: _allParticipates,
                                  onLoadMore: () {
                                    _participateListBloc.add(
                                      GetParticipateListEvent(
                                        isNewFetch: false,
                                      ),
                                    );
                                  },
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ParticipateCard(
                                      participate: _allParticipates[index],
                                    );
                                  },
                                  isLoading:
                                      state.getParticipatesState.isLoading(),
                                  hasReachedEnd:
                                      _participateListBloc.hasReachedMax,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _filterParticipates(BuildContext context) {
    _participateListBloc.add(GetParticipateListEvent(isNewFetch: true));
  }
}
