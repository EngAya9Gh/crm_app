import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../model/agent_distributor_model.dart';
import '../../../../../model/maincitymodel.dart';
import '../../../data/models/agent_distributor_action_model.dart';
import '../../../domain/use_cases/add_agent_usecase.dart';
import '../../../domain/use_cases/get_all_cities_usecase.dart';
import '../../../domain/use_cases/update_agent_usecase.dart';

part 'agents_distributors_actions_state.dart';

@injectable
class AgentsDistributorsActionsCubit
    extends Cubit<AgentsDistributorsActionsState> {
  AgentsDistributorsActionsCubit(
    this.getAllCitiesUseCase,
    this.addAgentUseCase,
    this.updateAgentUseCase,
  ) : super(AgentsDistributorsActionsInitial());

  final GetAllCitiesUseCase getAllCitiesUseCase;
  final AddAgentUseCase addAgentUseCase;
  final UpdateAgentUseCase updateAgentUseCase;

  // support tab Keys and controllers
  final supportFormKey = GlobalKey<FormState>();
  final TextEditingController supportSelectedDateController =
      TextEditingController();
  final TextEditingController supportDateTypeController =
      TextEditingController();

  // keys and controllers
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController logoController = TextEditingController();
  File? logoFile;
  List<CityModel> citiesList = [];

  AgentDistributorActionModel agentDistributorActionModel =
      AgentDistributorActionModel();

  MainCityModel? selectedCountry;
  CityModel? selectedCountryFromCity;

  void loadCurrentAgentData(AgentDistributorModel? agentDistributorModel) {
    if (agentDistributorModel == null) {
      resetAgentDistributorActionEntity();
    } else {
      nameController.text = agentDistributorModel.nameAgent;
      emailController.text = agentDistributorModel.emailAgent;
      phoneNumberController.text = agentDistributorModel.mobileAgent;
      descriptionController.text = agentDistributorModel.description;
      descriptionController.text = agentDistributorModel.description;
      onSelectADType(ADType.values.firstWhere((element) =>
          element.index == int.parse(agentDistributorModel.typeAgent)));
      agentDistributorActionModel = agentDistributorActionModel.copyWith(
        name: agentDistributorModel.nameAgent,
        email: agentDistributorModel.emailAgent,
        phoneNumber: agentDistributorModel.mobileAgent,
        description: agentDistributorModel.description,
        type: ADType.values.firstWhere((element) =>
            element.index == int.parse(agentDistributorModel.typeAgent)),
        countryId: agentDistributorModel.fkCountry,
        cityId: agentDistributorModel.cityId,
      );
    }
  }

  void _loadCurrentCity(String? cityId) {
    selectedCountryFromCity = citiesList.firstWhereOrNull(
      (element) => element.id_city == cityId,
    );
    emit(AgentsDistributorsActionsCityChanged());
  }

  void resetAgentDistributorActionEntity() {
    agentDistributorActionModel = AgentDistributorActionModel();
    selectedCountry = null;
    selectedCountryFromCity = null;
    emit(AgentsDistributorsActionsInitial());
  }

  Future<void> getAllCity({
    required String fkCountry,
    String? regionId,
  }) async {
    emit(AgentsDistributorsActionsLoading());

    final response = await getAllCitiesUseCase(
      GetAllCitiesUseCaseParams(
        fkCountry: fkCountry,
        regionId: regionId,
      ),
    );
    response.fold(
      (l) => emit(AgentsDistributorsActionsFailure(l)),
      (r) {
        citiesList = r;
        if (regionId != null) {
          final country = citiesList
              .firstWhereOrNull((element) => element.id_city == regionId);
          if (country != null) {
            selectedCountryFromCity = country;
          }
        }
        emit(AgentsDistributorsActionsSuccess());
        _loadCurrentCity(agentDistributorActionModel.cityId);
      },
    );
  }

  Future<void> addAgent() async {
    emit(AgentsDistributorsActionsLoading());
    final response = await addAgentUseCase(
      AddAgentParams(
        agentActionModel: agentDistributorActionModel,
        fileLogo: agentDistributorActionModel.filelogo,
        file: null,
        files: null,
      ),
    );

    response.fold(
      (l) {
        emit(AgentsDistributorsActionsFailure(l));
      },
      (r) {
        emit(AgentsDistributorsActionsSuccess());
      },
    );
  }

  Future<void> updateAgent({
    required String agentId,
  }) async {
    emit(AgentsDistributorsActionsLoading());
    final response = await updateAgentUseCase(
      UpdateAgentParams(
        agentId: agentId,
        agentActionModel: agentDistributorActionModel,
        fileLogo: agentDistributorActionModel.filelogo,
        file: null,
        files: null,
      ),
    );

    response.fold(
      (l) {
        emit(AgentsDistributorsActionsFailure(l));
      },
      (r) {
        emit(AgentsDistributorsActionsSuccess());
      },
    );
  }

  Future<void> actionAgentDistributor({
    String? agentId,
    String? currentUser,
  }) async {
    getCurrentUser(currentUser);
    if (agentId == null) {
      await addAgent();
    } else {
      await updateAgent(agentId: agentId);
    }
    resetAgentDistributorActionEntity();
  }

  onSelectADType(ADType type) {
    if (type == agentDistributorActionModel.type) {
      agentDistributorActionModel = agentDistributorActionModel.resetType();
      emit(AgentsDistributorsActionsTypeChanged());
      return;
    }

    agentDistributorActionModel =
        agentDistributorActionModel.copyWith(type: type);
    emit(AgentsDistributorsActionsTypeChanged());
  }

  onSelectCountry(String? countryId) {
    agentDistributorActionModel =
        agentDistributorActionModel.copyWith(countryId: countryId);
  }

  getCurrentUser(String? fk_user_add) {
    agentDistributorActionModel =
        agentDistributorActionModel.copyWith(currentUser: fk_user_add);
  }

  onSelectCity(String cityId) {
    agentDistributorActionModel =
        agentDistributorActionModel.copyWith(cityId: cityId);
  }

  onSaveName(String? name) {
    agentDistributorActionModel =
        agentDistributorActionModel.copyWith(name: name);
  }

  onSaveEmail(String email) {
    agentDistributorActionModel =
        agentDistributorActionModel.copyWith(email: email);
  }

  onSaveDescription(String description) {
    agentDistributorActionModel =
        agentDistributorActionModel.copyWith(description: description);
  }

  onSaveImageFile() {
    agentDistributorActionModel =
        agentDistributorActionModel.copyWith(filelogo: logoFile);
  }

  onSavePhoneNumber(String phoneNumber) {
    agentDistributorActionModel =
        agentDistributorActionModel.copyWith(phoneNumber: phoneNumber);
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    descriptionController.dispose();
    logoController.dispose();
    return super.close();
  }
}
