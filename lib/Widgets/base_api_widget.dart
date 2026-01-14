
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Data/response/status.dart';
import '../Utils/Const/color_const.dart';

const ApiMessage = "N/A";

class BaseApiWidget extends StatelessWidget {
  const BaseApiWidget({
    super.key,
    required this.status,
    required this.message,
    required this.child,
  });

  final Status status;
  final String message;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (status == Status.INITIAL) {
      return Container();
    } else if (status == Status.LOADING) {
      return SizedBox(
        height: 200.h,
        child: Center(
          child: CircularProgressIndicator(
            color: primary,
          ),
        ),
      );
    } else if (status == Status.ERROR) {
      return Text(message);
    } else if (status == Status.COMPLETED) {
      return child;
    } else {
      return Container();
    }
  }
}
