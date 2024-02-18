import 'dart:async';
import 'dart:io';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../api/api.dart';
import '../../../../../common/enums/enums.dart';
import '../../../../../constants.dart';
import '../../../../../model/agent_distributor_model.dart';
import '../../../../../model/maincitymodel.dart';
import '../../../../../services/Invoice_Service.dart';
import '../../../../../view_model/agent_dsitributor_vm.dart';
import '../../../../../view_model/page_state.dart';

part 'manage_agents_and_distributors_state.dart';

class ManageAgentsAndDistributorsCubit
    extends Cubit<ManageAgentsAndDistributorsState> {
  ManageAgentsAndDistributorsCubit()
      : super(ManageAgentsAndDistributorsState());

  PageState<List<MainCityModel>> citiesState0 = PageState();
  PageState<List<CityModel>> citiesState = PageState();

  AgentDistributorActionParams agentDistributorActionParams =
      AgentDistributorActionParams.init();

  MainCityModel? selectedCountry;
  CityModel? selectedCountryFromCity;
  bool isLoadingAction = false;
  List<CityModel> listcity = [];

  void resetAgentDistributorActionParams() {
    agentDistributorActionParams = AgentDistributorActionParams.reset();
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

      final List<AgentDistributorModel> agents =
          await Invoice_Service.getAgentsAndDistributors();
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

  Future<void> getAllCity({String? fkCountry, String? id_maincity}) async {
    try {
      if (citiesState.isLoading) return;
      // todo : emit new actions state
      emit(state.copyWith(
        status: StateStatus.loading,
      ));

      List<dynamic> data = [];
      data = await Api()
          .get(url: url + 'config/getcity.php?fk_country=${fkCountry!}');

      if (data != null) {
        for (int i = 0; i < data.length; i++) {
          listcity.add(CityModel.fromJson(data[i]));
          print(listcity[i].name_city);
        }
      }
      if (id_maincity != null) {
        final country = listcity
            .firstWhereOrNull((element) => element.id_city == id_maincity);
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
    } catch (e, stackTrace) {
      // todo : emit new actions state
      emit(state.copyWith(
        status: StateStatus.failure,
      ));
    }
  }

  onSelectADType(ADType type) {
    if (type == agentDistributorActionParams.type) {
      agentDistributorActionParams = agentDistributorActionParams.resetType();
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
