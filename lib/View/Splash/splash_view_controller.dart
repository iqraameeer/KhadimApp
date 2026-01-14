import 'package:get/get.dart';
import '../../Config/AppRoutes/route_imports.dart';

class SplashViewController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 5), () {
      Get.offNamed(AppRoutes.login);
    });
  }
}
