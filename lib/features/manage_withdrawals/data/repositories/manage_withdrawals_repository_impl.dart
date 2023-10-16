import 'package:crm_smart/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/api/api_utils.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:injectable/injectable.dart';
import '../../../../model/invoiceModel.dart';
import '../../domain/repositories/manage_withdrawals_repository.dart';
import '../data_sources/manage_withdrawals_datasource.dart';
import '../models/user_series.dart';

@Injectable(as: ManageWithdrawalsRepository)
class ManageWithdrawalsRepositoryImpl extends ManageWithdrawalsRepository {
  ManageWithdrawalsRepositoryImpl(this._datasource);

  final ManageWithdrawalsDatasource _datasource;

  @override
  Future<Result<ResponseWrapper<List<UserSeries>>>> getUsersSeries(Map<String, dynamic> params) {
    return toApiResult(() => _datasource.getAllUsersSeries(params));
  }

  @override
  Future<Result<ResponseWrapper<List<UserSeries>>>> updateUsersSeries(Map<String, dynamic> data) {
    return toApiResult(() => _datasource.updateAllUsersSeries(data));
  }

  @override
  Future<Result<ResponseWrapper<List<InvoiceModel>>>> getWithdrawalsInvoice() {
    return toApiResult(_datasource.getWithdrawalsInvoice);
  }
}
