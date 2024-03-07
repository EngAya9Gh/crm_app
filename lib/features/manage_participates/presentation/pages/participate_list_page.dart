import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:crm_smart/core/common/manager/cities_cubit/cities_cubit.dart';
import 'package:crm_smart/core/common/models/page_state/page_state.dart';
import 'package:crm_smart/core/common/widgets/cities_drop_down_widget.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_bloc.dart';
import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_event.dart';
import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_state.dart';
import 'package:crm_smart/features/manage_participates/presentation/pages/action_participate_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/responsive_padding.dart';
import '../../../app/presentation/widgets/app_text_button.dart';
import '../widgets/participate_card.dart';

class ParticipateListPage extends StatefulWidget {
  const ParticipateListPage({Key? key}) : super(key: key);

  @override
  State<ParticipateListPage> createState() => _ParticipateListPageState();
}

class _ParticipateListPageState extends State<ParticipateListPage> {
  late ParticipateListBloc _participateListBloc;

  @override
  void initState() {
    _participateListBloc = context.read<ParticipateListBloc>();
    context.read<CitiesCubit>()
      ..getAllCity(fkCountry: AppConstants.currentCountry(context) ?? '')
      ..selectedCity = null;
    _participateListBloc.searchTextField.clear();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _participateListBloc.add(GetParticipateListEvent());
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
      )),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<ParticipateListBloc, ParticipateListState>(
          builder: (context, state) {
            return state.particiPateListState.when(
              init: () => Center(child: CircularProgressIndicator()),
              loading: () => Center(child: CircularProgressIndicator()),
              loaded: (data) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextField(
                              controller: _participateListBloc.searchTextField,
                              textInputAction: TextInputAction.search,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                hintText: "اسم المتعاون, رقم الموبايل.....",
                                hintStyle:
                                    context.textTheme.titleSmall?.copyWith(
                                  color: Colors.grey.shade600,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.zero,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                              onChanged: (value) {
                                _filterParticipates(context);
                              },
                            ),
                          ),
                          10.width,
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.32,
                            child: CitiesDropDownWidget(
                              icon: Icons.filter_list_sharp,
                              onSelected: () {
                                _filterParticipates(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    Padding(
                      padding: HWEdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText("عدد المتعاونين"),
                          AppText(data.length.toString()),
                        ],
                      ),
                    ),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async =>
                            _participateListBloc.add(GetParticipateListEvent()),
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          itemBuilder: (BuildContext context, int index) =>
                              ParticipateCard(
                                  participate:
                                      state.particiPateListState.data[index]),
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(height: 10),
                          itemCount: state.particiPateListState.data.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              empty: () => Text("Empty communications"),
              error: (exception) => Text("Exception"),
            );
          },
        ),
      ),
    );
  }

  void _filterParticipates(BuildContext context) {
    _participateListBloc
      ..add(FilterEvent())
      ..selectedCity = context.read<CitiesCubit>().selectedCity;
  }
}
