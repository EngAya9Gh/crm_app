import 'package:crm_smart/core/utils/app_strings.dart';
import 'package:crm_smart/core/utils/responsive_padding.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_field.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/helpers/helper_functions.dart';
import '../../../app/presentation/widgets/app_elvated_button.dart';
import '../../../app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import '../../data/models/participatModel.dart';
import '../../domain/use_cases/add_participate_usecase.dart';
import '../../domain/use_cases/edit_paraticipate_usecase.dart';
import '../manager/participate_list_bloc.dart';
import '../manager/participate_list_event.dart';
import '../manager/participate_list_state.dart';

class ActionParticipate extends StatefulWidget {
  const ActionParticipate({Key? key, this.participate}) : super(key: key);
  final ParticipateModel? participate;

  @override
  State<ActionParticipate> createState() => _ActionParticipateState();
}

class _ActionParticipateState extends State<ActionParticipate> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _fromKey = GlobalKey<FormState>();
  late final ParticipateListBloc _participateListBloc;
  bool get isEdit => widget.participate != null;
  late final TextEditingController nameParticipateController;
  late final TextEditingController mobileParticipateController;
  late final TextEditingController nameBankParticipateController;
  late final TextEditingController numberBankParticipateController;
  late ValueNotifier<String?> clientName;
  @override
  void initState() {
    _participateListBloc = context.read<ParticipateListBloc>();
    mobileParticipateController =
        TextEditingController(text: widget.participate?.mobile_participate);
    nameBankParticipateController =
        TextEditingController(text: widget.participate?.namebank_participate);
    numberBankParticipateController =
        TextEditingController(text: widget.participate?.numberbank_participate);
    clientName = ValueNotifier(widget.participate?.name_participate);
    nameParticipateController = TextEditingController(text: clientName.value)
      ..addListener(() {
        clientName.value = nameParticipateController.text;
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppScaffold

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ValueListenableBuilder<String?>(
          valueListenable: clientName,
          builder: (context, value, _) {
            return SmartCrmAppBar(
              appBarParams:
                  AppBarParams(title: isEdit ? value : "إضافة متعاون"),
            );
          },
        ),
      ),
      key: _scaffoldKey,
      body:
          // ModalProgressHUD(
          // inAsyncCall: Provider.of<participate_vm>(context).isloading,
          // child:
          Form(
        key: _fromKey,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: HWEdgeInsets.only(left: 15, right: 15, top: 15),
                  children: [
                    15.verticalSpace,
                    AppTextField(
                      labelText: "اسم المتعاون*",
                      maxLines: 1,
                      validator: HelperFunctions.instance.requiredFiled,
                      textInputType: TextInputType.text,
                      maxLength: 15,
                      controller: nameParticipateController,
                    ),
                    15.verticalSpace,
                    AppTextField(
                      labelText: "رقم المتعاون*",
                      validator: HelperFunctions.instance.requiredFiled,
                      maxLines: 1,
                      textInputType: TextInputType.phone,
                      maxLength: 15,
                      controller: mobileParticipateController,
                    ),
                    15.verticalSpace,
                    AppTextField(
                      labelText: "بنك المتعاون*",
                      validator: HelperFunctions.instance.requiredFiled,
                      maxLines: 1,
                      // hintText: '',
                      controller: nameBankParticipateController,
                    ),
                    15.verticalSpace,
                    AppTextField(
                      labelText: "رقم بنك المتعاون*",
                      validator: HelperFunctions.instance.requiredFiled,
                      maxLines: 1,
                      textInputType: TextInputType.phone,
                      controller: numberBankParticipateController,
                    ),
                  ],
                ),
              ),
              10.verticalSpace,
              BlocBuilder<ParticipateListBloc, ParticipateListState>(
                builder: (context, state) {
                  return AppElevatedButton(
                    isLoading: state.actionParticipateBlocStatus.isLoading(),
                    text: isEdit ? "تعديل" : "إضافة",
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                    ),
                    onPressed: () {
                      if (!_fromKey.currentState!.validate()) {
                        return;
                      }

                      if (isEdit) {
                        _onEditClient();
                        return;
                      }
                      _onAddClient();
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
      // )
    );
  }

  void _onEditClient() {
    _participateListBloc.add(EditParticipateEvent(
      EditParticipateParams(
        idParticipate: widget.participate!.id_participate!,
        nameParticipate: nameParticipateController.text,
        mobileParticipate: mobileParticipateController.text,
        namebankParticipate: nameBankParticipateController.text,
        numberbankParticipate: numberBankParticipateController.text,
      ),
      onSuccess: (client) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(isEdit
                ? AppStrings.labelEditUser
                : AppStrings.labelAddedUser)));
        Navigator.pop(context, client);
      },
    ));
  }

  void _onAddClient() {
    _participateListBloc.add(AddParticipateEvent(
      AddParaticipateParams(
        nameParticipate: nameParticipateController.text,
        mobileParticipate: mobileParticipateController.text,
        namebankParticipate: nameBankParticipateController.text,
        numberbankParticipate: numberBankParticipateController.text,
      ),
      onSuccess: (client) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(isEdit
                ? AppStrings.labelEditUser
                : AppStrings.labelAddedUser)));
        Navigator.pop(context, client);
      },
    ));
  }
}
