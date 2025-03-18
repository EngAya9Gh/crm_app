import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/features/versions/presentation/manager/versions_bloc.dart';
import 'package:crm_smart/features/versions/presentation/widgets/order_new_version_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    _bloc.add(GetIncommingUpdateInfoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.outlineBorder,
      appBar: CustomAppBar(title: 'طلبات التحديثات', showBackButton: true),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryMain,
        onPressed: () {
          AppConstants.showAppDialog(
            child: OrderNewVersionDialog(),
          );
        },
        child: Icon(
          Icons.add_circle_outline_sharp,
          color: AppColors.white,
        ),
      ),
    );
  }
}
