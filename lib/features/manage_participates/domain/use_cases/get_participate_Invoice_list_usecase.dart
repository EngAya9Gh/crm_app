import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/manage_participates/domain/repositories/participate_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/profile_invoice_model.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';

@injectable
class ParticipateInvoiceListUsecase extends UseCase<
    Result<ResponseWrapper<List<ProfileInvoiceModel>>>,
    GetParticipateInvoiceListParams> {
  ParticipateInvoiceListUsecase(this.repository);

  final ParticipateListRepository repository;

  @override
  Future<Result<ResponseWrapper<List<ProfileInvoiceModel>>>> call(
      GetParticipateInvoiceListParams params) {
    return repository
        .getParticipateInvoicesList(params.idParticipate.toString());
  }
}

class GetParticipateInvoiceListParams {
  final String? idParticipate;

  GetParticipateInvoiceListParams({this.idParticipate});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> params = {}
      ..removeWhere((key, value) => value == null);
    params = params.map((key, value) => MapEntry(key, value.toString()));
    return params;
  }

  Map<String, dynamic> get toParams => {'id_participate': idParticipate};
}
