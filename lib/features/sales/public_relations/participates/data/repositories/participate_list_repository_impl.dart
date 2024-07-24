import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/participate_model.dart';
import '../../../../../../core/common/models/profile_invoice_model.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/widgets/profile_comments_model.dart';
import '../../../../../../core/services/api/api_utils.dart';
import '../../../../../../core/services/api/result.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../domain/repositories/participate_list_repository.dart';
import '../../domain/use_cases/change_participate_status_usecase.dart';
import '../data_sources/participates_list_datasource.dart';
import '../models/participate_client_model.dart';

@LazySingleton(as: ParticipateListRepository)
class ParticipateListRepositoryImpl implements ParticipateListRepository {
  final ParticipatesListDatasource _datasource;

  ParticipateListRepositoryImpl(this._datasource);

  @override
  Future<Result<ResponseWrapper<List<ParticipateModel>>>> getParticipateList(
    Map<String, dynamic> body,
  ) {
    return toApiResult(() => _datasource.getParticipateList(body));
  }

  @override
  Future<Result<ResponseWrapper<ParticipateModel>>> addParticipate(
      Map<String, dynamic> body) {
    return toApiResult(() => _datasource.addParticipate(body));
  }

  @override
  Future<Result<ResponseWrapper<ParticipateModel>>> editParticipate(
      Map<String, dynamic> body, Map<String, dynamic> params) {
    return toApiResult(() => _datasource.editParticipate(body, params));
  }

  @override
  Future<Result<ResponseWrapper<List<ParticipateClientModel>>>>
      getParticipateClientsList(String participateId) {
    return toApiResult(
        () => _datasource.getParticipateClientsList(participateId));
  }

  @override
  Future<Result<ResponseWrapper<List<ProfileInvoiceModel>>>>
      getParticipateInvoicesList(String participateId) {
    return toApiResult(
        () => _datasource.getParticipateInvoicesList(participateId));
  }

  @override
  Future<Result<ResponseWrapper<InvoiceModel>>> getInvoiceDataById(
      Map<String, dynamic> params) {
    return toApiResult(() => _datasource.getInvoiceDataById(params));
  }

  @override
  Future<Result<ResponseWrapper<List<ProfileCommentModel>>>>
      getParticipateCommentsList(String participateId) {
    return toApiResult(
        () => _datasource.getParticipateCommentsList(participateId));
  }

  @override
  Future<Result<ResponseWrapper<ProfileCommentModel>>> addCompanyComment(
      Map<String, dynamic> body) {
    return toApiResult(() => _datasource.addComment(body: body));
  }

  @override
  Future<Either<String, ParticipateModel>> changeParticipateStatus(
      ChangeParticipateParams params) async {
    try {
      final data = await _datasource.changeParticipateStatus(params);
      final ParticipateModel participate = ParticipateModel.fromJson(data);
      return Right(participate);
    } catch (e) {
      debugPrint("Error in changeParticipateStatus => $e");
      return Left(e.toString());
    }
  }
}
