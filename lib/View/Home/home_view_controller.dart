import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khadim_app/Utils/Const/asset_const.dart';
import '../../Data/data_sources/remote/api_constant.dart';
import '../../Data/response/api_response.dart';
import '../../Utils/Const/color_const.dart';
import '../../Widgets/custom_snackbar.dart';

class HomeViewModel extends GetxController {
  var currentIndex = 0.obs;

  final List<String> laundryImages = [
    ImageConst.imageOne,
    ImageConst.imageTwo,
    ImageConst.imageThree,
  ];

  void onPageChanged(int index) {
    currentIndex.value = index;
  }
}

