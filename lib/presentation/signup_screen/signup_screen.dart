import 'package:flutter/services.dart';

import '../../core/validator/validator.dart';
import '../../widgets/comman_widget.dart';
import 'controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/core/utils/validation_functions.dart';
import 'package:preeti_s_application3/widgets/custom_checkbox_button.dart';
import 'package:preeti_s_application3/widgets/custom_outlined_button.dart';
import 'package:preeti_s_application3/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignupScreen extends GetWidget<SignupController> {
  SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        height: mediaQueryData.size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConstant.imgbackground),
                fit: BoxFit.cover)),
        child: ScrollConfiguration(
          behavior: ListScrollBehaviour(),
          child: Stack(
            children: [
              ListView(children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 28),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: IconButton(
                                icon: Icon(Icons.arrow_back_ios),
                                color: Colors.white,
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ),
                            Container(
                                height: 70.v,
                                margin: EdgeInsets.only(
                                    left: 0.h, top: 75.v, bottom: 60.v),
                                child: Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 17.v, bottom: 10.v),
                                        child: Image(
                                          image: AssetImage(
                                            ImageConstant.imgImage2,
                                          ),
                                        ),
                                      ),
                                      // AppbarTitleImage(
                                      //     imagePath: ImageConstant.imgSantaHat1,
                                      //     margin: EdgeInsets.only(right: 204.h, bottom: 33.v))
                                    ])),
                            SizedBox()
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 18, right: 18),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColorSchemes.primaryColorScheme.background),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              Text("msg_join_us_and_enter".tr,
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyles.titleMediumPrimary),
                              SizedBox(height: 15.v),
                              _caseIDInputBox(context),
                              SizedBox(height: 10.v),
                              _buildEmailDetails(context),
                              SizedBox(height: 10.v),
                              _buildPasswordDetails(context),
                              SizedBox(height: 10.v),
                              _buildConfirmPasswordDetails(context),
                              SizedBox(height: 15.v),
                              _buildRememberMeCheckbox(),
                              SizedBox(height: 20.v),
                              signUpButton()
                            ],
                          ),
                        ),
                      ),
                    ]),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget

  /// Section Widget
  Widget _caseIDInputBox(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "lbl_case_id".tr,
          style: CustomTextStyles.titleMedium,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 5.v),
        CW.commonTextFieldForLoginSignUP(
          context: context,
          contentPadding: EdgeInsets.all(6),
          controller: controller.caseIDController,
          prefixIcon: CustomImageView(
              imagePath: ImageConstant.imgSolarUserIdBroken,
              height: 16.adaptSize,
              width: 16.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 11.v, horizontal: 10)),
          validator: (value) => Validator.isCaseIDValid(value: value),
          keyboardType: TextInputType.number,
          inputFormatters: [LengthLimitingTextInputFormatter(10)],
          hintText: "msg_please_enter_your".tr,
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildEmailDetails(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_enter_address".tr, style: CustomTextStyles.titleMedium),
      SizedBox(height: 5.v),
      CW.commonTextFieldForLoginSignUP(
        context: context,
        contentPadding: EdgeInsets.all(6),
        controller: controller.emailController,
        prefixIcon: CustomImageView(
            imagePath: ImageConstant.imgSolarNotificat,
            height: 16.adaptSize,
            width: 16.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 11.v, horizontal: 10)),
        validator: (value) => Validator.isEmailValid(value: value),
        keyboardType: TextInputType.emailAddress,
        hintText: "msg_please_enter_your2".tr,
      ),
    ]);
  }

  /// Section Widget
  Widget _buildPasswordDetails(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_password".tr, style: CustomTextStyles.titleMedium),
      SizedBox(height: 5.v),
      CW.commonTextFieldForLoginSignUP(
          context: context,
          controller: controller.passwordController,
          hintText: "lbl".tr,
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: CustomImageView(
              imagePath: ImageConstant.imgSolarlockpasswordbroken,
              height: 16.adaptSize,
              width: 16.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 11.v, horizontal: 10)),
          validator: (value) => Validator.isPasswordValid(value: value),
          contentPadding: EdgeInsets.zero)
    ]);
  }

  Widget _buildConfirmPasswordDetails(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_confirm_password".tr, style: CustomTextStyles.titleMedium),
      SizedBox(height: 5.v),
      CW.commonTextFieldForLoginSignUP(
          context: context,
          controller: controller.confirmpasswordController,
          hintText: "lbl".tr,
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: CustomImageView(
              imagePath: ImageConstant.imgSolarpasswordbroken,
              color: Color(0xff858585),
              height: 20.adaptSize,
              width: 20.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 11.v, horizontal: 10)),
          validator: (value) => Validator.isConfirmPasswordValid(
                value: value,
                passwordValue: controller.passwordController.text,
              ),
          contentPadding: EdgeInsets.zero)
    ]);
  }

  /// Section Widget
  Widget _buildRememberMeCheckbox() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomCheckboxButton(
                    isExpandedText: true,
                    textAlignment: TextAlign.left,
                    alignment: Alignment.centerLeft,
                    text: "lbl_signup_remember_me".tr,
                    value: controller.rememberMeCheckbox.value,
                    textStyle: theme.textTheme.bodySmall!
                        .copyWith(color: Colors.white, fontSize: 11),
                    onChange: (value) {
                      controller.rememberMeCheckbox.value = value;
                      if (value)
                        controller.tnCText.value = '';
                      else
                        controller.tnCText.value = 'msg_please_tick'.tr;
                    }),
                Obx(() => Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        controller.tnCText.value,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: ColorSchemes.primaryColorScheme.error),
                      ),
                    ))
              ],
            )));
  }

  Widget signUpButton() {
    return Column(
      children: [
        Obx(() {
          return controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : CustomOutlinedButton(
                  text: "lbl_sign_up".tr,
                  decoration: BoxDecoration(
                      color: ColorSchemes.primaryColorScheme.primary,
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () => controller.clickOnSignUpButton(),
                );
        }),
        Container(
            height: 40,
            padding: EdgeInsets.only(left: 40.h, right: 40.h, top: 10.h),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("msg_already_have_account".tr,
                  style:
                      theme.textTheme.bodyLarge!.copyWith(color: Colors.white)),
              SizedBox(
                width: 5,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(40, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    onTapTxtSignInNow();
                  },
                  child: Text("lbl_sign_in_now".tr,
                      style: CustomTextStyles.bodyExtraLargePrimary))
            ])),
        SizedBox(height: 14.v),
        CW.termCondition('msg_info_clearstarttax_com'.tr,
            textColor: Colors.white),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapTxtSignInNow() {
    Get.toNamed(
      AppRoutes.loginPageScreen,
    );
  }
}
