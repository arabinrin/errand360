
import 'package:errand260/core/api/auth_api.dart';

class HttpRepos {
  static HttpRepos? _instance;

  HttpRepos._internal() {
    _instance = this;
  }

  factory HttpRepos() => _instance ?? HttpRepos._internal();

  static final LoginApi loginApi = LoginApi();

}


//https://reqres.in/api/users?page=1