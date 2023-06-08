import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/client/agents_distributors_invoices_view.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/material.dart';

import '../model/agent_distributor_model.dart';
import '../model/participatModel.dart';
import '../services/Invoice_Service.dart';

class AgentsCollaboratorsInvoicesViewmodel extends ChangeNotifier {
  AgentsCollaboratorsInvoicesViewmodel();

  List<InvoiceModel> invoicesList = [];
  List<InvoiceModel> invoicesFiltered = [];

  PageState<List<AgentDistributorModel>> agentDistributorsState = PageState();
  PageState<List<ParticipateModel>> collaboratorsEmployeeState = PageState();
  SellerStatus sellerStatus = SellerStatus.init;

  SellerTypeFilter selectedSellerTypeFilter = SellerTypeFilter.all;
  ParticipateModel? selectedCollaboratorEmployee;
  AgentDistributorModel? selectedAgentDistributor;
  String? selectedRegion;

  init(){
    invoicesList = [];
    invoicesFiltered = [];
    agentDistributorsState = PageState();
    collaboratorsEmployeeState = PageState();
    sellerStatus = SellerStatus.init;
    selectedSellerTypeFilter = SellerTypeFilter.all;
    selectedCollaboratorEmployee = null;
    selectedAgentDistributor = null;
    selectedRegion = null;
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
      onFilter();
      return;
    }

    if (![SellerTypeFilter.collaborator, SellerTypeFilter.employee].contains(selectedSellerTypeFilter)) {
      if (agentDistributorsState.data != null) {
        onFilter();
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
      onFilter();
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

    onFilter();
    notifyListeners();
  }

  onChangeSelectedAgentDistributor(AgentDistributorModel agentDistributorModel) {
    selectedAgentDistributor = agentDistributorModel;

    onFilter();
    notifyListeners();
  }

  onChangeRegion(String region) {
    selectedRegion = region;

    onFilter();
  }

  onFilter() {
    final list = List<InvoiceModel>.from(invoicesList);

    invoicesFiltered = list.where((element) {
      if (selectedSellerTypeFilter == SellerTypeFilter.all) {
        if (selectedRegion == null || selectedRegion == "0") {
          return true;
        }
        return element.fk_regoin == selectedRegion;
      } else if ([SellerTypeFilter.distributor, SellerTypeFilter.agent].contains(selectedSellerTypeFilter)) {
        if (selectedAgentDistributor == null && selectedRegion != null) {
          return selectedRegion == element.fk_regoin;
        } else if (selectedAgentDistributor != null && (selectedRegion == null || selectedRegion == "0")) {
          return selectedAgentDistributor?.idAgent == element.fk_agent;
        } else if (selectedAgentDistributor != null && selectedRegion != null) {
          return selectedAgentDistributor?.idAgent == element.fk_agent && selectedRegion == element.fk_regoin;
        }
        return true;
      } else if (selectedSellerTypeFilter == SellerTypeFilter.collaborator) {
        if (selectedCollaboratorEmployee == null && selectedRegion != null) {
          return selectedRegion == element.fk_regoin;
        } else if (selectedCollaboratorEmployee != null && (selectedRegion == null || selectedRegion == "0")) {
          return selectedCollaboratorEmployee?.id_participate == element.participate_fk;
        } else if (selectedCollaboratorEmployee != null && selectedRegion != null) {
          return selectedCollaboratorEmployee?.id_participate == element.participate_fk &&
              selectedRegion == element.fk_regoin;
        }
        return true;
      } else {
        if (selectedCollaboratorEmployee == null && selectedRegion != null) {
          return selectedRegion == element.fk_regoin;
        } else if (selectedCollaboratorEmployee != null && (selectedRegion == null || selectedRegion == "0")) {
          return selectedCollaboratorEmployee?.id_participate == element.fkIdUser;
        } else if (selectedCollaboratorEmployee != null && selectedRegion != null) {
          return selectedCollaboratorEmployee?.id_participate == element.fkIdUser &&
              selectedRegion == element.fk_regoin;
        }
        return true;
      }
    }).toList();

    notifyListeners();
  }
}
