import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/helpers/helper_functions.dart';
import '../../../../core/di/di_container.dart';
import '../../../../core/utils/responsive_padding.dart';
import '../../../../model/usermodel.dart';
import '../../../../ui/widgets/custom_widget/custom_button_new.dart';
import '../../../../view_model/typeclient.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../app/presentation/widgets/app_drop_down.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../../app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
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
  late TextEditingController _linkDescriptionController;
  late TextEditingController _linkController;
  late TextEditingController _notesController;
  late GlobalKey<FormState> _formKey;
  late LinkCubit _linkCubit;
  late UserModel currentUser;

  LinkImportantModel? get linkModel => widget.linkModel;

  bool get isEdit => linkModel != null;

  @override
  void initState() {
    // TODO: implement initState
    currentUser = context.read<UserProvider>().currentUser;
    _linkCubit = getIt<LinkCubit>();
    _titleLinkController = ValueNotifier(linkModel?.title.toString());
    _linkController = TextEditingController(text: linkModel?.link.toString());
    _notesController = TextEditingController(text: linkModel?.notes.toString());
    _linkDescriptionController =
        TextEditingController(text: linkModel?.address.toString());
    _formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    _linkController.dispose();
    _notesController.dispose();
    _linkDescriptionController.dispose();

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
                  // AppTextField(
                  //   labelText: "عنوان الرابط*",
                  //   maxLines: 1,
                  //   validator: HelperFunctions.instance.requiredFiled,
                  //   controller: _titleLinkController,
                  // ),
                  20.verticalSpace,
                  AppTextField(
                    labelText: "الرابط*",
                    validator: HelperFunctions.instance.requiredFiled,
                    controller: _linkController,
                    minLines: 5,
                    contentPadding: HWEdgeInsets.all(15),
                  ),
                  20.verticalSpace,
                  AppTextField(
                    labelText: "ملاحظات*",
                    validator: HelperFunctions.instance.requiredFiled,
                    controller: _notesController,
                    minLines: 5,
                    contentPadding: HWEdgeInsets.all(15),
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
                                address: '',
                                link: _linkController.text.toString(),
                                notes: _notesController.text.toString(),
                                title: _titleLinkController.value.toString(),
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
}
