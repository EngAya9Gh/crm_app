import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/models/config_model.dart';
import '../../../../../core/common/widgets/app_grouped_list.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../manager/general_cofigs_cubit.dart';
import '../widgets/custom_general_config_card.dart';
import '../widgets/save_general_configs_button.dart';

class GeneralCofigsPage extends StatefulWidget {
  const GeneralCofigsPage({super.key});

  @override
  State<GeneralCofigsPage> createState() => _GeneralCofigsPageState();
}

class _GeneralCofigsPageState extends State<GeneralCofigsPage> {
  late final GeneralCofigsCubit generalCofigsCubit;

  @override
  void initState() {
    generalCofigsCubit = context.read<GeneralCofigsCubit>();
    generalCofigsCubit.getGeneralConfigs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: 'الاعدادات العامة',
        actions: [
          SaveConfigsButton(),
        ],
      ),
      body: BlocBuilder<GeneralCofigsCubit, GeneralCofigsState>(
        buildWhen: (previous, current) {
          return previous.getGeneralConfigsStatus !=
              current.getGeneralConfigsStatus;
        },
        builder: (context, state) {
          if (state.getGeneralConfigsStatus.isLoading()) {
            return AppLoader();
          } else if (state.getGeneralConfigsStatus.isFailed()) {
            return AppErrorWidget(
              onPressed: () => generalCofigsCubit.getGeneralConfigs(),
              message: state.getGeneralConfigsStatus.error,
            );
          }
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AppGroupedList<ConfigModel, String>(
                elements: generalCofigsCubit.configs,
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
