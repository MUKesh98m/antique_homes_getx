import 'package:antique_homes_getx/controller/register_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:provider/provider.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_string.dart';
import '../../../common/utils/validation.dart';
import '../../../common/widget/inputfileds.dart';
import '../widgets/base_layout.dart';
import '../widgets/button.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        body: GetBuilder<RegisterController>(
      builder: (controller) => Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 150, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.signUpText,
                      style: TextStyle(
                          fontSize: 34,
                          color: AppColors.textColor,
                          fontFamily: 'Libre',
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 400,
                      child: textinputfield(
                        icon: Icons.person,
                        text: AppStrings.firstName,
                        controllers: registerController.firstName,
                        validator: nameValidation,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 400,
                      child: textinputfield(
                        text: AppStrings.lastName,
                        icon: Icons.person,
                        validator: lastNameValidation,
                        controllers: registerController.lastName,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 400,
                      child: textinputfield(
                        text: AppStrings.emailAddressText,
                        icon: Icons.mail,
                        controllers: registerController.email,
                        validator: validateEmail,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 400,
                      child: textinputfield(
                        text: AppStrings.passwordText,
                        icon: Icons.lock_outline,
                        controllers: registerController.password,
                        isObscure: true,
                        validator: validatePassword,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 400,
                      child: textinputfield(
                          text: AppStrings.confPasswordText,
                          isObscure: true,
                          icon: Icons.lock_outline,
                          controllers: registerController.confirmPassword,
                          validator: (validator) {
                            if (validator.isEmpty)
                              return "Enter confirm password ";
                            if (validator != registerController.password.text)
                              return "Password and confirm password is not match";
                            return null;
                          }),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 20,
                    ),
                    buttons(
                      buttonname: AppStrings.registerButtonText,
                      buttonheight: 48,
                      buttonwidth: 400,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          registerController.register(context);
                        }
                      },
                      fontsize: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
