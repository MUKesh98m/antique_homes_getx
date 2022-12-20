import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/app_preference.dart';
import '../common/app_string.dart';
import '../common/widget/toast.dart';
import '../model/login_model.dart';
import '../modules/login/screens/homepages/home_screen.dart';
import '../services/login_service.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginModel? loginModel;

  login(context) async {
    loginModel = await LoginService().userLogin(
      email: email.text,
      password: password.text,
    );

    if (loginModel!.status == true) {
      AppPreference.set(AppStrings.token, loginModel!.token);
      AppPreference.set(AppStrings.loginStatus, loginModel!.status);
      Toast().showToast("Login successful");
      Get.toNamed("/home");
    } else {
      Toast().errorToast("These credentials do not match our records");
    }
  }
}
