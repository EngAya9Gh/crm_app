import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/participates/state_participate_enum.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/services/api/result.dart';
import '../../../../../../core/use_case/use_case.dart';
import '../../data/models/participat_model.dart';
import '../repositories/participate_list_repository.dart';

@injectable
class AddParticipateUserUsecase extends UseCase<
    Result<ResponseWrapper<ParticipateModel>>, AddParaticipateParams> {
  AddParticipateUserUsecase(this.repository);

  final ParticipateListRepository repository;

  @override
  Future<Result<ResponseWrapper<ParticipateModel>>> call(
      AddParaticipateParams params) {
    return repository.addParticipate(params.toMap());
  }
}

class AddParaticipateParams {
  final String? nameParticipate;
  final String? mobileParticipate;
  final String? namebankParticipate;
  final String? numberbankParticipate;
  final String? fkCity;
  final StateParticipateEnum? stateParticipate;

  AddParaticipateParams({
    this.nameParticipate,
    this.mobileParticipate,
    this.namebankParticipate,
    this.numberbankParticipate,
    this.fkCity,
    this.stateParticipate,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> params = {
      'name_participate': nameParticipate,
      'mobile_participate': mobileParticipate,
      'namebank_participate': namebankParticipate,
      'numberbank_participate': numberbankParticipate,
      'fk_city': fkCity,
      'state_participate': stateParticipate?.value,
    }..removeWhere((key, value) => value == null);

    params = params.map((key, value) => MapEntry(key, value.toString()));
    return params;
  }
}
