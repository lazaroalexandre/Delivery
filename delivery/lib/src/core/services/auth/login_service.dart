import 'login_service_impl.dart';

abstract class LoginService {
  LoginService(LoginServiceImpl Function(dynamic i) param0);

  Future<void> execute(String email, String password);
  
}
