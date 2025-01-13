import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/models/user_entity.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../core/services/api/result.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class GetUsersSalesUseCase implements BaseUsecase<Result<ResponseWrapper<List<UserEntity>>>, GetUsersSalesParams> {
  final ClientsListRepository repository;

  GetUsersSalesUseCase({required this.repository});

  @override
  Future<Result<ResponseWrapper<List<UserEntity>>>> call( GetUsersSalesParams params) async {
    return repository.getUsersSales(params);
  }
}
class GetUsersSalesParams{
  final String? type;

  const GetUsersSalesParams({
    this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': this.type,
    }..removeWhere((key, value) => value==null||value=='',);
  }

  GetUsersSalesParams copyWith({
    String? type,
  }) {
    return GetUsersSalesParams(
      type: type ?? this.type,
    );
  }

}