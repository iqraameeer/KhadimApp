import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khadim_app/Utils/Extensions/text_extension.dart';
import '../../../../Utils/Const/asset_const.dart';
import '../../../../Utils/Const/color_const.dart';
import 'cart_view_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartScreenController controller = Get.put(CartScreenController());

    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text(
          'My Orders',
          style: context.titleMedium!.copyWith(color: black),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            20.verticalSpace,

            /// 🔹 Tabs
            Obx(
                  () => Row(
                children: [
                  _tabItem('Current Orders', 0, controller),
                  _tabItem('Previous Orders', 1, controller),
                ],
              ),
            ),

            50.verticalSpace,

            /// 🔹 Tab Content
            Expanded(
              child: Obx(
                    () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.selectedTabIndex.value == 0
                          ? 'No Current Orders Found'
                          : 'No Previous Orders Found',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// 🔹 Bottom green strip
            Container(
              height: 20.h,
              width: double.infinity,
              color: primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabItem(String title, int index, CartScreenController controller) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: controller.selectedTabIndex.value == index
                    ? primary
                    : black,
              ),
            ),
            4.verticalSpace,
            Container(
              height: 2.h,
              color: controller.selectedTabIndex.value == index
                  ? primary
                  : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
