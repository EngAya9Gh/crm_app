import 'package:crm_smart/features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../core/services/di/di_container.dart';
import '../../../../../../core/utils/responsive_padding.dart';
import '../../../../../../model/usermodel.dart';
import '../../../../../../ui/widgets/custom_widget/custom_button_new.dart';
import '../../../../../../view_model/typeclient.dart';
import '../../../../../../view_model/user_vm_provider.dart';
import '../../../../../app/presentation/widgets/app_drop_down.dart';
import '../../../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../../../../app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import '../../data/models/link_model.dart';
import '../../domain/use_cases/action_link_usercase.dart';
import '../manager/link_cubit.dart';

class ActionLinkPage extends StatefulWidget {
  const ActionLinkPage({Key? key, this.linkModel}) : super(key: key);
  final LinkImportantModel? linkModel;

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
  late LinkCubit _linkCubit;
  late UserModel currentUser;

  LinkImportantModel? get linkModel => widget.linkModel;

  bool get isEdit => linkModel != null;
  late final bool isAllowedToEdit;

  @override
  void initState() {
    isAllowedToEdit =
        !isEdit || context.read<PrivilegesCubit>().checkPrivilege('260');
    currentUser = context.read<UserProvider>().currentUser;
    _linkCubit = getIt<LinkCubit>();
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
      appBar: SmartCrmAppBar(
        appBarParams: AppBarParams(
          title: isEdit ? 'تعديل' : 'إضافة ',
          action: [],
        ),
      ),
      body: Form(
        key: _formKey,
        child: BlocBuilder<LinkCubit, LinksState>(
          builder: (context, tState) {
            if (tState.actionLinkState.isLoading())
              return Center(child: CircularProgressIndicator());

            return Directionality(
              textDirection: TextDirection.rtl,
              child: ListView(
                padding: HWEdgeInsets.symmetric(horizontal: 10),
                children: [
                  20.verticalSpace,
                  Row(
                    children: [
                      Consumer<ClientTypeProvider>(
                        builder: (context, clientTypeVm, child) {
                          return Expanded(
                            child: ValueListenableBuilder<String?>(
                                valueListenable: _titleLinkController,
                                builder: (context, value, _) {
                                  return AppDropdownButtonFormField<String,
                                      String>(
                                    isDisabled: !isAllowedToEdit,
                                    hint: 'تصنيفات الروابط',
                                    items: clientTypeVm.typeOfLinks,
                                    itemAsValue: (item) => item,
                                    itemAsString: (item) => item!,
                                    value: value,
                                    onChange: (value) {
                                      if (value == null) return;

                                      _titleLinkController.value = value;
                                    },
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
                  BlocBuilder<LinkCubit, LinksState>(
                    builder: (context, state) {
                      return Builder(builder: (context) {
                        if (state.actionLinkState.isLoading())
                          return Center(child: CircularProgressIndicator());

                        return custom_button_new(
                          onpress: () {
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
                          text: "حفظ",
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

// Widget buildAppTextField({
//   required String labelText,
//   TextEditingController? controller,
//   String? Function(String?)? validator,
//   int? minLines,
//   bool? enabled,
// }) {
//   return Row(
//     children: [
//       Expanded(
//         child: AppTextField(
//           labelText: labelText,
//           controller: controller,
//           validator: validator,
//           minLines: minLines,
//           contentPadding: HWEdgeInsets.all(15),
//           enabled: enabled ?? isAllowedToEdit,
//         ),
//       ),
//       IconButton(
//         icon: Icon(Icons.copy),
//         onPressed: () => HelperFunctions.copyToClipboard(controller!.text),
//       ),
//     ],
//   );
// }
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
          icon: Icon(Icons.copy),
          onPressed: () => HelperFunctions.copyToClipboard(controller!.text),
        ),
      ],
    );
  }
}
