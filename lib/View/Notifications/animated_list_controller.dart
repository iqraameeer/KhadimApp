import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AnimatedListController extends GetxController{

  RxBool startAnimation = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startAnimation.value = true;
      update();
    });
  }

}