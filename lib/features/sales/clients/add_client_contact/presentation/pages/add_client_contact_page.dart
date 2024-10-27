import 'package:crm_smart/features/sales/clients/clients_contacts/data/models/client_contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../../core/services/di/di_container.dart';
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../domain/use_cases/add_client_contact_usecase.dart';
import '../manager/add_client_contact_bloc.dart';

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
  late final TextEditingController descriptionController;
  late final TextEditingController contactValueController;
  ContactTypeEnum _selectedContactType = ContactTypeEnum.mobile;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<AddClientContactBloc>();

    nameController = TextEditingController();
    descriptionController = TextEditingController();
    contactValueController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    contactValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppScaffold(
        appBar: CustomAppBar(
          title: 'إضافة جهة اتصال',
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(15.r),
                  children: [
                    AppTextField(
                      labelText: "اسم جهة الاتصال*",
                      controller: nameController,
                      validator: InputValidator.requiredFiled,
                    ),
                    15.verticalSpace,
                    CustomDropDown<ContactTypeEnum>(
                      hint: "نوع الاتصال*",
                      items: ContactTypeEnum.values,
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
                      validator: InputValidator.requiredFiled,
                      inputType: _getKeyboardType(),
                      maxLength: _selectedContactType == ContactTypeEnum.mobile ? 15 : null,
                    ),
                    15.verticalSpace,
                    AppTextField(
                      labelText: "الوصف",
                      controller: descriptionController,
                      minLines: 3,
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
              BlocBuilder<AddClientContactBloc, AddClientContactState>(
                bloc: _bloc,
                builder: (context, state) {
                  return AppElevatedButton(
                    text: "إضافة",
                    isLoading: state.addClientContactStatus.isLoading(),
                    onPressed: _onSubmit,
                  );
                },
              ),
              5.verticalSpace,
            ],
          ),
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
      clientId: widget.clientContact?.client.idClients??"",
      name: nameController.text,
      contactType: _selectedContactType,
      contactValue: contactValueController.text,
      description: descriptionController.text.isEmpty ? null : descriptionController.text,
    );

    _bloc.add(AddClientContactSubmitEvent(
      params,
      onSuccess: (contact) => AppNavigator.pop(result: contact),
    ));
  }
}