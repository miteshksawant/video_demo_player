import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_demo/usage/app_colors.dart';
import 'package:video_player_demo/usage/app_common.dart';
import 'package:video_player_demo/usage/app_const.dart';
import 'package:video_player_demo/usage/app_form_validators.dart';
import 'package:video_player_demo/usage/app_strings.dart';
import 'package:video_player_demo/widget/app_button.dart';
import 'package:video_player_demo/widget/app_cached_network_image.dart';
import 'package:video_player_demo/widget/app_text.dart';
import 'package:video_player_demo/widget/app_text_button.dart';
import 'package:video_player_demo/widget/app_text_filed.dart';
import 'package:video_player_demo/widget/my_app_bar.dart';

class RegisterScreen extends StatefulWidget {
  static String id = "/register";
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleWidget: null,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextButton(
                  onTap: () {
                    Get.toNamed(RegisterScreen.id);
                  },
                  title: AppStrings.register.toUpperCase(),
                )
              ],
            ),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => AppCommon.hideKeyboard(),
        child: Container(
          padding: padding16,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.01,
                ),
                AppText(
                  AppStrings.login.toUpperCase(),
                  style: context.textTheme.headline6,
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                AppText(
                  AppStrings.enterYourEmailAndPassword,
                  style: Get.textTheme.subtitle1,
                ),
                SizedBox(
                  height: Get.height * 0.045,
                ),
                Form(
                    key: controller.emailRegisterKey,
                    child: SlideInDown(
                      child: Column(
                        children: [
                          AppTextFiled(
                            upperText: AppStrings.email,
                            hintText: AppStrings.emailHint,
                            validator: (value, _) =>
                                AppFormValidators.validateEmail(value),
                            onChanged: (value, _) {
                              controller.email = value;
                              controller.isRegisterDisabled();
                            },
                            onSaved: (value, _) => controller.email = value,
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: AppColors.grayColor,
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          AppTextFiled(
                            upperText: AppStrings.password,
                            hintText: AppStrings.passwordHint,
                            obscureText: true,
                            validator: (value, _) =>
                                AppFormValidators.validateEmptyPassword(value),
                            onChanged: (value, _) {
                              controller.password = value;
                              controller.isRegisterDisabled();
                            },
                            onSaved: (value, _) => controller.password = value,
                            suffixIcon: const Icon(
                              Icons.visibility,
                              color: AppColors.grayColor,
                            ),
                            suffixIconObscured: const Icon(
                              Icons.visibility_off,
                              color: AppColors.grayColor,
                            ),
                            prefixIcon: const Icon(Icons.lock_outline,
                                color: AppColors.grayColor),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: Get.height * 0.045,
                ),
                SlideInUp(
                  child: GetBuilder<LoginScreenController>(
                    builder: (controller) {
                      return AppButton.widget(
                        isDisabled: controller.isLoginDisable,
                        onPressed: () => controller.loginWithEmail(),
                        child: AppText(
                          AppStrings.login.toUpperCase(),
                          style: context.textTheme.button
                              ?.copyWith(color: AppColors.whiteColor),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Container(
                  alignment: Alignment.center,
                  child: AppTextButton(
                    onTap: () => Get.toNamed(ForgotPasswordScreen.id),
                    title: AppStrings.forgotPassword.toUpperCase(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
