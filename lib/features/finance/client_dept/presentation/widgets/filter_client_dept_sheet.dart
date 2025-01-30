import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/models/location/branch_model.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../common/branches/presentation/pages/branch_searchable_drop_down.dart';
import '../management/client_dept_bloc.dart';

class FilterClientDeptSheet extends StatefulWidget {
  const FilterClientDeptSheet({super.key});

  @override
  State<FilterClientDeptSheet> createState() => _FilterClientAcceptSheetState();
}

class _FilterClientAcceptSheetState extends State<FilterClientDeptSheet> {
  late final ClientDeptBloc _bloc;
  BranchModel? selectedBranch;

  @override
  void initState() {
    _bloc = context.read<ClientDeptBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<ClientDeptBloc, ClientDeptState>(
          builder: (context, state) {
            return Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed: state.getInvoicesByPrivilegesParams?.fkRegion != null
                        ? () {
                            _bloc.add(GetClientDeptEvents(
                                getInvoicesByPrivilegesParams: (state.getInvoicesByPrivilegesParams ?? GetInvoicesByPrivilegesParams()).copyWith(
                              fkRegion: () => null,
                            )));
                            context.pop();
                          }
                        : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  ),
                ),
                BranchSearchableDropDown(
                  hint: "الفرع",
                  selectedBranchId: state.getInvoicesByPrivilegesParams?.fkRegion,
                  onSelected: (region) {
                    selectedBranch = region;
                  },
                ),
                20.height,
                AppElevatedButton(
                  text: "فلترة",
                  onPressed: () {
                    _bloc.add(GetClientDeptEvents(
                      getInvoicesByPrivilegesParams: (state.getInvoicesByPrivilegesParams ?? GetInvoicesByPrivilegesParams())
                          .copyWith(fkRegion: () => selectedBranch?.branchId)));
                    context.pop();
                  },
                ),
                20.height,
              ],
            );
          },
        ),
      ),
    );
  }
}
