import 'package:driver_app/repositories/login_repository.dart';
import 'package:driver_app/entities/user.dart';

class MockLoginRepository implements LoginRepository {
  @override
  User? user;

  @override
  Future<User?> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (username.length == 7) {
      return null;
    } else {
      return User(username.length, username, password);
    }
  }

  @override
  void setCurrentUser(User u) {
    user = u;
  }

  @override
  User? getCurrentUser() {
    return user;
  }
}
