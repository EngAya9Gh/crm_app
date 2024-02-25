import '../../../../../../core/api/result.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../model/invoiceModel.dart';
import '../../data/models/invoice_withdrawal_series_model.dart';
import '../../data/models/reject_reason.dart';
import '../../data/models/user_series.dart';
import '../../data/models/withdrawn_details_model.dart';

abstract class ManageWithdrawalsRepository {
  Future<Result<ResponseWrapper<List<UserSeries>>>> getUsersSeries(
      Map<String, dynamic> params);

  Future<Result<ResponseWrapper<List<UserSeries>>>> updateUsersSeries(
      Map<String, dynamic> data);

  Future<Result<ResponseWrapper<List<InvoiceModel>>>> getWithdrawalsInvoice();

  Future<Result<ResponseWrapper<List<InvoiceWithdrawalSeries>>>>
      getWithdrawalInvoiceDetails(Map<String, dynamic> data);

  Future<Result<ResponseWrapper<bool>>> setApproveSeries(
      Map<String, dynamic> query, Map<String, dynamic> data);

  Future<Result<ResponseWrapper<WithdrawnDetailsModel>>> getWithdrawnDetails(
      Map<String, dynamic> query);

  Future<Result<ResponseWrapper<List<RejectReason>>>> getRejectReasons();

  Future<Result<ResponseWrapper<String>>> addRejectReasons(
      Map<String, dynamic> query);

  Future<Result<ResponseWrapper<String>>> editRejectReasons(
      Map<String, dynamic> query, Map<String, dynamic> data);
}
