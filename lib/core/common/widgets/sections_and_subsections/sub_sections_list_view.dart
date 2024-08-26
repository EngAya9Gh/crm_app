import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../models/sections/section_model.dart';
import 'sections_card_for_list.dart';

class SubSectionsListView extends StatefulWidget {
  const SubSectionsListView({
    super.key,
    required this.title,
    required this.subSections,
    this.onInit,
  });

  final String title;
  final List<SectionModel> subSections;
  final Future<void> Function(BuildContext)? onInit;

  @override
  State<SubSectionsListView> createState() => _SubSectionsListViewState();
}

class _SubSectionsListViewState extends State<SubSectionsListView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget.onInit?.call(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: widget.title),
      body: AppPaginatedList(
        listMargin: const EdgeInsets.all(10),
        items: widget.subSections,
        itemBuilder: (context, index) {
          final subsection = widget.subSections[index];
          if (!_isAllowed(context, subsection)) {
            return const SizedBox.shrink();
          }
          return SectionsCardForList(
            page: SectionModel(
              title: subsection.title,
              page: subsection.page,
            ),
          );
        },
      ),
    );
  }

  bool _isAllowed(BuildContext context, SectionModel subsection) =>
      context.read<PrivilegesCubit>().checkPrivilege(subsection.privilegeId);
}
