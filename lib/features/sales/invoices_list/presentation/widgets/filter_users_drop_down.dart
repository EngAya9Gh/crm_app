import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/seller_type_enum.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../manager/invoices_section_cubit.dart';

class FilterUsersDropDown extends StatelessWidget {
  const FilterUsersDropDown();

  @override
  Widget build(BuildContext context) {
    final _invoicesTabCubit = context.read<InvoicesSectionCubit>();
    return BlocBuilder<InvoicesSectionCubit, InvoicesSectionState>(
      builder: (context, state) {
        if (state.getUsersState.isLoading()) {
          return AppLoader();
        } else if (state.getUsersState.isFailed()) {
          return AppErrorWidget(
            message: "حدث خطأ أثناء تحميل البيانات",
            onPressed: () => _invoicesTabCubit.getUsers(),
          );
        }
        return CustomSearchableDropDown<UserEntity>(
          hint: _invoicesTabCubit
                  .filtersEntity.filterInvoicesSellerType.value?.value ??
              '',
          items: state.getUsersState.data ?? [],
          selectedItem:
              _invoicesTabCubit.filtersEntity.filterSelectedUser.value,
          itemAsString: (item) => item!.name,
          filterFn: (item, query) {
            return item.name.contains(query);
          },
          onChanged: (user) {
            if (user == null) return;
            _invoicesTabCubit.filtersEntity.filterSelectedUser.value = user;
          },
        );
      },
    );
  }
}
