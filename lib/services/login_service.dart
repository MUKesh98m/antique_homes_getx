import 'package:dio/dio.dart';

import '../common/app_string.dart';

import '../common/indicator.dart';
import '../model/login_model.dart';

class LoginService {
  final Dio _dio = Dio();
  Future<LoginModel?> userLogin({
    String? email,
    String? password,
  }) async {
    try {
      showLoadingIndicator();
      var data = {
        "email": email,
        "password": password,
      };
      final Response response =
          await _dio.post('${AppStrings.baseUrl}api/login', data: data);
      hideLoadingIndicator();
      print(response.data);
      return LoginModel.fromJson(response.data);
    } catch (e) {
      hideLoadingIndicator();
    }
  }
}
