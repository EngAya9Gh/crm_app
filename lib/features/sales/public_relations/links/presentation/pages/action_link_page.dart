import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../core/services/di/di_container.dart';
import '../../../../../../core/utils/responsive_padding.dart';
import '../../../../../../model/usermodel.dart';
import '../../../../../../view_model/typeclient.dart';
import '../../../../../../view_model/user_vm_provider.dart';
import '../../../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../data/models/important_link_model.dart';
import '../../domain/use_cases/action_link_usercase.dart';
import '../manager/important_links_cubit.dart';

class ActionLinkPage extends StatefulWidget {
  const ActionLinkPage({Key? key, this.linkModel}) : super(key: key);
  final ImportantLinkModel? linkModel;

  @override
  State<ActionLinkPage> createState() => _ActionLinkPageState();
}

class _ActionLinkPageState extends State<ActionLinkPage> {
  late ValueNotifier<String?> _titleLinkController;
  late TextEditingController _namelinkController;
  late TextEditingController _linkController;
  late TextEditingController _notesController;
  late TextEditingController _clauseController;
  late TextEditingController _addressController;
  late GlobalKey<FormState> _formKey;
  late ImportantLinksCubit _linkCubit;
  late UserModel currentUser;

  ImportantLinkModel? get linkModel => widget.linkModel;

  bool get isEdit => linkModel != null;
  late final bool isAllowedToEdit;

  @override
  void initState() {
    isAllowedToEdit =
        !isEdit || context.read<PrivilegesCubit>().checkPrivilege('260');
    currentUser = context.read<UserProvider>().currentUser;
    _linkCubit = getIt<ImportantLinksCubit>();
    _titleLinkController = ValueNotifier(linkModel?.title.toString());
    _linkController = TextEditingController(text: linkModel?.link.toString());
    _notesController = TextEditingController(
        text: linkModel?.notes == null ? '' : linkModel?.notes.toString());

    _clauseController = TextEditingController(
        text: linkModel?.clause == null ? '' : linkModel?.clause.toString());
    _addressController = TextEditingController(
        text: linkModel?.address == null ? '' : linkModel?.address.toString());

    _namelinkController = TextEditingController(
        text: linkModel?.department == null
            ? ''
            : linkModel?.department.toString());
    _formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    _linkController.dispose();
    _notesController.dispose();
    _clauseController.dispose();
    _addressController.dispose();
    _namelinkController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: '${isEdit ? 'تعديل' : 'إضافة'} رابط'),
      body: Form(
        key: _formKey,
        child: BlocBuilder<ImportantLinksCubit, ImportantLinksState>(
          builder: (context, tState) {
            if (tState.actionLinkState.isLoading())
              return Center(child: CircularProgressIndicator());

            return Directionality(
              textDirection: TextDirection.rtl,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                children: [
                  20.height,
                  Row(
                    children: [
                      Consumer<ClientTypeProvider>(
                        builder: (context, clientTypeVm, child) {
                          return Expanded(
                            child: ValueListenableBuilder<String?>(
                                valueListenable: _titleLinkController,
                                builder: (context, value, _) {
                                  return CustomDropDown<String>(
                                    hint: 'تصنيفات الروابط',
                                    items: clientTypeVm.typeOfLinks,
                                    itemAsString: (item) => item!,
                                    selectedItem: value,
                                    onChanged: (value) {
                                      if (value == null) return;

                                      _titleLinkController.value = value;
                                    },
                                    isDisabled: !isAllowedToEdit,
                                  );
                                }),
                          );
                        },
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  _CopyableTextField(
                    labelText: "الاسم*",
                    validator: InputValidator.requiredFiled,
                    controller: _namelinkController,
                    enabled: isAllowedToEdit,
                  ),
                  20.verticalSpace,
                  _CopyableTextField(
                    labelText: "البند",
                    controller: _clauseController,
                    enabled: isAllowedToEdit,
                  ),
                  20.verticalSpace,
                  _CopyableTextField(
                    labelText: "الرابط*",
                    validator: InputValidator.requiredFiled,
                    controller: _linkController,
                    enabled: isAllowedToEdit,
                  ),
                  20.verticalSpace,
                  _CopyableTextField(
                    labelText: "العنوان",
                    controller: _addressController,
                    minLines: 3,
                    enabled: isAllowedToEdit,
                  ),
                  20.verticalSpace,
                  _CopyableTextField(
                    labelText: "ملاحظات",
                    controller: _notesController,
                    minLines: 5,
                    enabled: isAllowedToEdit,
                  ),
                  20.verticalSpace,
                  10.verticalSpace,
                  BlocBuilder<ImportantLinksCubit, ImportantLinksState>(
                    builder: (context, state) {
                      return Builder(builder: (context) {
                        if (state.actionLinkState.isLoading())
                          return Center(child: CircularProgressIndicator());

                        return AppElevatedButton(
                          text: "حفظ",
                          onPressed: () {
                            final isValid = _formKey.currentState!.validate();
                            if (!isValid) return;
                            _linkCubit.actionLink(
                              updateLink: linkModel,
                              onSuccess: (String? value) {
                                if (value != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('errorً')));
                                  return;
                                }

                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('تم')));
                                Navigator.pop(context, value);
                              },
                              addLinkParams: ActionLinksParams(
                                user_id: currentUser.idUser!.toString(),
                                id: linkModel == null
                                    ? null
                                    : linkModel!.id.toString(),
                                address: _addressController.text.toString(),
                                link: _linkController.text.toString(),
                                notes: _notesController.text.toString(),
                                title: _titleLinkController.value.toString(),
                                clause: _clauseController.text.toString(),
                                department: _namelinkController.text.toString(),
                              ),
                            );
                          },
                        );
                      });
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CopyableTextField extends StatelessWidget {
  const _CopyableTextField({
    super.key,
    required this.labelText,
    this.controller,
    this.validator,
    this.minLines,
    required this.enabled,
  });

  final String labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? minLines;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextField(
            labelText: labelText,
            controller: controller,
            validator: validator,
            minLines: minLines,
            contentPadding: HWEdgeInsets.all(15),
            enabled: enabled,
          ),
        ),
        IconButton(
          icon: AppIcon(Icons.copy, color: Colors.black),
          onPressed: () => HelperFunctions.copyToClipboard(controller!.text),
        ),
      ],
    );
  }
}
