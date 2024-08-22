import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../core/common/widgets/custom_paginated_list.dart';
import '../../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/responsive_padding.dart';
import '../../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../../app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import '../../../../../common/cities/presentation/manager/cities_cubit.dart';
import '../../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../manager/participate_list_bloc.dart';
import '../manager/participate_list_event.dart';
import '../manager/participate_list_state.dart';
import '../widgets/participate_card.dart';
import '../widgets/participates_filter_sheet.dart';
import 'action_participate_page.dart';

class ParticipateListPage extends StatefulWidget {
  const ParticipateListPage({Key? key}) : super(key: key);

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
      appBar: SmartCrmAppBar(
        appBarParams: AppBarParams(
          title: 'المتعاونين',
          action: [
            if (context.read<PrivilegeCubit>().checkPrivilege('201')) ...[
              AppTextButton(
                text: "إضافة متعاون",
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
              ),
            ],
          ],
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
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
            10.verticalSpace,
            BlocBuilder<ParticipateListBloc, ParticipateListState>(
              buildWhen: (previous, current) {
                return _participateListBloc.isNewFetch;
              },
              builder: (context, state) {
                if (state.getParticipatesState.isLoading()) {
                  return AppLoader();
                } else if (state.getParticipatesState.isFailed()) {
                  return CustomErrorWidget(
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
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: BlocBuilder<ParticipateListBloc,
                                  ParticipateListState>(
                                builder: (context, state) {
                                  return CustomPaginatedList(
                                    items: _allParticipates,
                                    onLoadMore: () {
                                      _participateListBloc.add(
                                        GetParticipateListEvent(
                                            isNewFetch: false),
                                      );
                                    },
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ParticipateCard(
                                          participate: _allParticipates[index]);
                                    },
                                    isLoading:
                                        state.getParticipatesState.isLoading(),
                                    hasReachedMax:
                                        _participateListBloc.hasReachedMax,
                                    scrollController: ScrollController(),
                                  );
                                },
                              ),
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
