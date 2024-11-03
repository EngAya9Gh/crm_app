import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/utils/responsive_padding.dart';
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../app/presentation/widgets/app_text_button.dart';
import '../manager/clients_contacts_bloc.dart';
class FilterClientsContactsSheet extends StatefulWidget {
  const FilterClientsContactsSheet({
    Key? key,
  });

  @override
  State<FilterClientsContactsSheet> createState() => _FilterClientsContactsSheetState();
}

class _FilterClientsContactsSheetState extends State<FilterClientsContactsSheet> {
  late ClientsContactsBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = context.read<ClientsContactsBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HWEdgeInsets.symmetric(horizontal: 15.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child:  BlocBuilder<ClientsContactsBloc, ClientsContactsState>(
            buildWhen: (previous, current) =>
            previous.selectedRole != current.selectedRole,
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.height,
                  Align(
                    alignment: Alignment.centerLeft,
                    child:  AppTextButton(
                      onPressed:  () {
                        _bloc.add(const GetAllClientsContactsEvent(page: 1));
                        AppNavigator.pop();

                      },
                      text: "إعادة الافتراضي",
                      appButtonStyle: AppButtonStyle.secondary,
                    ),
                  ),
                  10.height,
                  CustomDropDown<ContactTypeRoleEnum>(
                    hint: "نوع جهة الاتصال*",
                    items: ContactTypeRoleEnum.values,
                    itemAsString: (item) => item!.name,
                    selectedItem: state.selectedRole,
                    onChanged: (value) {
                      if (value == null) return;
                        _bloc.add(UpdateContactRoleEvent(value));
                    },
                    validator: InputValidator.requiredFiled,
                  ),
                  20.height,
                  SizedBox(
                    width: double.infinity,
                    child: AppElevatedButton(
                      text: "فلترة",
                      onPressed: () {
                        _bloc.add( GetAllClientsContactsEvent(page: 1,contactType: state.selectedRole.name));
                        AppNavigator.pop();

                      },
                    ),
                  ),
                  20.height,
                ],
              );
            }),
      ),
    );
  }

}
