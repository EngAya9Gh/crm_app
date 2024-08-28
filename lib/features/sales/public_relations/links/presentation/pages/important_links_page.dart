import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../../core/services/di/di_container.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../../app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import '../manager/important_links_cubit.dart';
import 'action_link_page.dart';
import 'important_links_paginated_list.dart';

class ImportantLinksPage extends StatefulWidget {
  const ImportantLinksPage({super.key});

  @override
  State<ImportantLinksPage> createState() => _ImportantLinksPageState();
}

class _ImportantLinksPageState extends State<ImportantLinksPage> {
  late ImportantLinksCubit _cubit;
  String clause = '';
  String department = '';

  @override
  void initState() {
    _cubit = getIt<ImportantLinksCubit>()..getImportantLinks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: AppScaffold(
        appBar: SmartCrmAppBar(
            appBarParams: AppBarParams(title: "الروابط الهامة", action: [
          AppTextButton(
            text: "إضافة",
            onPressed: () async {
              await AppNavigator.push(
                BlocProvider.value(
                  value: _cubit,
                  child: ActionLinkPage(),
                ),
              );
              _cubit.getImportantLinks();
            },
            appButtonStyle: AppButtonStyle.secondary,
          ),
        ])),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              CustomSearchWidget(
                searchController: _cubit.pageVariables.searchController,
                onChanged: (value) {
                  _cubit.pageVariables.searchController.text = value;
                  _cubit.getImportantLinks(isDebounced: true);
                },
              ),
              10.height,
              Expanded(
                child: BlocBuilder<ImportantLinksCubit, ImportantLinksState>(
                  buildWhen: (previous, current) =>
                      previous.getImportantLinksStatus !=
                          current.getImportantLinksStatus &&
                      _cubit.pageVariables.isNewFilter,
                  builder: (context, state) {
                    return state.getImportantLinksStatus.when(
                      success: (data) {
                        return ImportantLinksPaginatedList();
                      },
                      failure: (error, data) {
                        return AppErrorWidget(
                          message: error,
                          onPressed: () => _cubit.getImportantLinks(),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
