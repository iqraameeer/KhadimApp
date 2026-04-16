import 'package:get/get.dart';

class DrawerViewModel extends GetxController {

  var isDarkMode = false.obs;
  var selectedIndex = 0.obs;

  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
  }

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }



}
