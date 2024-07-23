import '../../../../../core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../../../core/common/models/config_model.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_loading_indicator.dart';
import '../manager/advanced_cofigs_cubit.dart';
import '../widgets/custom_advanced_config_card.dart';
import '../widgets/save_advanced_configs_button.dart';

class AdvancedCofigsPage extends StatefulWidget {
  const AdvancedCofigsPage({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('الاعدادات المتقدمة'),
        titleTextStyle:
            context.textTheme.titleMedium?.copyWith(color: Colors.white),
        centerTitle: true,
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
            return CustomLoadingIndicator();
          } else if (state.getAdvancedConfigsStatus.isFailed()) {
            return CustomErrorWidget(
              onPressed: () => advancedCofigsCubit.getAdvancedConfigs(),
              message: state.getAdvancedConfigsStatus.error,
            );
          }
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GroupedListView<ConfigModel, String>(
                elements: advancedCofigsCubit.configs,
                groupBy: (element) => element.management ?? '',
                groupComparator: (value1, value2) => value2.compareTo(value1),
                itemComparator: (item1, item2) {
                  return item1.idConfig.compareTo(item2.idConfig);
                },
                order: GroupedListOrder.ASC,
                useStickyGroupSeparators: true,
                groupSeparatorBuilder: (String value) {
                  return Container(
                    color: Colors.grey.shade200,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      value,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
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
