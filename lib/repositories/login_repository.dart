import 'package:driver_app/entities/user.dart';

abstract class LoginRepository {
  User? user;

  Future<User?> login(String username, String password);

  void setCurrentUser(User u);
  User? getCurrentUser();
}
