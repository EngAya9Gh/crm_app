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

  final formKey = GlobalKey<FormState>();

  PageState<List<AgentDistributorModel>> agentDistributorsState = PageState();
  PageState<List<MainCityModel>> citiesState0 = PageState();
  PageState<List<CityModel>> citiesState = PageState();

  AgentDistributorActionEntity agentDistributorActionParams =
      AgentDistributorActionEntity();

  MainCityModel? selectedCountry;
  CityModel? selectedCountryFromCity;
  bool isLoadingAction = false;

  void resetAgentDistributorActionParams() {
    agentDistributorActionParams = AgentDistributorActionEntity();
    selectedCountry = null;
    selectedCountryFromCity = null;
    isLoadingAction = false;
    emit(AgentsDistributorsActionsInitial());
  }

  Future<void> getAgentsAndDistributors() async {
    try {
      if (!agentDistributorsState.isLoading) {
        agentDistributorsState = agentDistributorsState.changeToLoading;
        emit(AgentsDistributorsActionsLoading());
      }
      final list = await Invoice_Service.getAgentsAndDistributors();

      agentDistributorsState = agentDistributorsState.changeToLoaded(list!);
      emit(AgentsDistributorsActionsSuccess());
    } catch (e) {
      print(e.toString());
      agentDistributorsState = agentDistributorsState.changeToFailed;
      emit(AgentsDistributorsActionsFailure(e.toString()));
    }
  }

  List<CityModel> listcity = [];

  Future<void> getAllCity({String? fkCountry, String? id_maincity}) async {
    try {
      if (!citiesState.isLoading) {
        citiesState = citiesState.changeToLoading;
        emit(AgentsDistributorsActionsLoading());
      }
      List<dynamic> data = [];
      data = await Api()
          .get(url: url + 'config/getcity.php?fk_country=${fkCountry!}');

      for (int i = 0; i < data.length; i++) {
        listcity.add(CityModel.fromJson(data[i]));
        print(listcity[i].name_city);
      }
      if (id_maincity != null) {
        final country = listcity
            .firstWhereOrNull((element) => element.id_city == id_maincity);
        if (country != null) {
          selectedCountryFromCity = country;
        }
      }
      citiesState = citiesState.changeToLoaded(listcity);
      print("#######################################");
      print(listcity);
      print(listcity.length);
      emit(AgentsDistributorsActionsSuccess());
    } catch (e) {
      citiesState = citiesState.changeToFailed;
      emit(AgentsDistributorsActionsFailure(e.toString()));
    }
  }

  Future<void> actionAgentDistributor({
    required VoidCallback onSuccess,
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
            agentDistributorActionParams.toMap(),
            agentDistributorActionParams.filelogo,
            null);
      } else {
        response = await Api().postRequestWithFile(
            "array",
            url + 'agent/update_agent.php?id_agent=$agentId',
            agentDistributorActionParams.toMap(),
            agentDistributorActionParams.filelogo,
            null);
      }

      onSuccess();
      resetAgentDistributorActionParams();
      getAgentsAndDistributors();
    } catch (e, stackTrace) {
      isLoadingAction = false;
      emit(AgentsDistributorsActionsFailure(e.toString()));
    }
  }

  onSelectADType(ADType type) {
    if (type == agentDistributorActionParams.type) {
      agentDistributorActionParams = agentDistributorActionParams.resetType();
      emit(AgentsDistributorsActionsSuccess());
      return;
    }

    agentDistributorActionParams =
        agentDistributorActionParams.copyWith(type: type);
    emit(AgentsDistributorsActionsSuccess());
  }

  onSelectCountry(String? countryId) {
    agentDistributorActionParams =
        agentDistributorActionParams.copyWith(countryId: countryId);
  }

  onSelectCity(CityModel cityModel) {
    agentDistributorActionParams =
        agentDistributorActionParams.copyWith(cityId: cityModel.id_city);
  }

  onSaveName(String name) {
    agentDistributorActionParams =
        agentDistributorActionParams.copyWith(name: name);
  }

  onSaveEmail(String email) {
    agentDistributorActionParams =
        agentDistributorActionParams.copyWith(email: email);
  }

  onSaveDescription(String description) {
    agentDistributorActionParams =
        agentDistributorActionParams.copyWith(description: description);
  }

  onSaveimagefile(File? filelogo) {
    agentDistributorActionParams =
        agentDistributorActionParams.copyWith(filelogo: filelogo);
  }

  onSavePhoneNumber(String phoneNumber) {
    agentDistributorActionParams =
        agentDistributorActionParams.copyWith(phoneNumber: phoneNumber);
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
}
