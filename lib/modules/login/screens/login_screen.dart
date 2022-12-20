import 'package:antique_homes_getx/modules/login/screens/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_string.dart';
import '../../../common/utils/validation.dart';
import '../../../common/widget/inputfileds.dart';
import '../../../controller/login_controller.dart';
import '../../../controller/register_controller.dart';
import '../widgets/base_layout.dart';
import '../widgets/button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      body: GetBuilder<LoginController>(
        builder: (controller) => Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 170, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.signInText,
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
                      text: AppStrings.emailAddressText,
                      controllers: loginController.email,
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
                      isObscure: true,
                      icon: Icons.lock_outline,
                      validator: password,
                      controllers: loginController.password,
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            AppStrings.forgotText,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor,
                              fontFamily: 'SF Pro Display',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buttons(
                    buttonname: AppStrings.loginButtonText,
                    buttonheight: 48,
                    buttonwidth: 400,
                    fontsize: 20,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        loginController.login(context);
                        // Get.to(LoginScreen());
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.registerButtonText,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.whiteColor),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed("/register");
                        },
                        child: Text(
                          AppStrings.clickHere,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.borderColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
