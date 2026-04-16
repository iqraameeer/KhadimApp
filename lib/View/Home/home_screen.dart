import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Drawer/drawer_screen.dart';
import 'home_view_controller.dart';
import '../../Utils/Const/color_const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel controller = Get.put(HomeViewModel());

    return Scaffold(
      backgroundColor: secondary,
      drawer: DrawerScreen(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.menu, color: black),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                  title: Text(
                    'Khadim',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      icon: Icon(Icons.notifications, color: black),
                      onPressed: () {
// Get.toNamed(AppRoutes.notifications);
},
                    ),
                  ],
                ),
              ),

              25.verticalSpace,
              CarouselSlider.builder(
                itemCount: controller.laundryImages.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14.r),
                      child: Image.asset(
                        controller.laundryImages[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 180.h,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    controller.onPageChanged(index);
                  },
                ),
              ),

              12.verticalSpace,
              Obx(
                    () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.laundryImages.length,
                        (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      height: 6.h,
                      width: controller.currentIndex.value == index ? 25.w : 6.w,
                      decoration: BoxDecoration(
                        color: controller.currentIndex.value == index
                            ? primary
                            : grey,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                ),
              ),

              16.verticalSpace,

              // 🔹 Green Strip
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  padding: EdgeInsets.all(14.w),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: white,
                        child: Icon(Icons.person, color: primary),
                      ),
                      12.horizontalSpace,
                      Expanded(
                        child: Text(
                          'Schedule your pickup\nGet clean clothes delivered',
                          style: TextStyle(
                            color: black,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                       Icon(Icons.arrow_forward_ios, color: white, size: 25),
                    ],
                  ),
                ),
              ),

              20.verticalSpace,

              // 🔹 Services Grid
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.w,
                  mainAxisSpacing: 8.h,
                  childAspectRatio: 1.2,
                  children: [
                    gridCard(Icons.local_laundry_service, 'Wash & Fold'),
                    gridCard(Icons.checkroom, 'Dry Clean'),

                  ],
                ),
              ),

              20.verticalSpace,

              // 🔹 Bottom CTA
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  height: 80.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(
                      color: grey,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.delivery_dining, size: 40.sp, color: primary),
                      16.horizontalSpace,
                      Expanded(
                        child: Text(
                          'Come & Collect\nQuick pickup service',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Grid Card Widget
  Widget gridCard(IconData icon, String title) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: grey,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 36.sp, color: primary),
          12.verticalSpace,
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
