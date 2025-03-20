import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/features/sales/clients/clients_contacts/data/models/client_contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../../core/services/di/di_container.dart';
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../clients_list/presentation/manager/clients_list_bloc.dart';
import '../../domain/use_cases/add_client_contact_usecase.dart';
import '../manager/add_client_contact_bloc.dart';
import '../widgets/clients_list_search_dialog.dart';

class AddClientContactPage extends StatefulWidget {
  final ClientContactModel? clientContact;

  const AddClientContactPage({Key? key, this.clientContact}) : super(key: key);

  @override
  State<AddClientContactPage> createState() => _AddClientContactPageState();
}

class _AddClientContactPageState extends State<AddClientContactPage> {
  late final AddClientContactBloc _bloc;
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController contactValueController;
  late final TextEditingController clientController; // Add this

  ContactTypeEnum _selectedContactType = ContactTypeEnum.mobile;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<AddClientContactBloc>();

    nameController = TextEditingController(text: widget.clientContact!=null?widget.clientContact!.name:null);
    contactValueController = TextEditingController(text: widget.clientContact!=null?widget.clientContact!.contactValue:null);
    clientController = TextEditingController(text: widget.clientContact!=null && widget.clientContact!.client!=null
        ?widget.clientContact!.client!.nameClient:null);
  }

  @override
  void dispose() {
    nameController.dispose();
    contactValueController.dispose();
    clientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppScaffold(
        appBar: CustomAppBar(
          title: 'إضافة جهة اتصال',showBackButton: true
        ),
        body: Form(
          key: _formKey,
          child: BlocBuilder<AddClientContactBloc, AddClientContactState>(
              buildWhen: (previous, current) =>
              previous.addClientContactStatus != current.addClientContactStatus,
              builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
                children: [
                  AppTextField(
                    labelText: "اسم جهة الاتصال*",
                    controller: nameController,
                    isRequired: true,
                    validator: InputValidator.requiredFiled,
                  ),
                  15.verticalSpace,
                  AppTextField(
                    labelText: "العميل*",
                    controller: clientController,
                    isRequired: true,
                    readOnly: true,
                    validator: InputValidator.requiredFiled,
                    suffixIcon: const Icon(Icons.search),
                    onTap: _showClientSearchDialog,
                  ),
                  15.verticalSpace,
                  CustomDropDown<ContactTypeEnum>(
                    hint: "نوع الاتصال*",
                    items: ContactTypeEnum.values,
                    compareFn:  (item, selectedItem) => item.index == selectedItem.index,
                    itemAsString: (item) => item!.displayNameAr,
                    selectedItem: _selectedContactType,
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        _selectedContactType = value;
                        contactValueController.clear();
                      });
                    },
                    validator: InputValidator.requiredFiled,
                  ),
                  15.verticalSpace,
                  AppTextField(
                    labelText: _getContactValueLabel(),
                    controller: contactValueController,
                    isRequired: true,
                    validator: InputValidator.requiredFiled,
                    inputType: _getKeyboardType(),
                    maxLength: _selectedContactType ==
                        ContactTypeEnum.mobile ? 15 : null,
                  ),
                  15.verticalSpace,
                  CustomDropDown<ContactTypeRoleEnum>(
                    hint: "نوع جهة الاتصال*",
                    items: ContactTypeRoleEnum.values,
                    itemAsString: (item) => item!.name,
                    compareFn:  (item, selectedItem) => item.index == selectedItem.index,
                    selectedItem: state.selectedRole,
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        _bloc.add(UpdateContactRoleEvent(value));
                      });
                    },
                    validator: InputValidator.requiredFiled,
                  ),
                  15.verticalSpace,
                  AppElevatedButton(
                    text:widget.clientContact==null? "إضافة":"تعديل",
                    isLoading: state.addClientContactStatus.isLoading(),
                    onPressed: _onSubmit,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  String _getContactValueLabel() {
    switch (_selectedContactType) {
      case ContactTypeEnum.mobile:
        return "رقم الجوال*";
      case ContactTypeEnum.email:
        return "البريد الإلكتروني*";
    }
  }

  TextInputType _getKeyboardType() {
    switch (_selectedContactType) {
      case ContactTypeEnum.mobile:
        return TextInputType.phone;
      case ContactTypeEnum.email:
        return TextInputType.emailAddress;
    }
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;

    final params = AddClientContactParams(
      contactId: widget.clientContact!=null?widget.clientContact!.id.toString():null,
      name: nameController.text,
      contactType: _selectedContactType,
      contactValue: contactValueController.text,
    );
    if(widget.clientContact==null)
      {
        _bloc.add(AddClientContactSubmitEvent(
          params,
          onSuccess: (contact) {
            AppNavigator.pop(result: contact);
          },
        ));
      }else{
      _bloc.add(UpdateClientContactEvent(
        params,
        onSuccess: (contact) {
          AppNavigator.pop(result: contact);
        },
      ));
    }

  }

  void _showClientSearchDialog() async {
    final result = await showDialog<ClientModel>(
      context: context,
      useRootNavigator: true,
      builder: (context) =>
          BlocProvider.value(
            value: getIt<ClientsListBloc>(),
            child: const ClientsSearchDialog(),
          ),
    );

    if (result != null) {
      _bloc.add(SelectClientEvent(result));
      setState(() {
        clientController.text = result.nameEnterprise ?? "";
      });
    }
  }
}