import 'package:crm_smart/core/api/api_utils.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/features/manage_withdrawals/data/models/invoice_withdrawal_series_model.dart';
import 'package:crm_smart/features/manage_withdrawals/data/models/reject_reason.dart';
import 'package:crm_smart/features/manage_withdrawals/data/models/withdrawn_details_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../model/invoiceModel.dart';
import '../../domain/repositories/manage_withdrawals_repository.dart';
import '../../domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart';
import '../data_sources/manage_withdrawals_datasource.dart';
import '../models/user_series.dart';

@LazySingleton(as: ManageWithdrawalsRepository)
class ManageWithdrawalsRepositoryImpl extends ManageWithdrawalsRepository {
  ManageWithdrawalsRepositoryImpl(this._datasource);

  final ManageWithdrawalsDatasource _datasource;

  @override
  Future<Result<ResponseWrapper<List<UserSeries>>>> getUsersSeries(
      Map<String, dynamic> params) {
    return toApiResult(() => _datasource.getAllUsersSeries(params));
  }

  @override
  Future<Result<ResponseWrapper<List<UserSeries>>>> updateUsersSeries(
      Map<String, dynamic> data) {
    return toApiResult(() => _datasource.updateAllUsersSeries(data));
  }

  @override
  Future<Result<ResponseWrapper<List<InvoiceModel>>>> getWithdrawalsInvoice() {
    return toApiResult(_datasource.getWithdrawalsInvoice);
  }

  @override
  Future<Result<ResponseWrapper<List<InvoiceModel>>>>
      getFilteredWithdrawalsInvoice(
    GetFilteredWithdrawalsInvoicesParams params,
  ) {
    return toApiResult(() => _datasource.getFilteredWithdrawalsInvoice(params));
  }

  @override
  Future<Result<ResponseWrapper<List<InvoiceWithdrawalSeries>>>>
      getWithdrawalInvoiceDetails(Map<String, dynamic> params) {
    return toApiResult(() => _datasource.getWithdrawalInvoiceDetails(params));
  }

  @override
  Future<Result<ResponseWrapper<bool>>> setApproveSeries(
      Map<String, dynamic> query, Map<String, dynamic> data) {
    return toApiResult(() => _datasource.setApproveSeries(query, data));
  }

  @override
  Future<Result<ResponseWrapper<WithdrawnDetailsModel>>> getWithdrawnDetails(
      Map<String, dynamic> query) {
    return toApiResult(() => _datasource.getWithdrawnDetails(query));
  }

  @override
  Future<Result<ResponseWrapper<String>>> addRejectReasons(
      Map<String, dynamic> query) {
    return toApiResult(() => _datasource.addRejectReasons(query));
  }

  @override
  Future<Result<ResponseWrapper<String>>> editRejectReasons(
      Map<String, dynamic> query, Map<String, dynamic> data) {
    return toApiResult(() => _datasource.editRejectReasons(query, data));
  }

  @override
  Future<Result<ResponseWrapper<List<RejectReason>>>> getRejectReasons() {
    return toApiResult(_datasource.getRejectReasons);
  }
}
