import 'package:crm_smart/core/common/widgets/app_grouped_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/models/config_model.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../manager/advanced_cofigs_cubit.dart';
import '../widgets/custom_advanced_config_card.dart';
import '../widgets/save_advanced_configs_button.dart';

class AdvancedCofigsPage extends StatefulWidget {
  const AdvancedCofigsPage({super.key});

  @override
  State<AdvancedCofigsPage> createState() => _AdvancedCofigsPageState();
}

class _AdvancedCofigsPageState extends State<AdvancedCofigsPage> {
  late final AdvancedCofigsCubit advancedCofigsCubit;

  @override
  void initState() {
    advancedCofigsCubit = context.read<AdvancedCofigsCubit>();
    advancedCofigsCubit.getAdvancedConfigs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: 'الاعدادات المتقدمة',
        actions: [
          SaveConfigsButton(),
        ],
      ),
      body: BlocBuilder<AdvancedCofigsCubit, AdvancedCofigsState>(
        buildWhen: (previous, current) {
          return previous.getAdvancedConfigsStatus !=
              current.getAdvancedConfigsStatus;
        },
        builder: (context, state) {
          if (state.getAdvancedConfigsStatus.isLoading()) {
            return AppLoader();
          } else if (state.getAdvancedConfigsStatus.isFailed()) {
            return AppErrorWidget(
              onPressed: () => advancedCofigsCubit.getAdvancedConfigs(),
              message: state.getAdvancedConfigsStatus.error,
            );
          }
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AppGroupedList<ConfigModel, String>(
                elements: advancedCofigsCubit.configs,
                groupBy: (element) => element.management ?? '',
                groupComparator: (value1, value2) => value2.compareTo(value1),
                itemComparator: (item1, item2) {
                  return item1.idConfig.compareTo(item2.idConfig);
                },
                separator: const SizedBox(height: 10),
                itemBuilder: (c, element) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: CustomConfigCard(
                      config: element,
                      valueController: TextEditingController(),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
