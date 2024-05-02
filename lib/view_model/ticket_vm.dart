import 'package:flutter/material.dart';

import '../api/api.dart';
import '../core/utils/end_points.dart';
import '../features/clients_care/clients_tickets/data/models/ticket_model.dart';
import '../model/usermodel.dart';

class TicketVM extends ChangeNotifier {
  List<TicketModel> listticket = [];
  List<TicketModel> searchTicketsList = [];
  UserModel? currentUser;
  bool _isLoading = false;

  bool get isloading => _isLoading;

  set isloading(bool isloading) {
    _isLoading = isloading;
    notifyListeners();
  }

  void setvalue(user) {
    currentUser = user;
    notifyListeners();
  }

  Future<bool> updateTicketvm(
      Map<String, dynamic> body, String? idTicket) async {
    isloading = true;
    var data = await Api().post(
        url: EndPoints.baseUrls.url +
            "ticket/recive_ticket.php?id_ticket=$idTicket",
        body: body);
    int index =
        listticket.indexWhere((element) => element.idTicket == idTicket);

    listticket[index] = TicketModel.fromMap(data[0]);
    index =
        searchTicketsList.indexWhere((element) => element.idTicket == idTicket);
    searchTicketsList[index] = TicketModel.fromMap(data[0]);
    searchTicketsList.removeAt(index);
    isloading = false;
    return true;
  }
}
