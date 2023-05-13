// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../models/auth_models.dart';
import '../../../repositories/auth/auth_repository.dart';
import '../../global/constants.dart';
import '../../storage/session_storage.dart';
import '../../storage/storage.dart';
import './login_service.dart';

class LoginServiceImpl implements LoginService {
  final AuthRepository _authRepository;
  final Storage _storage;

  LoginServiceImpl(this._authRepository, this._storage);

  @override
  Future<void> execute(String email, String password) async {
    final AuthModels = await _authRepository.login(email, password);
    _storage.setData(SessionStorageKey.acessTokens.key, AuthModels.acessToken);
  }
}
