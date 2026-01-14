import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khadim_app/Utils/Extensions/text_extension.dart';
import '../../../Config/AppRoutes/route_imports.dart';
import '../../../Utils/Const/asset_const.dart';
import '../../../Utils/Const/color_const.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_textfield.dart';
import 'signup_view_model.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    SignupViewModel controller = Get.put(SignupViewModel());

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            60.verticalSpace,
            Center(child: Image.asset(ImageConst.splash, height: 100.h,)),
            30.verticalSpace,
            Text(
              'Welcome to\nKhadim signup now!',
              textAlign: TextAlign.center,
              style: context.titleLarge!.copyWith(
                color: black,
                fontWeight: FontWeight.bold,
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
                child: Scrollbar(
                  thumbVisibility: true,

                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                        horizontal: 60
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        40.verticalSpace,
                        Text(
                          'Full Name',
                          style: context.titleSmall,
                        ),
                        10.verticalSpace,
                        CustomTextField(
                          hintText: 'Enter your full name',
                          keyboardType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          controller: controller.fullNameController,
                          prefix: Icon(Icons.person_2),
                        ),
                        20.verticalSpace,

                        // Address
                        Text(
                          'Address',
                          style: context.titleSmall,
                        ),
                        10.verticalSpace,
                        CustomTextField(
                          hintText: 'Enter your address',
                          keyboardType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          controller: controller.addressController,
                          prefix: Icon(Icons.location_on_outlined),
                        ),
                        20.verticalSpace,

                        // Phone Number
                        Text(
                          'Phone Number',
                          style: context.titleSmall,
                        ),
                        10.verticalSpace,
                        CustomTextField(
                          hintText: 'Enter your phone number',
                          keyboardType: TextInputType.number,
                          inputAction: TextInputAction.next,
                          controller: controller.phoneController,
                          prefix: Icon(Icons.call),
                        ),
                        20.verticalSpace,

                        // Password
                        Text(
                          'Password',
                          style: context.titleSmall,
                        ),
                        10.verticalSpace,
                        Obx(
                              () =>
                              CustomTextField(
                                hintText: 'Enter your password',
                                keyboardType: TextInputType.text,
                                inputAction: TextInputAction.next,
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
                        20.verticalSpace,

                        // Confirm Password
                        Text(
                          'Confirm Password',
                          style: context.titleSmall,
                        ),
                        10.verticalSpace,
                        Obx(
                              () =>
                              CustomTextField(
                                hintText: 'Confirm your password',
                                keyboardType: TextInputType.text,
                                inputAction: TextInputAction.done,
                                controller: controller.confirmPassController,
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
                        15.verticalSpace,

                        // Terms & Conditions
                        Row(
                          children: [
                            Obx(
                                  () =>
                                  Checkbox(
                                    value: controller.checkBox.value,
                                    onChanged: (val) =>
                                        controller.togglecheckBox(),
                                  ),
                            ),
                            Expanded(
                              child: Text(
                                'I agree to terms and conditions',
                                style: context.bodyLarge!
                                    .copyWith(color: black),
                              ),
                            ),
                          ],
                        ),
                        30.verticalSpace,

                        // Signup Button
                        SizedBox(
                          width: double.infinity,
                          height: 50.h,
                          child: CustomButton(
                            title: 'Sign Up',
                            onTap: () {
                              controller.signupDialog(context);
                            },
                          ),
                        ),
                        30.verticalSpace,

                        // Already have account
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: "Already have an account? ",
                              style: context.bodyLarge!
                                  .copyWith(color: grey),
                              children: [
                                TextSpan(
                                  text: "Login",
                                  style: context.titleSmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: primary),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.toNamed(AppRoutes.login);
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                        50.verticalSpace,
                      ],
                    ),
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