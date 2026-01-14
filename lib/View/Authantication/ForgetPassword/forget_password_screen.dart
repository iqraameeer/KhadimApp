import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khadim_app/Config/AppRoutes/route_imports.dart';
import 'package:khadim_app/Utils/Extensions/text_extension.dart';

import '../../../Utils/Const/asset_const.dart';
import '../../../Utils/Const/color_const.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_textfield.dart';
import 'forget_password_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgetPasswordController controller =
    Get.put(ForgetPasswordController());
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new, color: black),
                  onPressed: () {Get.back();}
                ),
              ),
              20.verticalSpace,
              Center(
                child: Image.asset(
                  ImageConst.splash,
                  height: 80.h,
                ),
              ),
              20.verticalSpace,
              Text(
                'Password Recovery',
                style: context.headlineLarge!.copyWith(
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              8.verticalSpace,
              Text(
                'Enter your number to get\nverification code',
                textAlign: TextAlign.center,
                style: context.titleMedium!.copyWith(
                  color: black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              40.verticalSpace,
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
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Column(
                        children: [
                          90.verticalSpace,
                          CustomTextField(
                            controller: controller.phoneNumber,
                            hintText: 'Enter your number',
                            keyboardType: TextInputType.number,
                            prefix: Icon(Icons.call, size: 20.sp),
                          ),
                          30.verticalSpace,

                          SizedBox(
                            width: double.infinity,
                            height: 48.h,
                            child: CustomButton(
                              title: 'Send Code',
                              onTap: () {
                                Get.dialog(
                                  AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                    title: Text(
                                      'Verify your phone number',
                                      style: context.titleLarge!.copyWith(color: primary),
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        10.verticalSpace,
                                        Text(
                                          'Are you sure this is your correct number?',
                                          style: context.bodyLarge!.copyWith(color: black),
                                        ),
                                        Text(
                                         '+92 123 5678900',
                                          style: context.bodyLarge!.copyWith(
                                            color: black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        30.verticalSpace,
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CustomButton(
                                                title: 'Cancel',
                                                backgroundColor: Colors.grey,
                                                onTap: () {
                                                  Get.back();
                                                },
                                              ),
                                            ),
                                            10.horizontalSpace,
                                            Expanded(
                                              child: CustomButton(
                                                title: 'Send Code',
                                                onTap: () {
                                                  Get.back();
                                                  Get.toNamed(AppRoutes.otpverification);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),                      ]),
                  ),
                ),
              ),
            ]),
      ),


    );
  }

}