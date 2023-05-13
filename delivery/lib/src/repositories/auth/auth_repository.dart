import '../../models/auth_models.dart';

abstract class AuthRepository {
  Future<AuthModels> login(String email, String senha);
}
