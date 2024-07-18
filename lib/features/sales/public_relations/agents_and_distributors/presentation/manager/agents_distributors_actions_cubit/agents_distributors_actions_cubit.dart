import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/common/enums/agents/agent_source_enum.dart';
import '../../../../../../../core/common/enums/enums.dart';
import '../../../../../../../model/maincitymodel.dart';
import '../../../../../../common/cities/domain/use_cases/get_cities_usecase.dart';
import '../../../data/models/agent_distributor_action_model.dart';
import '../../../data/models/agent_distributor_model.dart';
import '../../../domain/use_cases/add_agent_usecase.dart';
import '../../../domain/use_cases/update_agent_usecase.dart';

part 'agents_distributors_actions_state.dart';

@injectable
class AgentsDistributorsActionsCubit
    extends Cubit<AgentsDistributorsActionsState> {
  final GetCitiesUseCase _getAllCitiesUseCase;
  final AddAgentUseCase _addAgentUseCase;
  final UpdateAgentUseCase _updateAgentUseCase;

  AgentsDistributorsActionsCubit(
    this._getAllCitiesUseCase,
    this._addAgentUseCase,
    this._updateAgentUseCase,
  ) : super(AgentsDistributorsActionsInitial());

  // support tab Keys and controllers
  final supportFormKey = GlobalKey<FormState>();
  final TextEditingController supportSelectedDateController =
      TextEditingController();
  final TextEditingController supportDateTypeController =
      TextEditingController();

  // keys and controllers
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nameAgentEnterpriseController =
      TextEditingController();
  AgentSourceEnum? selectedAgentSource;
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
      nameAgentEnterpriseController.text =
          agentDistributorModel.agentEnterprise ?? '';
      selectedAgentSource =
          AgentSourceEnum.fromString(agentDistributorModel.source);
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
        agentEnterprise: agentDistributorModel.agentEnterprise,
        source: agentDistributorModel.source,
      );
    }
  }

  void _loadCurrentCity(String? cityId) {
    selectedCountryFromCity = citiesList.firstWhereOrNull(
      (element) => element.idCity == cityId,
    );
    emit(AgentsDistributorsActionsCityChanged());
  }

  void resetAgentDistributorActionEntity() {
    agentDistributorActionModel = AgentDistributorActionModel();
    selectedCountry = null;
    selectedCountryFromCity = null;
    selectedAgentSource = null;
    nameController.clear();
    nameAgentEnterpriseController.clear();
    emailController.clear();
    phoneNumberController.clear();
    descriptionController.clear();
    logoController.clear();
    supportSelectedDateController.clear();
    supportDateTypeController.clear();
    logoFile = null;
    emit(AgentsDistributorsActionsInitial());
  }

  Future<void> getAllCity({
    required String fkCountry,
    String? regionId,
  }) async {
    emit(AgentsDistributorsActionsLoading());

    final response = await _getAllCitiesUseCase(
      GetCitiesParams(
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
              .firstWhereOrNull((element) => element.idCity == regionId);
          if (country != null) {
            selectedCountryFromCity = country;
          }
        }
        emit(AgentsDistributorsActionsSuccess());
        _loadCurrentCity(agentDistributorActionModel.cityId);
      },
    );
  }

  Future<AgentDistributorModel?> addAgent() async {
    emit(AgentsDistributorsActionsLoading());
    final response = await _addAgentUseCase(
      AddAgentParams(agentActionModel: agentDistributorActionModel),
    );

    return response.fold(
      (l) {
        emit(AgentsDistributorsActionsFailure(l));
        return null;
      },
      (r) {
        emit(AgentsDistributorsActionsSuccess());
        return r;
      },
    );
  }

  Future<void> updateAgent({
    required String agentId,
  }) async {
    emit(AgentsDistributorsActionsLoading());
    final response = await _updateAgentUseCase(
      UpdateAgentParams(
        agentId: agentId,
        agentActionModel: agentDistributorActionModel,
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

  Future<AgentDistributorModel?> actionAgentDistributor({
    String? agentId,
    String? currentUser,
  }) async {
    getCurrentUser(currentUser);
    if (agentId == null) {
      return await addAgent();
    } else {
      await updateAgent(agentId: agentId);
    }
    resetAgentDistributorActionEntity();
    return null;
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

  onSaveEnterpriseName(String? name) {
    agentDistributorActionModel =
        agentDistributorActionModel.copyWith(agentEnterprise: name);
  }

  onSaveAgentSource(AgentSourceEnum? source) {
    selectedAgentSource = source;
    agentDistributorActionModel =
        agentDistributorActionModel.copyWith(source: source?.value);
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
    supportSelectedDateController.dispose();
    supportDateTypeController.dispose();
    return super.close();
  }
}
