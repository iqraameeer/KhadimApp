import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class SigninViewModel extends GetxController {
  TextEditingController? phoneController = TextEditingController();
  TextEditingController? passController = TextEditingController();
  RxBool remember = false.obs;
  RxBool isHide = true.obs;

  void toggleHidePassword() {
    isHide.value = !isHide.value;
  }
}
