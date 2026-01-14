import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khadim_app/Utils/Extensions/text_extension.dart';
import 'package:lottie/lottie.dart';

import '../../../Config/AppRoutes/route_imports.dart';
import '../../../Utils/Const/asset_const.dart';
import '../../../Utils/Const/color_const.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_textfield.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            40.verticalSpace,
            Center(child: Image.asset(ImageConst.splash, height: 80.h)),
            20.verticalSpace,
            Text(
              'Password Recovery',
              style: context.headlineLarge!.copyWith(
                color: black,
                fontWeight: FontWeight.bold,
              ),
            ),
            5.verticalSpace,
            Text(
              'Enter new password to reset your account',
              style: context.titleMedium!.copyWith(color: black),
              textAlign: TextAlign.center,
            ),
            30.verticalSpace,
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
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding, vertical: 40.h),
                  child: Column(

                    children: [
60.verticalSpace,                      CustomTextField(
                        hintText: 'New Password',
                        maxLines: 1,
                        prefix: Icon(
                          Icons.lock,
                          size: 20.sp,
                        ),
                        inputAction: TextInputAction.next,
                      ),
                      30.verticalSpace,
                      // Confirm Password Field
                      CustomTextField(
                        hintText: 'Confirm Password',
                        maxLines: 1,
                        prefix: Icon(
                          Icons.lock,
                          size: 20.sp,
                        ),
                        inputAction: TextInputAction.done,
                      ),
                      40.verticalSpace,
                      // Continue Button
                      CustomButton(
                        title: 'Continue',
                        onTap: () {
                          Get.dialog(
                            AlertDialog(
                              backgroundColor: white,
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Lottie.asset(
                                    'assets/gif/done.json',
                                    height: 200.h,
                                    repeat: true,
                                  ),
                                  Text(
                                    'Congratulations!',
                                    style: context.titleLarge,
                                  ),
                                  15.verticalSpace,
                                  Text(
                                    'Your password has been reset successfully!',
                                    textAlign: TextAlign.center,
                                    style: context.titleSmall,
                                  ),
                                ],
                              ),
                              actions: [
                                CustomButton(
                                  title: 'Okay',
                                  onTap: () {
                                    Get.offNamedUntil(
                                        AppRoutes.login, (route) => false);
                                  },
                                ),
                              ],
                            ),
                            barrierDismissible: false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
