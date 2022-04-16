import 'package:errand260/core/http/http_client.dart';
import 'package:errand260/model/login_model.dart';

class LoginApi {
  final HttpClient _http = HttpClient();

  Future<LoginModel> login(
      {required String email, required String password}) async {
    final response =
        await _http.postRequest('login?email=$email&password=$password');
    print('request sent');

    return LoginModel.fromMap(response.body['data']);
  }

  Future<String> loginError(
      {required String email, required String password}) async {
    final response =
        await _http.postRequest('login?email=$email&password=$password');

    return response.body['message'].toString();
  }
}
