import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../data/models/cancel_date_reason_model.dart';
import '../manager/dates_table_cubit.dart';

class CancelDateReasonsDropdown extends StatefulWidget {
  const CancelDateReasonsDropdown({
    super.key,
    this.onChanged,
  });

  final void Function(CancelDateReasonModel?)? onChanged;

  @override
  State<CancelDateReasonsDropdown> createState() =>
      _CancelDateReasonsDropdownState();
}

class _CancelDateReasonsDropdownState extends State<CancelDateReasonsDropdown> {
  late final DatesTableCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<DatesTableCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_cubit.state.getCancelReasonsStatus.data == null) {
        _cubit.getCancelReasons();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatesTableCubit, DatesTableState>(
      builder: (context, state) {
        return state.getCancelReasonsStatus.when(
          loading: () => const AppLoader(),
          success: (data) {
            return CustomDropDown<CancelDateReasonModel>(
              hint: "سبب الإلغاء *",
              items: state.getCancelReasonsStatus.data,
              itemAsString: (item) => item?.reason ?? "",
              validator: InputValidator.requiredFiled,
              onChanged: widget.onChanged,
            );
          },
          empty: () => AppErrorWidget(message: 'لا يوجد بيانات'),
          failure: (error, data) => AppErrorWidget(
            message: error.toString(),
            onPressed: () => _cubit.getCancelReasons(),
          ),
        );
      },
    );
  }
}
