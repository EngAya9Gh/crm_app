import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../../model/usermodel.dart';
import '../../../../../../view_model/user_vm_provider.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../manager/clients_list_bloc.dart';

class assignClientsToEmployeeDialog extends StatelessWidget {
  const assignClientsToEmployeeDialog({
    super.key,
    required this.selectedUser,
    required ClientsListBloc clientsListBloc,
  }) : _clientsListBloc = clientsListBloc;

  final ValueNotifier<UserModel?> selectedUser;
  final ClientsListBloc _clientsListBloc;

  @override
  Widget build(BuildContext context) {
    return AppDialog(children: [
      AppText('اختر موظف'),
      ValueListenableBuilder(
        valueListenable: selectedUser,
        builder: (context, userSelected, child) =>
            BlocBuilder<ClientsListBloc, ClientsListState>(
              builder: (context, state) =>
                  CustomSearchableDropDown<UserModel>(
                    hint: 'اختر اسم الموظف',
                    items: state.usersSales.data??[],
                    itemAsString: (u) => u!.userAsString(),
                    selectedItem: userSelected,
                    onChanged: (data) => selectedUser.value = data!,
                    filterFn: (user, filter) => user.getfilteruser(filter),
                    validator: (val) {
                      if (val == null) return 'من فضلك حدد اسم موظف';
                      return null;
                    },
                  ),),
      ),
      10.height,
      BlocBuilder<ClientsListBloc, ClientsListState>(
        builder: (context, state) {
          return ValueListenableBuilder(
            valueListenable: selectedUser,
            builder:(context, value, child) =>  AppElevatedButton(
              text: 'تأكيد',
              isDisabled: value==null,
              isLoading: state.assignClientsToEmployeeStatus.isLoading(),
              onPressed: () {
                _clientsListBloc.add(AssignClientsToEmployeesEvent(
                  fkUser: selectedUser.value!.id,
                  onSucess: () {
                    ///after success clear all selected data , get again and pop to previous screen
                    _clientsListBloc.pageVariables.selectedItemsId.value = [];
                    _clientsListBloc.add(GetAllClientsListEvent());
                    context.pop();
                  },
                ));
              },
            ),
          );
        },
      ),
      10.height,
      AppElevatedButton(
        text: 'رجوع',
        onPressed: () {
          context.pop();
        },
      ),
    ]);
  }
}
