import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/dates_table_cubit.dart';

class GetAllSwitchButton extends StatelessWidget {
  const GetAllSwitchButton({
    super.key,
    required this.onChanged,
  });

  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    final datesTableCubit = context.read<DatesTableCubit>();
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: StatefulBuilder(
            builder: (context, refresh) {
              return Switch(
                value: datesTableCubit.filterEntity.isAllEventsNotifier.value,
                onChanged: (value) {
                  onChanged(value);
                  if (value) datesTableCubit.setAllCities();
                  refresh(() {});
                },
              );
            },
          ),
        ),
        AppText("الكل"),
      ],
    );
  }
}
