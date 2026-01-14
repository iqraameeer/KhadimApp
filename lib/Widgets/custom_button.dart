import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/Const/color_const.dart';
import '../Utils/Extensions/text_extension.dart';

enum LeadingPosition { before, after, none }

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String title;
  final bool isSelectTitile;
  final TextStyle? style;
  final VoidCallback? onTap;
  final Widget? leading;
  final LeadingPosition leadingPosition;

  final Color? backgroundColor;
  final Color? textColor;
  final bool showBorder;

  const CustomButton({
    Key? key,
    this.width = 362,
    this.height = 54,
    required this.title,
    this.isSelectTitile = false,
    this.style,
    this.onTap,
    this.leading,
    this.leadingPosition = LeadingPosition.before,
    this.backgroundColor,
    this.textColor,
    this.showBorder = false,
  }) : super(key: key);

  /// 🔹 Named constructor for white background button
  const CustomButton.white({
    Key? key,
    this.width = 362,
    this.height = 54,
    required this.title,
    this.isSelectTitile = false,
    this.style,
    this.onTap,
    this.leading,
    this.leadingPosition = LeadingPosition.before,
  })  : backgroundColor = Colors.white,
        textColor = Colors.teal,
        showBorder = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bgColor = backgroundColor ?? primary;
    Color tColor = textColor ?? white;

    List<Widget> children = [];

    if (leading != null && leadingPosition == LeadingPosition.before) {
      children.add(
          DefaultTextStyle(style: TextStyle(color: tColor), child: leading!));
      children.add(5.horizontalSpace);
    }

    children.add(
      Text(
        title,
        style: style ??
            context.bodyLarge!.copyWith(
              color: tColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    );

    if (leading != null && leadingPosition == LeadingPosition.after) {
      children.add(5.horizontalSpace);
      children.add(
          DefaultTextStyle(style: TextStyle(color: tColor), child: leading!));
    }

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: tColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
            side: showBorder ? BorderSide(color: tColor) : BorderSide.none,
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
