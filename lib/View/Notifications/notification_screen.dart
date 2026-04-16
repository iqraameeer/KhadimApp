import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Utils/Const/asset_const.dart';
import '../../Utils/Const/color_const.dart';
import '../../Utils/Extensions/text_extension.dart';
import 'animated_list_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  AnimatedListController animatedListController =
  Get.put(AnimatedListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      // appBar: CustomAppBar(
      //   title: 'Notifications',
      //   isLeading: true,
      // ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Today',
                style: context.headlineMedium!.copyWith(color: grey)
            ),
            20.verticalSpace,
            Expanded(
              child: GetBuilder(
                init: animatedListController,
                builder: (_) {
                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return AnimatedContainer(
                        height: 95.h,
                        width: 1.sw,
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 300 + (index * 200)),
                        transform: Matrix4.translationValues(
                            animatedListController.startAnimation.value
                                ? 0
                                : 1.sw,
                            0,
                            0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(350.r),
                              child: Image.asset(
                                ImageConst.profile,
                                height: 70.h,
                                width: 70.w,
                              ),
                            ),
                            17.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 290.w,
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                                text:
                                                'You just received a payment of ',
                                                style: context
                                                    .titleLarge!
                                                    .copyWith(color: black)),
                                            TextSpan(
                                              text: '\$880',
                                              style: context
                                                  .titleLarge!
                                                  .copyWith(color: primary),
                                            ),
                                            TextSpan(
                                                text: ' from ',
                                                style: context
                                                    .titleLarge!
                                                    .copyWith(color: black)),
                                            TextSpan(
                                              text: 'Mr Ranchordas',
                                              style: context
                                                  .titleMedium!
                                                  .copyWith(
                                                color: primary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                          style: context.titleMedium!
                                              .copyWith(color: primary),
                                        ),
                                      ),
                                    ),
                                    // ElevatedButton(onPressed: (){}, child: Text('PAY'),),
                                  ],
                                ),
                                7.verticalSpace,
                                Text(
                                  '9: 10 am',
                                  style: context.titleMedium!
                                      .copyWith(color: grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      indent: 0.2.sw,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
