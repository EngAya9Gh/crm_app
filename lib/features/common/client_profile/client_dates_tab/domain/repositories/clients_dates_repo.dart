
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/client_date_model.dart';

abstract class ClientsDatesRepository {

  Future<ResponseWrapper<List<ClientDateModel>>> getAllClientsDates(
      Map<String, dynamic> body, String clientId);

}
