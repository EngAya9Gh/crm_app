import 'dart:io';

import 'package:crm_smart/model/agent_distributor_model.dart';
import 'package:crm_smart/model/countrymodel.dart';
import 'package:crm_smart/services/Invoice_Service.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/api.dart';
import '../constants.dart';

enum ADType { distributor, agent }

class AgentDistributorViewModel extends ChangeNotifier {
  PageState<List<AgentDistributorModel>> agentDistributorsState = PageState();
  PageState<List<CountryModel>> countriesState = PageState();

  AgentDistributorActionParams agentDistributorActionParams =
      AgentDistributorActionParams.init();

  CountryModel? selectedCountry;
  bool isLoadingAction = false;

  void resetAgentDistributorActionParams() {
    agentDistributorActionParams = AgentDistributorActionParams.reset();
    selectedCountry = null;
    isLoadingAction = false;
    notifyListeners();
  }

  Future<void> getAgentsAndDistributors() async {
    try {
      if (!agentDistributorsState.isLoading) {
        agentDistributorsState = agentDistributorsState.changeToLoading;
        notifyListeners();
      }
      final list  = await Invoice_Service.getAgentsAndDistributors();

      agentDistributorsState = agentDistributorsState.changeToLoaded(list);
      notifyListeners();
    } catch (e) {
      agentDistributorsState = agentDistributorsState.changeToFailed;
      notifyListeners();
    }
  }

  Future<void> getCountries({String? countryId}) async {
    try {
      if (!countriesState.isLoading) {
        countriesState = countriesState.changeToLoading;
        notifyListeners();
      }

      final response = await Api().get(url: url + 'country/getcountry.php');
      final list = List<CountryModel>.from(
          (response ?? []).map((x) => CountryModel.fromJson(x)));
      countriesState = countriesState.changeToLoaded(list);
      if (countryId != null) {
        final country =
            list.firstWhereOrNull((element) => element.idCountry == countryId);
        if (country != null) {
          selectedCountry = country;
        }
      }
      notifyListeners();
    } catch (e) {
      countriesState = countriesState.changeToFailed;
      notifyListeners();
    }
  }

  Future<void> actionAgentDistributor({
    required VoidCallback onSuccess,
    String? agentId,
  }) async {
    try {
      isLoadingAction = true;
      notifyListeners();

      print(
          "agentDistributorActionParams ${agentDistributorActionParams.toMap().toString()} \n"
          "agentId: $agentId");
      dynamic response;
      if (agentId == null) {
        response = await Api().postRequestWithFile("array",
           url + 'agent/add_agent.php',
            agentDistributorActionParams.toMap(),
            agentDistributorActionParams.filelogo,null
        );
      } else {
        response = await Api().postRequestWithFile("array",
            url + 'agent/update_agent.php?id_agent=$agentId',
            agentDistributorActionParams.toMap(),
            agentDistributorActionParams.filelogo,null

        );
      }

      onSuccess();
      resetAgentDistributorActionParams();
      getAgentsAndDistributors();
    } catch (e, stackTrace) {
      print("stackTrace $stackTrace");
      isLoadingAction = false;
      notifyListeners();
    }
  }

  onSelectADType(ADType type) {
    if (type == agentDistributorActionParams.type) {
      agentDistributorActionParams = agentDistributorActionParams.resetType();
      notifyListeners();
      return;
    }

    agentDistributorActionParams =
        agentDistributorActionParams.copyWith(type: type);
    notifyListeners();
  }

  onSelectCountry(CountryModel countryModel) {
    agentDistributorActionParams = agentDistributorActionParams.copyWith(
        countryId: countryModel.idCountry);
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

class AgentDistributorActionParams {
  String? name;
  ADType? type;
  String? countryId;
  String? email;
  String? phoneNumber;
  String? description;
  File? filelogo;

  AgentDistributorActionParams.init();

  AgentDistributorActionParams.reset()
      : name = null,
        type = null,
        email = null,
        phoneNumber = null,
        description = null,
        countryId = null;
        // filelogo = null;

  AgentDistributorActionParams({
    required this.name,
    required this.type,
    required this.countryId,
    this.email,
    this.phoneNumber,
    this.description,
    required filelogo,
  });

  AgentDistributorActionParams copyWith({
    String? name,
    ADType? type,
    String? countryId,
    String? email,
    String? phoneNumber,
    String? description,
    File? filelogo,
  }) {
    return AgentDistributorActionParams(
      name: name ?? this.name,
      type: type ?? this.type,
      countryId: countryId ?? this.countryId,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      description: description ?? this.description,
      filelogo: filelogo ?? this.filelogo,
    );
  }

  AgentDistributorActionParams resetType() {
    return AgentDistributorActionParams(
      name: name,
      type: null,
      countryId: countryId,
      phoneNumber: phoneNumber,
      description: description,
      email: email, filelogo: null,
    );
  }

  Map<String, dynamic> toMap() => {
        'name_agent': name,
        'type_agent': type?.index.toString(),
        'fk_country': countryId,
        'email_egent': email,
        'mobile_agent': phoneNumber,
        'description': description,
      }..removeWhere((key, value) => value == null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AgentDistributorActionParams &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          type == other.type &&
          countryId == other.countryId &&
          email == other.email &&
          phoneNumber == other.phoneNumber &&
          description == other.description;

  @override
  int get hashCode =>
      name.hashCode ^
      type.hashCode ^
      countryId.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      description.hashCode;

  @override
  String toString() {
    return 'AgentDistributorActionParams{name: $name, type: ${type?.index}, countryId: $countryId, email: $email, phoneNumber: $phoneNumber, description: $description}';
  }
}
