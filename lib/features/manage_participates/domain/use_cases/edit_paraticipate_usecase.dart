import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/manage_participates/data/models/participatModel.dart';
import 'package:crm_smart/features/manage_participates/domain/repositories/participate_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';

@injectable
class EditParticipateUserUsecase extends UseCase<
    Result<ResponseWrapper<ParticipateModel>>, EditParticipateParams> {
  EditParticipateUserUsecase(this.repository);

  final ParticipateListRepository repository;

  @override
  Future<Result<ResponseWrapper<ParticipateModel>>> call(
      EditParticipateParams params) {
    return repository.editParticipate(params.toMap(), params.toParams);
  }
}

class EditParticipateParams {
  final String? idParticipate;
  final String? nameParticipate;
  final String? mobileParticipate;
  final String? namebankParticipate;
  final String? numberbankParticipate;

  EditParticipateParams({
    this.idParticipate,
    this.nameParticipate,
    this.mobileParticipate,
    this.namebankParticipate,
    this.numberbankParticipate,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> params = {
      'name_participate': nameParticipate,
      'mobile_participate': mobileParticipate,
      'namebank_participate': namebankParticipate,
      'numberbank_participate': numberbankParticipate,
    }..removeWhere((key, value) => value == null);

    params = params.map((key, value) => MapEntry(key, value.toString()));
    return params;
  }

  Map<String, dynamic> get toParams => {'id_participate': idParticipate};
}
