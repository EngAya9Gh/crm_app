import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common/enums/participates/state_participate_enum.dart';
import '../../../../../../core/common/extensions/extensions.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/models/participate_model.dart';
import '../../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../../core/common/widgets/cities_searchable_drop_down.dart';
import '../../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/responsive_padding.dart';
import '../../../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../../../../app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import '../../../../../common/cities/presentation/manager/cities_cubit.dart';
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
  late final CitiesCubit citiesCubit;
  StateParticipateEnum stateParticipate = StateParticipateEnum.Negotiation;

  @override
  void initState() {
    citiesCubit = context.read<CitiesCubit>();
    citiesCubit.loadCurrentCityById(cityId: widget.participate?.fkCity);
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
      body: Form(
        key: _fromKey,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: HWEdgeInsets.only(left: 15, right: 15, top: 15),
                  children: [
                    15.height,
                    AppTextField(
                      labelText: "اسم المتعاون*",
                      maxLines: 1,
                      validator: InputValidator.requiredFiled,
                      textInputType: TextInputType.text,
                      // maxLength: 15,
                      controller: nameParticipateController,
                    ),
                    15.height,
                    AppTextField(
                      labelText: "رقم المتعاون*",
                      validator: InputValidator.requiredFiled,
                      maxLines: 1,
                      textInputType: TextInputType.phone,
                      maxLength: 15,
                      controller: mobileParticipateController,
                    ),
                    15.height,
                    AppTextField(
                      labelText: "بنك المتعاون*",
                      maxLines: 1,
                      controller: nameBankParticipateController,
                      validator: InputValidator.requiredFiled,
                    ),
                    15.height,
                    AppTextField(
                      labelText: "رقم بنك المتعاون*",
                      maxLines: 1,
                      textInputType: TextInputType.phone,
                      controller: numberBankParticipateController,
                      validator: InputValidator.requiredFiled,
                    ),
                    15.height,
                    if (!isEdit) ...[
                      CustomDropDown<StateParticipateEnum>(
                        hint: 'حالة المتعاون',
                        items: StateParticipateEnum.values,
                        itemAsString: (item) => item!.value,
                        selectedItem: stateParticipate,
                        onChanged: (state) {
                          stateParticipate = state!;
                        },
                        validator: InputValidator.requiredFiled,
                        height: 100.h,
                      ),
                      15.height,
                    ],
                    // cities drop down
                    CitiesSearchableDropDown(
                      selectedCityId: citiesCubit.selectedCity?.idCity,
                      onSelected: (city) {
                        citiesCubit.selectedCity = city;
                      },
                    ),
                  ],
                ),
              ),
              10.height,
              BlocBuilder<ParticipateListBloc, ParticipateListState>(
                builder: (context, state) {
                  return AppElevatedButton(
                    isLoading: state.actionParticipateStatus.isLoading(),
                    text: isEdit ? "تعديل" : "إضافة",
                    onPressed: () {
                      if (!_fromKey.currentState!.validate()) {
                        return;
                      }

                      if (isEdit) {
                        _onEditClient();
                        return;
                      }
                      _onAddParticipate();
                    },
                  );
                },
              ),
              10.height,
            ],
          ),
        ),
      ),
    );
  }

  void _onEditClient() {
    _participateListBloc.add(EditParticipateEvent(
      EditParticipateParams(
        idParticipate: widget.participate!.id_participate,
        nameParticipate: nameParticipateController.text,
        mobileParticipate: mobileParticipateController.text,
        namebankParticipate: nameBankParticipateController.text,
        numberbankParticipate: numberBankParticipateController.text,
        fkCity: citiesCubit.selectedCity!.idCity,
        stateParticipate: stateParticipate,
      ),
      onSuccess: (client) {
        citiesCubit.selectedCity = context
            .read<ParticipateListBloc>()
            .filterVariables
            .selectedCity
            .value;
        AppConstants.showSnakeBar(
          isEdit ? AppStrings.labelEditUser : AppStrings.labelAddedUser,
        );
        AppNavigator.pop(result: client);
      },
    ));
  }

  void _onAddParticipate() {
    _participateListBloc.add(AddParticipateEvent(
      AddParaticipateParams(
        nameParticipate: nameParticipateController.text,
        mobileParticipate: mobileParticipateController.text,
        namebankParticipate: nameBankParticipateController.text,
        numberbankParticipate: numberBankParticipateController.text,
        fkCity: citiesCubit.selectedCity!.idCity,
        stateParticipate: stateParticipate,
      ),
      onSuccess: (client) {
        citiesCubit.selectedCity = context
            .read<ParticipateListBloc>()
            .filterVariables
            .selectedCity
            .value;
        AppNavigator.pop(result: client);
        AppConstants.showSnakeBar(
          isEdit ? AppStrings.labelEditUser : AppStrings.labelAddedUser,
        );
      },
    ));
  }
}
