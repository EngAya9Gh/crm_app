import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../../api/api.dart';
import '../../../../../common/enums/enums.dart';
import '../../../../../constants.dart';
import '../../../../../model/maincitymodel.dart';
import '../../../domain/entities/agent_distributor_action_entity.dart';
import '../../../domain/use_cases/get_all_cities_usecase.dart';

part 'agents_distributors_actions_state.dart';

class AgentsDistributorsActionsCubit
    extends Cubit<AgentsDistributorsActionsState> {
  AgentsDistributorsActionsCubit(this.getAllCitiesUseCase)
      : super(AgentsDistributorsActionsInitial());

  final GetAllCitiesUseCase getAllCitiesUseCase;

  // keys and controllers
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController logoController = TextEditingController();
  File? logoFile;
  List<CityModel> citiesList = [];

  AgentDistributorActionEntity agentDistributorActionEntity =
      AgentDistributorActionEntity();

  MainCityModel? selectedCountry;
  CityModel? selectedCountryFromCity;
  bool isLoadingAction = false;

  void resetAgentDistributorActionEntity() {
    agentDistributorActionEntity = AgentDistributorActionEntity();
    selectedCountry = null;
    selectedCountryFromCity = null;
    isLoadingAction = false;
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
      },
    );
  }

  Future<void> actionAgentDistributor({
    // required VoidCallback onSuccess,
    String? agentId,
  }) async {
    try {
      isLoadingAction = true;
      emit(AgentsDistributorsActionsLoading());
      dynamic response;
      if (agentId == null) {
        response = await Api().postRequestWithFile(
          "array",
          url + 'agent/add_agent.php',
          agentDistributorActionEntity.toMap(),
          agentDistributorActionEntity.filelogo,
          null,
        );
      } else {
        response = await Api().postRequestWithFile(
          "array",
          url + 'agent/update_agent.php?id_agent=$agentId',
          agentDistributorActionEntity.toMap(),
          agentDistributorActionEntity.filelogo,
          null,
        );
      }

      resetAgentDistributorActionEntity();
    } catch (e) {
      isLoadingAction = false;
      emit(AgentsDistributorsActionsFailure(e.toString()));
    }
  }

  onSelectADType(ADType type) {
    if (type == agentDistributorActionEntity.type) {
      agentDistributorActionEntity = agentDistributorActionEntity.resetType();
      emit(AgentsDistributorsActionsTypeChanged());
      return;
    }

    agentDistributorActionEntity =
        agentDistributorActionEntity.copyWith(type: type);
    emit(AgentsDistributorsActionsTypeChanged());
  }

  onSelectCountry(String? countryId) {
    agentDistributorActionEntity =
        agentDistributorActionEntity.copyWith(countryId: countryId);
  }

  onSelectCity(String cityId) {
    agentDistributorActionEntity =
        agentDistributorActionEntity.copyWith(cityId: cityId);
  }

  onSaveName(String? name) {
    agentDistributorActionEntity =
        agentDistributorActionEntity.copyWith(name: name);
  }

  onSaveEmail(String email) {
    agentDistributorActionEntity =
        agentDistributorActionEntity.copyWith(email: email);
  }

  onSaveDescription(String description) {
    agentDistributorActionEntity =
        agentDistributorActionEntity.copyWith(description: description);
  }

  onSaveImageFile() {
    agentDistributorActionEntity =
        agentDistributorActionEntity.copyWith(filelogo: logoFile);
  }

  onSavePhoneNumber(String phoneNumber) {
    agentDistributorActionEntity =
        agentDistributorActionEntity.copyWith(phoneNumber: phoneNumber);
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
