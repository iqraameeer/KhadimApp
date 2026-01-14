import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/Const/color_const.dart';
import '../Utils/Extensions/text_extension.dart';

class CustomLoadingWidget extends StatelessWidget {
  final String message;
  final bool userInteraction;
  final bool isLoading;
  final Color backgroundColor;

  const CustomLoadingWidget(
      {Key? key,
        this.message = 'Loading...',
        this.userInteraction = false,
        required this.isLoading,
        this.backgroundColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: isLoading
          ? IgnorePointer(
        ignoring: userInteraction,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator.adaptive(
                backgroundColor: primary,
              ),
              15.verticalSpace,
              Text(
                "Loading...",
                style: context.titleSmall!.copyWith(
                  color: white,
                ),
              ),
            ],
          ),
        ),
      )
          : const SizedBox.shrink(),
    );
  }
}