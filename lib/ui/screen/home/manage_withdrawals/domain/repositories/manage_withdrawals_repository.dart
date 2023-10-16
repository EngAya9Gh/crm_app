import 'package:crm_smart/ui/screen/home/manage_withdrawals/data/models/user_series.dart';
import '../../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/api/result.dart';

abstract class ManageWithdrawalsRepository {
  Future<Result<ResponseWrapper<List<UserSeries>>>> getUsersSeries(Map<String,dynamic> params);
  Future<Result<ResponseWrapper<List<UserSeries>>>> updateUsersSeries(Map<String,dynamic> data);
}
