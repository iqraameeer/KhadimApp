import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khadim_app/Utils/Extensions/text_extension.dart';
import '../../../Config/AppRoutes/route_imports.dart';
import '../../../Utils/Const/color_const.dart';
import '../../../Widgets/custom_button.dart';


class SignupViewModel extends GetxController {
  GlobalKey<FormState>? signUpFormKey;
  TextEditingController? fullNameController;
  TextEditingController? addressController;
  TextEditingController? phoneController;
  TextEditingController? passController;
  TextEditingController? confirmPassController;

  RxBool checkBox = false.obs;
  RxBool isHide = true.obs;

  void toggleHidePassword() => isHide.value = !isHide.value;

  void togglecheckBox() => checkBox.value = !checkBox.value;

  @override
  void onInit() {
    super.onInit();
    signUpFormKey = GlobalKey<FormState>();
    fullNameController = TextEditingController();
    addressController = TextEditingController();
    phoneController = TextEditingController();
    passController = TextEditingController();
    confirmPassController = TextEditingController();
  }

  @override
  void onClose() {
    fullNameController?.dispose();
    addressController?.dispose();
    phoneController?.dispose();
    passController?.dispose();
    confirmPassController?.dispose();
    super.onClose();
  }

  void signupDialog(BuildContext context) {
    final phone = phoneController?.text.trim() ?? '';
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(
            'Verify your phone number',
            style: context.titleLarge!.copyWith(color: black),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Are you sure this is your correct number?',
                style: context.bodyLarge!.copyWith(color: black),
              ),
              Text(
                phone.isNotEmpty ? '$phone' : '+92 123 5678900',
                style: context.bodyLarge!.copyWith(
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              20.verticalSpace,
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: CustomButton(
                  title: 'GENERATE OTP',
                  onTap: () {
                    Navigator.of(ctx).pop();
                    Get.toNamed(AppRoutes.sendOtp);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(
            'Signup Successful',
            style: context.titleLarge!.copyWith(color: primary),
          ),
          content: Text(
            'Your account has been created successfully!',
            style: context.bodyLarge!.copyWith(color: primary),
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: CustomButton(
                title: 'Go to Login',
                onTap: () {
                  Navigator.of(ctx).pop();
                  Get.offNamed(AppRoutes.login);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}