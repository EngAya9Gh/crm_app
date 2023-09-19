import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/usermodel.dart';
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
  ParticipateModel? selectedCollaborator;
  UserModel? selectedEmployee;
  AgentDistributorModel? selectedAgentDistributor;
  String? selectedRegion;

  DateTime from=DateTime(1,1,1);
  DateTime to=DateTime(1,1,1) ;
  init() {
    invoicesList = [];
    invoicesFiltered = [];
    agentDistributorsState = PageState();
    collaboratorsEmployeeState = PageState();
    sellerStatus = SellerStatus.init;
    selectedSellerTypeFilter = SellerTypeFilter.all;
    selectedCollaborator = null;
    selectedEmployee = null;
    selectedAgentDistributor = null;
    selectedRegion = null;
     from=DateTime(1,1,1);
     to=DateTime(1,1,1) ;
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

    if (selectedSellerTypeFilter == SellerTypeFilter.employee) {
      selectedEmployee = null;
      notifyListeners();
      onFilter();
      return;
    }

    if ([SellerTypeFilter.agent, SellerTypeFilter.distributor].contains(selectedSellerTypeFilter)) {
      if (agentDistributorsState.data != null) {
        selectedAgentDistributor = null;
        notifyListeners();
        onFilter();
        return;
      }

      sellerStatus = SellerStatus.loading;
      notifyListeners();

      await getAgentsAndDistributors();
      if (agentDistributorsState.isSuccess) {
        sellerStatus = SellerStatus.loaded;
        onFilter();
      } else {
        sellerStatus = SellerStatus.failed;
      }
      notifyListeners();
      return;
    }

    if (collaboratorsEmployeeState.data != null) {
      selectedCollaborator = null;
      notifyListeners();
      onFilter();
      return;
    }

    sellerStatus = SellerStatus.loading;
    notifyListeners();

    await getCollaborators();
    if (collaboratorsEmployeeState.isSuccess) {
      sellerStatus = SellerStatus.loaded;
      onFilter();
    } else {
      sellerStatus = SellerStatus.failed;
    }
    notifyListeners();

    return;
  }

  onChangeSelectedCollaborator(ParticipateModel collaborator) {
    selectedCollaborator = collaborator;
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

  onChange_date(DateTime from_param, DateTime to_param) {
    // selectedRegion = region;
    from=from_param;
    to=to_param;
    notifyListeners();
    print('from '+from.toString());
    print('to '+to.toString());
    onFilter();
  }

  onSearch(String query) {
    final list = List<InvoiceModel>.from(invoicesList);
    invoicesFiltered = list.where((element) {
      return (element.name_enterprise?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
          (element.name_regoin_invoice?.toLowerCase().contains(query.toLowerCase()) ?? false);
    }).toList();
    notifyListeners();
  }

  onFilter() {
    final list = List<InvoiceModel>.from(invoicesList);
    invoicesFiltered=[];
    invoicesFiltered = list.where((element) {
      if (isSelectedSellerTypeFilterEqualAll) {
        if (isSelectedRegionEqualAll) {
          return true;
        }
        return isSelectedRegionEqualInvoice(element);
      } else if (isSelectedSellerTypeFilterEqualAgentOrDistributor) {
        if (isSelectedAgentDistributorEqualNull && isSelectedRegionNotEqualAll) {
          return isSelectedRegionEqualInvoice(element) && isSelectedSellerTypeFilterEqualInvoice(element);
        } else if (!isSelectedAgentDistributorEqualNull && isSelectedRegionEqualAll) {
          return isSelectedAgentDistributorEqualInvoice(element);
        } else if (!isSelectedAgentDistributorEqualNull && isSelectedRegionNotEqualAll) {
          return isSelectedAgentDistributorEqualInvoice(element) && isSelectedRegionEqualInvoice(element);
        }

        return isSelectedSellerTypeFilterEqualInvoice(element);
      } else if (isSelectedTypeEqualCollaborator) {
        if (isSelectedCollaboratorEqualNull && isSelectedRegionNotEqualAll) {
          return isSelectedRegionEqualInvoice(element) && isSelectedSellerTypeFilterEqualInvoice(element);
        } else if (!isSelectedCollaboratorEqualNull && isSelectedRegionEqualAll) {
          return isSelectedCollaborateEqualInvoice(element);
        } else if (!isSelectedCollaboratorEqualNull && isSelectedRegionNotEqualAll) {
          return isSelectedCollaborateEqualInvoice(element) && isSelectedRegionEqualInvoice(element);
        }

        return isSelectedSellerTypeFilterEqualInvoice(element);
      } else {
        if (isSelectedEmployeeEqualNull && isSelectedRegionNotEqualAll) {
          return isSelectedRegionEqualInvoice(element) &&
              (isSelectedSellerTypeFilterEqualInvoice(element) || element.type_seller == null);
        } else if (!isSelectedEmployeeEqualNull && isSelectedRegionEqualAll) {
          return isSelectedEmployeeEqualInvoice(element);
        } else if (!isSelectedEmployeeEqualNull && isSelectedRegionNotEqualAll) {
          return isSelectedEmployeeEqualInvoice(element) && isSelectedRegionEqualInvoice(element);
        }

        return isSelectedSellerTypeFilterEqualInvoice(element) || element.type_seller == null ;
      }
    }).toList();
    List<InvoiceModel> invoicesFiltered_temp = [];
    print('invoicesFiltered.length');

    print(invoicesFiltered.length);
     if(invoicesFiltered.isEmpty)
      list.forEach((element) {
      if (  DateTime.parse(element.date_approve.toString()).isAfter(from) &&
          DateTime.parse(element.date_approve.toString()).isBefore(to)) {
        invoicesFiltered_temp.add(element);
      }
    });
    else
    invoicesFiltered.forEach((element) {
      if (DateTime.parse(element.date_approve.toString()).isAfter(from) &&
          DateTime.parse(element.date_approve.toString()).isBefore(to)) {
        invoicesFiltered_temp.add(element);
      }
    });
    print(invoicesFiltered.length);

    invoicesFiltered=List.from(invoicesFiltered_temp);
    print('nb '+invoicesFiltered.length.toString());
    notifyListeners();


  }

  bool get isSelectedRegionNotEqualAll => selectedRegion != "0" && selectedRegion != null;

  bool get isSelectedRegionEqualAll => selectedRegion == "0" || selectedRegion == null;

  bool get isSelectedRegionEqualNull => selectedRegion == null;

  bool isSelectedRegionEqualInvoice(InvoiceModel element) => element.fk_regoin_invoice == selectedRegion;

  bool isSelectedSellerTypeFilterEqualInvoice(InvoiceModel element) =>
      element.type_seller == selectedSellerTypeFilter.index.toString();

  bool isSelectedAgentDistributorEqualInvoice(InvoiceModel element) =>
      selectedAgentDistributor?.idAgent == element.fk_agent;

  bool isSelectedCollaborateEqualInvoice(InvoiceModel element) =>
      selectedCollaborator?.id_participate == element.participate_fk;

  bool isSelectedEmployeeEqualInvoice(InvoiceModel element) => selectedEmployee?.idUser == element.fkIdUser;

  bool get isSelectedSellerTypeFilterEqualAgentOrDistributor =>
      [SellerTypeFilter.distributor, SellerTypeFilter.agent].contains(selectedSellerTypeFilter);

  bool get isSelectedSellerTypeFilterEqualAll => selectedSellerTypeFilter == SellerTypeFilter.all;

  bool get isSelectedTypeEqualCollaborator => selectedSellerTypeFilter == SellerTypeFilter.collaborator;

  bool get isSelectedTypeFilterEqualNull => selectedAgentDistributor == null;

  bool get isSelectedAgentDistributorEqualNull => selectedAgentDistributor == null;

  bool get isSelectedCollaboratorEqualNull => selectedCollaborator == null;

  bool get isSelectedEmployeeEqualNull => selectedEmployee == null;

  void onChangeEmployee(UserModel seller) {
    selectedEmployee = seller;
    onFilter();
    notifyListeners();
  }
}
