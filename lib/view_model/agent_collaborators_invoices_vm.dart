import 'package:flutter/material.dart';

import '../core/common/enums/seller_type_enum.dart';
import '../features/sales/public_relations/agents_and_distributors/data/models/agent_distributor_model.dart';
import '../model/invoiceModel.dart';
import '../model/participatModel.dart';
import '../model/usermodel.dart';
import '../services/Invoice_Service.dart';
import 'invoice_vm.dart';
import 'page_state.dart';

class AgentsCollaboratorsInvoicesViewmodel extends ChangeNotifier {
  AgentsCollaboratorsInvoicesViewmodel();

  List<InvoiceModel> invoicesList = [];
  List<InvoiceModel> invoicesFiltered = [];

  PageState<List<AgentDistributorModel>> agentDistributorsState = PageState();
  PageState<List<ParticipateModel>> collaboratorsEmployeeState = PageState();
  SellerStatus sellerStatus = SellerStatus.init;

  SellerTypeEnum selectedSellerTypeFilter = SellerTypeEnum.all;
  ParticipateModel? selectedCollaborator;
  UserModel? selectedEmployee;
  AgentDistributorModel? selectedAgentDistributor;
  String? selectedRegion;
  String? selectednotReady;

  DateTime from = DateTime(1, 1, 1);
  DateTime to = DateTime(1, 1, 1);

  init() {
    invoicesList = [];
    invoicesFiltered = [];
    agentDistributorsState = PageState();
    collaboratorsEmployeeState = PageState();
    sellerStatus = SellerStatus.init;
    selectedSellerTypeFilter = SellerTypeEnum.all;
    selectedCollaborator = null;
    selectedEmployee = null;
    selectedAgentDistributor = null;
    selectedRegion = null;
    selectednotReady = null;
    from = DateTime(1, 1, 1);
    to = DateTime(1, 1, 1);
    notifyListeners();
  }

  void clearUser() {
    selectedCollaborator = null;
    selectedEmployee = null;
    selectedAgentDistributor = null;
    notifyListeners();
  }

  setInvoicesList(List<InvoiceModel> invoices) {
    invoicesList = invoices;
    invoicesFiltered = invoices;
    notifyListeners();
  }

  Future<void> getAgentsAndDistributors() async {
    try {
      if (!agentDistributorsState.isLoading) {
        agentDistributorsState = agentDistributorsState.changeToLoading;
        notifyListeners();
      }

      final list = await Invoice_Service.getAgentsAndDistributors();
      agentDistributorsState = agentDistributorsState.changeToLoaded(list);
      notifyListeners();
      return;
    } catch (e) {
      agentDistributorsState = agentDistributorsState.changeToFailed;
      notifyListeners();
      return;
    }
  }

  Future<void> getCollaborators() async {
    try {
      if (!collaboratorsEmployeeState.isLoading) {
        collaboratorsEmployeeState = collaboratorsEmployeeState.changeToLoading;
        notifyListeners();
      }

      final list = await Invoice_Service.getCollaborators();
      collaboratorsEmployeeState =
          collaboratorsEmployeeState.changeToLoaded(list);
      notifyListeners();
      return;
    } catch (e) {
      collaboratorsEmployeeState = collaboratorsEmployeeState.changeToFailed;
      notifyListeners();
      return;
    }
  }

  Future<void> onChangeSellerTypeFilter(SellerTypeEnum sellerType) async {
    selectedSellerTypeFilter = sellerType;
    notifyListeners();
    if (selectedSellerTypeFilter == SellerTypeEnum.all) {
      return;
    }

    if (selectedSellerTypeFilter == SellerTypeEnum.employee) {
      selectedEmployee = null;
      notifyListeners();

      return;
    }

    if ([SellerTypeEnum.agent, SellerTypeEnum.distributor]
        .contains(selectedSellerTypeFilter)) {
      if (agentDistributorsState.data != null) {
        selectedAgentDistributor = null;
        notifyListeners();

        return;
      }

      sellerStatus = SellerStatus.loading;
      notifyListeners();

      await getAgentsAndDistributors();
      if (agentDistributorsState.isSuccess) {
        sellerStatus = SellerStatus.loaded;
      } else {
        sellerStatus = SellerStatus.failed;
      }
      notifyListeners();
      return;
    }

    if (collaboratorsEmployeeState.data != null) {
      selectedCollaborator = null;
      notifyListeners();

      return;
    }

    sellerStatus = SellerStatus.loading;
    notifyListeners();

    await getCollaborators();
    if (collaboratorsEmployeeState.isSuccess) {
      sellerStatus = SellerStatus.loaded;
    } else {
      sellerStatus = SellerStatus.failed;
    }
    notifyListeners();

    return;
  }

  onChangeSelectedCollaborator(ParticipateModel collaborator) {
    selectedCollaborator = collaborator;
    notifyListeners();
  }

  onChangeSelectedAgentDistributor(
      AgentDistributorModel agentDistributorModel) {
    selectedAgentDistributor = agentDistributorModel;

    notifyListeners();
  }

  onSearch(String query) {
    final list = List<InvoiceModel>.from(invoicesList);
    invoicesFiltered = list.where((element) {
      return (element.name_enterprise
                  ?.toLowerCase()
                  .contains(query.toLowerCase()) ??
              false) ||
          (element.name_regoin_invoice
                  ?.toLowerCase()
                  .contains(query.toLowerCase()) ??
              false) ||
          (element.mobile?.toLowerCase().contains(query.toLowerCase()) ??
              false);
    }).toList();
    notifyListeners();
  }

  void onChangeEmployee(UserModel seller) {
    selectedEmployee = seller;

    notifyListeners();
  }
}
