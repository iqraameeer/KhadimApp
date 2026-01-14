import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Config/AppRoutes/route_imports.dart';
import '../../../Utils/Const/asset_const.dart';
import '../../../Utils/Const/color_const.dart';
import '../../../Utils/Extensions/text_extension.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_textfield.dart';
import 'signin_view_model.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SigninViewModel controller = Get.put(SigninViewModel());
    return Scaffold(
      body: Column(
        children: [
        SafeArea(
        bottom: false,
        child: Column(
          children: [
            40.verticalSpace,
            Center(child: Image.asset(ImageConst.splash, height: 80.h)),
            20.verticalSpace,
            Text(
              'Welcome to\nKhadim login now!',
              textAlign: TextAlign.center,
              style: context.titleLarge!.copyWith(
                color: black,
                fontWeight: FontWeight.bold,
              ),
            ),
            30.verticalSpace,
          ],
        ),
      ),
      Expanded(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: secondary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60.r),
              topRight: Radius.circular(60.r),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  40.verticalSpace,
                  Text(
                    'Phone Number',
                    style: context.titleSmall!.copyWith(),
                  ),
                  15.verticalSpace,
                  CustomTextField(
                    hintText: 'enter your phone number',
                    keyboardType: TextInputType.number,
                    inputAction: TextInputAction.next,
                    controller: controller.phoneController,
                    prefix: const Icon(Icons.call),
                  ),
                  20.verticalSpace,
                  Text(
                    'Password',
                    style: context.titleSmall!.copyWith(),
                  ),
                  15.verticalSpace,
                  Obx(
                        () => CustomTextField(
                      hintText: 'enter your password',
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      controller: controller.passController,
                      obscureText: controller.isHide.value,
                      prefix: Icon(Icons.lock_outline),
                      suffix: GestureDetector(
                        onTap: controller.toggleHidePassword,
                        child: Icon(
                          controller.isHide.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.forgetpassword);
                        },
                        child: Text(
                          'Forgot Password?',
                          style: context.bodyLarge!.copyWith(color: primary),
                        ),
                      ),
                    ],
                  ),
                  30.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: CustomButton(
                      title: 'Login',
                      onTap: () {},
                    ),
                  ),
                  30.verticalSpace,
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: context.bodyLarge!.copyWith(color: grey),
                        children: [
                          TextSpan(
                            text: "Create account",
                            style: context.titleSmall!.copyWith(
                                fontWeight: FontWeight.bold, color: primary),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(AppRoutes.signUp);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  40.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),

    ],
    ),
    );
  }
}