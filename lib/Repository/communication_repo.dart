import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/communication_modle.dart';

import '../core/utils/end_points.dart';

class communication_repo {
  static List<CommunicationModel> listCommunication = [];

  static Future<List<CommunicationModel>> getCommunicationallrepeatpage(
      String country) async {
    listCommunication = [];
    // if(listComments.isEmpty){
    List<dynamic> data = [];

    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'care/getcomm_repeat.php?fk_country=$country');

    if (data.length.toString().isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        listCommunication.add(CommunicationModel.fromJson(data[i]));
      }
    }
    return listCommunication;
  }
}
