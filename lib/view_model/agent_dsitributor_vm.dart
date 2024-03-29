// import 'dart:io';
//
// import 'package:collection/collection.dart';
// import 'package:crm_smart/model/agent_distributor_model.dart';
// import 'package:crm_smart/model/maincitymodel.dart';
// import 'package:crm_smart/services/Invoice_Service.dart';
// import 'package:crm_smart/view_model/page_state.dart';
// import 'package:flutter/material.dart';
//
// import '../api/api.dart';
// import '../constants.dart';
//
// enum ADType { distributor, agent }
//
// class AgentDistributorViewModel extends ChangeNotifier {
//   PageState<List<AgentDistributorModel>> agentDistributorsState = PageState();
//   PageState<List<MainCityModel>> citiesState0 = PageState();
//   PageState<List<CityModel>> citiesState = PageState();
//
//   AgentDistributorActionParams agentDistributorActionParams =
//       AgentDistributorActionParams.init();
//
//   MainCityModel? selectedCountry;
//   CityModel? selectedCountryFromCity;
//   bool isLoadingAction = false;
//
//   void resetAgentDistributorActionParams() {
//     agentDistributorActionParams = AgentDistributorActionParams.reset();
//     selectedCountry = null;
//     selectedCountryFromCity = null;
//     isLoadingAction = false;
//     notifyListeners();
//   }
//
//   Future<void> getAgentsAndDistributors() async {
//     try {
//       if (!agentDistributorsState.isLoading) {
//         agentDistributorsState = agentDistributorsState.changeToLoading;
//         notifyListeners();
//       }
//       final list  = await Invoice_Service.getAgentsAndDistributors();
//
//
//       agentDistributorsState = agentDistributorsState.changeToLoaded(list!);
//       notifyListeners();
//     } catch (e) {
//       print(e.toString());
//       agentDistributorsState = agentDistributorsState.changeToFailed;
//       notifyListeners();
//     }
//   }
//   List<CityModel> listcity = [];
//   Future<void> getAllCity({ String ?fkCountry, String? id_maincity}) async {
//     try {
//       if (!citiesState.isLoading) {
//         citiesState = citiesState.changeToLoading;
//         notifyListeners();
//       }
//       List<dynamic> data = [];
//       data = await Api().get(url: EndPoints.baseUrls.url +  'config/getcity.php?fk_country=${fkCountry!}');
//
//       if (data != null) {
//         for (int i = 0; i < data.length; i++) {
//           listcity.add(CityModel.fromJson(data[i]));
//           print(listcity[i].name_city);
//         }
//
//       }
//     if (id_maincity != null) {
//     final country =
//     listcity.firstWhereOrNull((element) => element.id_city == id_maincity);
//     if (country != null) {
//       selectedCountryFromCity = country;
//     }
//     }
//       citiesState = citiesState.changeToLoaded(listcity);
//       print("#######################################");
//       print(listcity);
//       print(listcity.length);
//       notifyListeners();
//     } catch (e) {
//       citiesState = citiesState.changeToFailed;
//       notifyListeners();
//     }
//   }
//
//
//   Future<void> actionAgentDistributor({
//     required VoidCallback onSuccess,
//     String? agentId,
//   }) async {
//     try {
//       isLoadingAction = true;
//       notifyListeners();
//       dynamic response;
//       if (agentId == null) {
//         response = await Api().postRequestWithFile("array",
//            EndPoints.baseUrls.url +  'agent/add_agent.php',
//             agentDistributorActionParams.toMap(),
//             agentDistributorActionParams.filelogo,null
//         );
//       } else {
//         response = await Api().postRequestWithFile("array",
//             EndPoints.baseUrls.url +  'agent/update_agent.php?id_agent=$agentId',
//             agentDistributorActionParams.toMap(),
//             agentDistributorActionParams.filelogo,null
//
//         );
//       }
//
//       onSuccess();
//       resetAgentDistributorActionParams();
//       getAgentsAndDistributors();
//     } catch (e, stackTrace) {
//
//       isLoadingAction = false;
//       notifyListeners();
//     }
//   }
//
//   onSelectADType(ADType type) {
//     if (type == agentDistributorActionParams.type) {
//       agentDistributorActionParams = agentDistributorActionParams.resetType();
//       notifyListeners();
//       return;
//     }
//
//     agentDistributorActionParams =
//         agentDistributorActionParams.copyWith(type: type);
//     notifyListeners();
//   }
//
//   onSelectCountry(String? countryId) {
//     agentDistributorActionParams = agentDistributorActionParams.copyWith(
//         countryId:countryId);
//   }
//   onSelectCity(CityModel cityModel) {
//     agentDistributorActionParams = agentDistributorActionParams.copyWith(
//         cityId: cityModel.id_city);
//   }
//   onSaveName(String name) {
//     agentDistributorActionParams =
//         agentDistributorActionParams.copyWith(name: name);
//   }
//
//   onSaveEmail(String email) {
//     agentDistributorActionParams =
//         agentDistributorActionParams.copyWith(email: email);
//   }
//
//   onSaveDescription(String description) {
//     agentDistributorActionParams =
//         agentDistributorActionParams.copyWith(description: description);
//   }
//   onSaveimagefile(File? filelogo) {
//     agentDistributorActionParams =
//         agentDistributorActionParams.copyWith(filelogo: filelogo);
//   }
//
//   onSavePhoneNumber(String phoneNumber) {
//     agentDistributorActionParams =
//         agentDistributorActionParams.copyWith(phoneNumber: phoneNumber);
//   }
// }
//
// class AgentDistributorActionParams {
//   String? name;
//   ADType? type;
//   String? countryId;
//   String? cityId;
//   String? email;
//   String? phoneNumber;
//   String? description;
//   File? filelogo;
//
//   AgentDistributorActionParams.init();
//
//   AgentDistributorActionParams.reset()
//       : name = null,
//         type = null,
//         email = null,
//         phoneNumber = null,
//         description = null,
//         countryId = null;
//         // filelogo = null;
//
//   AgentDistributorActionParams({
//     required this.name,
//     required this.type,
//     this.countryId,
//     this.email,
//     this.phoneNumber,
//     this.description,
//     required filelogo, this.cityId,
//   });
//
//   AgentDistributorActionParams copyWith({
//     String? name,
//     ADType? type,
//     String? countryId,
//     String? cityId,
//     String? email,
//     String? phoneNumber,
//     String? description,
//     File? filelogo,
//   }) {
//     return AgentDistributorActionParams(
//       name: name ?? this.name,
//       type: type ?? this.type,
//       countryId: countryId ?? this.countryId,
//       cityId: cityId ?? this.cityId,
//       email: email ?? this.email,
//       phoneNumber: phoneNumber ?? this.phoneNumber,
//       description: description ?? this.description,
//       filelogo: filelogo ?? this.filelogo,
//     );
//   }
//
//   AgentDistributorActionParams resetType() {
//     return AgentDistributorActionParams(
//       name: name,
//       type: null,
//       countryId: countryId,
//       cityId: cityId,
//       phoneNumber: phoneNumber,
//       description: description,
//       email: email, filelogo: null,
//     );
//   }
//
//   Map<String, dynamic> toMap() => {
//         'name_agent': name,
//         'type_agent': type?.index.toString(),
//         'fk_country': countryId,
//         'cityId': cityId,
//         'email_egent': email,
//         'mobile_agent': phoneNumber,
//         'description': description,
//       }..removeWhere((key, value) => value == null);
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is AgentDistributorActionParams &&
//           runtimeType == other.runtimeType &&
//           name == other.name &&
//           type == other.type &&
//           countryId == other.countryId &&
//           cityId == other.cityId &&
//           email == other.email &&
//           phoneNumber == other.phoneNumber &&
//           description == other.description;
//
//   @override
//   int get hashCode =>
//       name.hashCode ^
//       type.hashCode ^
//       countryId.hashCode ^
//       email.hashCode ^
//       phoneNumber.hashCode ^
//       cityId.hashCode ^
//       description.hashCode;
//
//   @override
//   String toString() {
//     return 'AgentDistributorActionParams{name: $name, type: ${type?.index}, countryId: $countryId, email: $email, phoneNumber: $phoneNumber, description: $description}';
//   }
// }
