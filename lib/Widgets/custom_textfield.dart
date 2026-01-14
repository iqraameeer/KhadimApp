import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/Const/color_const.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool? readOnly;
  final bool? obscureText;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final Widget? prefix;
  final Widget? suffix;
  final int? minLines;
  final int? maxLines;
  final TextInputAction? inputAction;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.readOnly,
    this.obscureText,
    this.onTap,
    this.prefix,
    this.suffix,
    this.minLines,
    this.maxLines,
    this.inputAction,
    this.validator,
    this.keyboardType,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      obscureText: widget.obscureText ?? false,
      validator: widget.validator,
      onTap: widget.onTap,
      controller: widget.controller,
      minLines: widget.obscureText == true ? 1 : (widget.minLines ?? 1),
      maxLines: widget.obscureText == true ? 1 : widget.maxLines,
      textInputAction: widget.inputAction ?? TextInputAction.done,
      keyboardType:
          widget.keyboardType ?? TextInputType.text,
      style: TextStyle(
        color: _isFocused ? primary : primary,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'ProductSans',
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: grey,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'ProductSans',
        ),
        prefixStyle: TextStyle(fontSize: 20.sp),
        focusColor: primary,
        contentPadding: EdgeInsets.only(
          left: 18.w,
          top: 16.h,
          bottom: 19.h,
        ),
        filled: true,
        fillColor: white,
        prefixIconColor: primary,
        suffixIconColor: primary,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(width: 1.5, color: white),
        ),
        suffixIcon: widget.suffix,
        prefixIcon: widget.prefix,
        hintText: widget.hintText,
      ),
    );
  }
}
