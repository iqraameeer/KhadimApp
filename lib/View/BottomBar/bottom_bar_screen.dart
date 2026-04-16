import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Utils/Const/color_const.dart';
import 'bottom_bar_view_controller.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomBarView = Get.put(BottomBarView());

    return Scaffold(
      body: Obx(
            () => IndexedStack(
          index: bottomBarView.selectedIndex.value,
          children: bottomBarView.screens,
        ),
      ),
      bottomNavigationBar: Container(
        color: primary,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _icon(Icons.home, 0, bottomBarView),
            _icon(Icons.contact_phone, 1, bottomBarView),
            _icon(Icons.chat, 2, bottomBarView),
            _icon(Icons.shopping_cart, 3, bottomBarView),
            _icon(Icons.person, 4, bottomBarView),
          ],
        ),
      ),
    );
  }

  Widget _icon(IconData iconData, int index, BottomBarView controller) {
    return GestureDetector(
      onTap: () => controller.onItemTapped(index),
      child: Icon(
        iconData,
        color: controller.selectedIndex.value == index ? black : black,
        size: 30,
      ),
    );
  }
}
