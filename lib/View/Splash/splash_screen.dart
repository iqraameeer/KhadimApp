import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Utils/Const/asset_const.dart';
import '../../Utils/Const/color_const.dart';
import 'splash_view_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashViewController controller = Get.put(SplashViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: primary, // 🟢 Green background
        child: Center(
          child: Image.asset(
            ImageConst.splash, // 🟢 Center image
            height: 120,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
