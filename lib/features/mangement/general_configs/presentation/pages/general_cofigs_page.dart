import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../../../core/common/models/config_model.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/utils/extensions/build_context.dart';
import '../manager/general_cofigs_cubit.dart';
import '../widgets/custom_general_config_card.dart';
import '../widgets/save_general_configs_button.dart';

class GeneralCofigsPage extends StatefulWidget {
  const GeneralCofigsPage({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('الاعدادات العامة'),
        titleTextStyle:
            context.textTheme.titleMedium?.copyWith(color: Colors.white),
        centerTitle: true,
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
            return CustomErrorWidget(
              onPressed: () => generalCofigsCubit.getGeneralConfigs(),
              message: state.getGeneralConfigsStatus.error,
            );
          }
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GroupedListView<ConfigModel, String>(
                elements: generalCofigsCubit.configs,
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
