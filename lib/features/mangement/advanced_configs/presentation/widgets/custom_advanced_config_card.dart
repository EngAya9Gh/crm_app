import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/configs/config_value_type_enum.dart';
import '../../../../../core/common/models/config_model.dart';
import '../../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/advanced_cofigs_cubit.dart';

class CustomConfigCard extends StatelessWidget {
  const CustomConfigCard({
    super.key,
    required this.config,
    required this.valueController,
  });

  final ConfigModel config;
  final TextEditingController valueController;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AdvancedCofigsCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(config.nameArConfig),
        const SizedBox(height: 10),
        AppTextField(
          controller: valueController
            ..value = TextEditingValue(text: config.valueConfig),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          suffixText: ConfigValueTypeEnum.fromString(config.typeValue)?.value,
          onChange: (val) => cubit.locallyEditAdvancedConfig(config, val),
        ),
      ],
    );
  }
}
