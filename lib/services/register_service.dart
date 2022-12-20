import 'package:dio/dio.dart';

import '../common/app_string.dart';
import '../model/register_model.dart';

class RegisterService {
  final Dio _dio = Dio();

  Future<RegisterModel?> userRegister({
    String? name,
    String? email,
    String? password,
    String? passwordConfirmation,
  }) async {
    try {
      var data = {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation
      };
      final Response response = await _dio.post(
        '${AppStrings.baseUrl}api/register',
        data: data,
      );
      print(response.data);
      return RegisterModel.fromJson(response.data);
    } catch (e) {
      // print(e);
    }
  }
}
