import 'package:crm_smart/ui/screen/client/agents_distributors_invoices_view.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/material.dart';

import '../model/agent_distributor_model.dart';
import '../model/participatModel.dart';
import '../services/Invoice_Service.dart';

class AgentsCollaboratorsInvoicesViewmodel extends ChangeNotifier {
  SellerTypeFilter selectedSellerTypeFilter = SellerTypeFilter.all;
  PageState<List<AgentDistributorModel>> agentDistributorsState = PageState();
  PageState<List<ParticipateModel>> collaboratorsEmployeeState = PageState();
  SellerStatus sellerStatus = SellerStatus.init;

  ParticipateModel? selectedCollaboratorEmployee;
  AgentDistributorModel? selectedAgentDistributor;

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
      collaboratorsEmployeeState = collaboratorsEmployeeState.changeToLoaded(list);
      notifyListeners();
      return;
    } catch (e) {
      collaboratorsEmployeeState = collaboratorsEmployeeState.changeToFailed;
      notifyListeners();
      return;
    }
  }

  Future<void> onChangeSellerTypeFilter(SellerTypeFilter sellerType) async {
    selectedSellerTypeFilter = sellerType;
    notifyListeners();
    if (selectedSellerTypeFilter == SellerTypeFilter.all) {
      return;
    }

    if (![SellerTypeFilter.collaborator, SellerTypeFilter.employee].contains(selectedSellerTypeFilter)) {
      if (agentDistributorsState.data != null) {
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

  onChangeSelectedCollaboratorEmployee(ParticipateModel collaborator) {
    selectedCollaboratorEmployee = collaborator;
    notifyListeners();
  }

  onChangeSelectedAgentDistributor(AgentDistributorModel agentDistributorModel) {
    selectedAgentDistributor = agentDistributorModel;
    notifyListeners();
  }
}
