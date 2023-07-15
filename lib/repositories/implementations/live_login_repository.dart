import 'package:driver_app/repositories/login_repository.dart';
import 'package:driver_app/entities/user.dart';
import 'dart:convert';

// TODO: Don't use HTTP
import 'package:http/http.dart' as http;
import 'package:driver_app/url.dart';

class HTTPLoginRepository implements LoginRepository {
  @override
  User? user;

  @override
  Future<User?> login(String username, String password) async {
    try {
      var response = await http.post((Uri.parse('$serverURL/login')),
          body: jsonEncode({"username": username, "password": password}),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json'
          });
      // In this case the login was successful
      if (response.statusCode == 201) {
        return User.fromJson(json.decode(response.body));
      }
      // In this case the login was unsuccessful
      else {
        return null;
      }
    } catch (e) {
      // Debug output
      return null;
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
