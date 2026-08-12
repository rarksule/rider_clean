import 'auth_session.dart';
import 'user_entity.dart';

class LoginResult {
  final UserEntity user;
  final AuthSession session;

  LoginResult({required this.user, required this.session});
}
