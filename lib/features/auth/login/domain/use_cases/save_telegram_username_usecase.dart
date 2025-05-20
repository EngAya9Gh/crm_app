import '../repositories/login_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SaveTelegramUsernameUseCase {
  final LoginRepo _repo;
  SaveTelegramUsernameUseCase(this._repo);

  Future<Map<String, dynamic>> call(String email, String telegramUsername) {
    return _repo.saveTelegramUsername(email, telegramUsername);
  }
}
