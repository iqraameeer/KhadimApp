import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Config/AppRoutes/route_imports.dart';
import '../../Utils/Const/asset_const.dart';
import '../../Utils/Const/color_const.dart';
import '../../Utils/Extensions/text_extension.dart';
import 'drawer_view_model.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DrawerViewModel controller = Get.put(DrawerViewModel());
    // logout() {
    //   removeUser();
    // }

    return Drawer(
      backgroundColor: secondary,
      width: 355.w,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 50.h),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 60.w,
                  height: 60.h,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(ImageConst.profile)
                      // ImageWidget(
                      //   isNetworkImage: true,
                      //   imageUrl: ApiConstants.userData?.profile ?? '',
                      //   fit: BoxFit.cover,
                      // )
                  ),
                ),
                10.horizontalSpace,
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('User Name',
                          style: context.titleSmall),
                      // Text(ApiConstants.userData?.fullname ?? '',
                      //     style: context.titleSmall),
                      10.verticalSpace,
                      Text( 'example@gmail.com',
                          style: context.titleSmall!.copyWith(fontSize: 12.sp)),
                      // Text(
                      //   ApiConstants.userData?.email ?? '',
                      //   style: context.titleSmall!.copyWith(fontSize: 12.sp),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            Obx(() => ListTile(
                  leading: Icon(Icons.person, color: primary),
                  title: Text(
                    'Edit Profile',
                    style: context.titleSmall!.copyWith(
                      color: controller.selectedIndex.value == 0
                          ? primary
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    controller.setSelectedIndex(0);
                    // Get.toNamed(AppRoutes.editProfile);
                  },
                )),

            Obx(() => ListTile(
                  leading: Icon(Icons.notifications, color: primary),
                  title: Text(
                    'Notifications',
                    style: context.titleSmall!.copyWith(
                      color: controller.selectedIndex.value == 6
                          ? primary
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    controller.setSelectedIndex(6);
                    // Get.toNamed(AppRoutes.notifications);
                  },
                )),

            Obx(() => ListTile(
                  leading: Icon(Icons.settings, color: primary),
                  title: Text(
                    'Settings',
                    style: context.titleSmall!.copyWith(
                      color: controller.selectedIndex.value == 7
                          ? primary
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    controller.setSelectedIndex(7);
                    // Get.toNamed(AppRoutes.setting);
                  },
                )),

            ListTile(
              leading: Icon(Icons.help, color: primary),
              title: Text(
                'Help Center',
                style: context.titleSmall!.copyWith(
                  color: controller.selectedIndex.value == 8
                      ? primary
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                controller.setSelectedIndex(8);
                // Get.toNamed(AppRoutes.setting);
              },
            ),
            const Spacer(),
            const Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: primary),
              title: Text(
                'Log Out',
                style: context.titleSmall!.copyWith(
                  color: primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Get.dialog(
                //   AlertDialog(
                //     backgroundColor: white,
                //     content: SizedBox(
                //       width: 375.w,
                //       height: 510.h,
                //       child: Column(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           Image.asset(
                //             ImageConst.logout,
                //           ),
                //           36.verticalSpace,
                //           Text(
                //             'Logout',
                //             style: context.displaySmall,
                //             textAlign: TextAlign.center,
                //           ),
                //           20.verticalSpace,
                //           Text(
                //             'Are You Sure you want to Logout?',
                //             textAlign: TextAlign.center,
                //             style: context.titleSmall!
                //                 .copyWith(fontWeight: FontWeight.w500),
                //           ),
                //           45.verticalSpace,
                //           Row(
                //             children: [
                //               Container(
                //                 height: 55.h,
                //                 width: 140.w,
                //                 child: CustomButton(
                //                   onTap: () {
                //                     logout();
                //                     // Get.toNamed(AppRoutes.signIn);
                //                   },
                //                   title: 'Yes',
                //                 ),
                //               ),
                //               8.horizontalSpace,
                //               Container(
                //                 height: 55.h,
                //                 width: 140.w,
                //                 child: CustomButton(
                //                   onTap: () {
                //                     Get.back();
                //                   },
                //                   title: 'No',
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // );
                Get.offAllNamed(AppRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
