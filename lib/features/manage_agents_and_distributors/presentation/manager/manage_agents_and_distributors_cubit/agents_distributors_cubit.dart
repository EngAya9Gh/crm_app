import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../api/api.dart';
import '../../../../../common/enums/enums.dart';
import '../../../../../constants.dart';
import '../../../../../model/agent_distributor_model.dart';
import '../../../../../model/maincitymodel.dart';
import '../../../../../services/Invoice_Service.dart';
import '../../../../../view_model/page_state.dart';
import '../../../domain/entities/agent_distributor_action_entity.dart';

part 'agents_distributors_state.dart';

class AgentsDistributorsCubit extends Cubit<AgentsDistributorsState> {
  AgentsDistributorsCubit() : super(AgentsDistributorsState());

  PageState<List<MainCityModel>> citiesState0 = PageState();
  PageState<List<CityModel>> citiesState = PageState();

  AgentDistributorActionEntity agentDistributorActionParams =
      AgentDistributorActionEntity();

  MainCityModel? selectedCountry;
  CityModel? selectedCountryFromCity;
  bool isLoadingAction = false;
  List<CityModel> listcity = [];

  void resetAgentDistributorActionParams() {
    agentDistributorActionParams = AgentDistributorActionEntity();
    selectedCountry = null;
    selectedCountryFromCity = null;
    isLoadingAction = false;
    // todo : emit new actions state
  }

  Future<void> getAgentsAndDistributors() async {
    try {
      if (state.status == StateStatus.loading) return;
      emit(state.copyWith(
        status: StateStatus.loading,
      ));
      print("loading agents and distributors...");

      final List<AgentDistributorModel> agents =
          await Invoice_Service.getAgentsAndDistributors();

      print("agetns => $agents");
      emit(state.copyWith(
        status: StateStatus.success,
        agentsAndDistributorsList: agents,
      ));
    } catch (e) {
      print(e.toString());
      emit(state.copyWith(
        status: StateStatus.failure,
      ));
    }
  }

  Future<void> getAllCity({String? fkCountry, String? regionId}) async {
    try {
      if (citiesState.isLoading) return;
      // todo : emit new actions state
      emit(state.copyWith(
        status: StateStatus.loading,
      ));

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
      // todo : emit new actions state
      emit(state.copyWith(
        status: StateStatus.success,
      ));
    } catch (e) {
      print(e.toString());
      // todo : emit new actions state
      emit(state.copyWith(
        status: StateStatus.failure,
      ));
    }
  }

  Future<void> actionAgentDistributor({
    required VoidCallback onSuccess,
    String? agentId,
  }) async {
    try {
      // todo : emit new actions state
      emit(state.copyWith(
        status: StateStatus.loading,
      ));
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
    } catch (e) {
      // todo : emit new actions state
      emit(state.copyWith(
        status: StateStatus.failure,
      ));
    }
  }

  onSelectADType(ADType type) {
    if (type == agentDistributorActionParams.type) {
      agentDistributorActionParams = agentDistributorActionParams.copyWith(
        type: null,
        filelogo: null,
      );
      // todo : emit new actions state
      return;
    }

    agentDistributorActionParams =
        agentDistributorActionParams.copyWith(type: type);
    // todo : emit new actions state
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
}
