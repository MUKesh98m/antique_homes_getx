import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/indicator.dart';
import '../common/widget/toast.dart';
import '../model/register_model.dart';

import '../modules/login/screens/login_screen.dart';
import '../services/register_service.dart';

class RegisterController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  RegisterModel? registerModel;

  register(context) async {
    showLoadingIndicator();

    registerModel = await RegisterService().userRegister(
      name: firstName.text,
      email: email.text,
      password: password.text,
      passwordConfirmation: confirmPassword.text,
    );
    if (registerModel!.status == true) {
      hideLoadingIndicator();
      Get.to(LoginScreen());
    } else {
      Toast().errorToast('The email has already been taken.');
      hideLoadingIndicator();
    }

    firstName.clear();
    lastName.clear();
    email.clear();
    password.clear();
    confirmPassword.clear();
    update();
  }
}
