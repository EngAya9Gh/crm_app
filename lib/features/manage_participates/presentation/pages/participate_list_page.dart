import 'package:crm_smart/core/common/models/page_state/page_state.dart';
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

  late TextEditingController _searchTextField;

  @override
  void initState() {
    _searchTextField = TextEditingController()..addListener(onSearch);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _participateListBloc = context.read<ParticipateListBloc>()
        ..add(GetParticipateListEvent(
            // fkCountry!,
            query: _searchTextField.text));
    });

    super.initState();
  }

  @override
  void dispose() {
    _searchTextField
      ..removeListener(onSearch)
      ..dispose();
    super.dispose();
  }

  void onSearch() {
    print("search");
    _participateListBloc.add(SearchEvent(_searchTextField.text));
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
                  builder: (BuildContext context) => ActionParticipate(),
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
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          )),
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 2, left: 8, right: 8, bottom: 2),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              controller: _searchTextField,
                              textInputAction: TextInputAction.search,
                              decoration: InputDecoration(
                                hintText:
                                    "اسم المتعاون, رقم الموبايل للمتعاون.....",
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
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
                            _participateListBloc.add(GetParticipateListEvent(
                                // fkCountry!,
                                query: _searchTextField.text)),
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
}
