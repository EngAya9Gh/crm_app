import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../../api/api.dart';
import '../../../../../common/enums/enums.dart';
import '../../../../../constants.dart';
import '../../../../../model/agent_distributor_model.dart';
import '../../../../../model/maincitymodel.dart';
import '../../../../../services/Invoice_Service.dart';
import '../../../../../view_model/page_state.dart';
import '../../../domain/entities/agent_distributor_action_entity.dart';

part 'agents_distributors_actions_state.dart';

class AgentsDistributorsActionsCubit
    extends Cubit<AgentsDistributorsActionsState> {
  AgentsDistributorsActionsCubit() : super(AgentsDistributorsActionsInitial());

  // keys and controllers
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController logoController = TextEditingController();
  File? logoFile;

  PageState<List<AgentDistributorModel>> agentDistributorsState = PageState();
  PageState<List<MainCityModel>> citiesState0 = PageState();
  PageState<List<CityModel>> citiesState = PageState();

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

  loadUserData(AgentDistributorModel agentDistributorModel) {}

  Future<void> getAgentsAndDistributors() async {
    try {
      emit(AgentsDistributorsActionsLoading());
      final list = await Invoice_Service.getAgentsAndDistributors();
      emit(AgentsDistributorsActionsSuccess());
    } catch (e) {
      print(e.toString());
      emit(AgentsDistributorsActionsFailure(e.toString()));
    }
  }

  List<CityModel> listcity = [];

  Future<void> getAllCity({
    required String fkCountry,
    String? regionId,
  }) async {
    try {
      emit(AgentsDistributorsActionsLoading());
      List<dynamic> data = [];
      data = await Api()
          .get(url: url + 'config/getcity.php?fk_country=${fkCountry!}');

      for (int i = 0; i < data.length; i++) {
        listcity.add(CityModel.fromJson(data[i]));
        print(listcity[i].name_city);
      }
      if (regionId != null) {
        final country =
            listcity.firstWhereOrNull((element) => element.id_city == regionId);
        if (country != null) {
          selectedCountryFromCity = country;
        }
      }
      citiesState = citiesState.changeToLoaded(listcity);
      emit(AgentsDistributorsActionsSuccess());
    } catch (e) {
      citiesState = citiesState.changeToFailed;
      emit(AgentsDistributorsActionsFailure(e.toString()));
    }
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
      getAgentsAndDistributors();
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

  onSelectCity(CityModel cityModel) {
    agentDistributorActionEntity =
        agentDistributorActionEntity.copyWith(cityId: cityModel.id_city);
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

  onSaveimagefile() {
    agentDistributorActionEntity =
        agentDistributorActionEntity.copyWith(filelogo: logoFile);
  }

  onSavePhoneNumber(String phoneNumber) {
    agentDistributorActionEntity =
        agentDistributorActionEntity.copyWith(phoneNumber: phoneNumber);
  }

// AgentDistributorActionEntity resetType() {
//   return AgentDistributorActionEntity(
//     name: name,
//     type: null,
//     countryId: countryId,
//     cityId: cityId,
//     phoneNumber: phoneNumber,
//     description: description,
//     email: email, filelogo: null,
//   );
// }

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
