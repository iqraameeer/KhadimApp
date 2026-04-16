import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khadim_app/Utils/Extensions/text_extension.dart';
import '../../../Config/AppRoutes/route_imports.dart';
import '../../../Utils/Const/asset_const.dart';
import '../../../Utils/Const/color_const.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  final FocusNode _focusNodeOne = FocusNode();
  final FocusNode _focusNodeTwo = FocusNode();
  final FocusNode _focusNodeThree = FocusNode();
  final FocusNode _focusNodeFour = FocusNode();

  @override
  void initState() {
    super.initState();
    _fieldOne.addListener(_checkOtp);
    _fieldTwo.addListener(_checkOtp);
    _fieldThree.addListener(_checkOtp);
    _fieldFour.addListener(_checkOtp);
  }

  void _checkOtp() {
    if (_fieldOne.text.isNotEmpty &&
        _fieldTwo.text.isNotEmpty &&
        _fieldThree.text.isNotEmpty &&
        _fieldFour.text.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 300), () {
        Get.toNamed(AppRoutes.resetpassword);
      });
    }
  }

  @override
  void dispose() {
    _fieldOne.dispose();
    _fieldTwo.dispose();
    _fieldThree.dispose();
    _fieldFour.dispose();
    _focusNodeOne.dispose();
    _focusNodeTwo.dispose();
    _focusNodeThree.dispose();
    _focusNodeFour.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_new, color: black),
                onPressed: () => Get.back(),
              ),
            ),
            20.verticalSpace,
            Image.asset(
              ImageConst.splash,
              height: 90,
            ),
            20.verticalSpace,
            Text(
              'Verification Code',
              style: context.headlineLarge!.copyWith(
                color: black,
                fontWeight: FontWeight.bold,
              ),
            ),
            8.verticalSpace,
            Text(
              'Enter the verification code sent\nto your number',
              textAlign: TextAlign.center,
              style: context.titleMedium!.copyWith(color: black),
            ),
            30.verticalSpace,
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: secondary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60.r),
                    topRight: Radius.circular(60.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 40.h,
                  ),
                  child: Column(
                    children: [
                      80.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OtpInput(
                            controller: _fieldOne,
                            autoFocus: true,
                            focusNode: _focusNodeOne,
                            nextFocusNode: _focusNodeTwo,
                          ),
                          OtpInput(
                            controller: _fieldTwo,
                            focusNode: _focusNodeTwo,
                            previousFocusNode: _focusNodeOne,
                            nextFocusNode: _focusNodeThree,
                          ),
                          OtpInput(
                            controller: _fieldThree,
                            focusNode: _focusNodeThree,
                            previousFocusNode: _focusNodeTwo,
                            nextFocusNode: _focusNodeFour,
                          ),
                          OtpInput(
                            controller: _fieldFour,
                            focusNode: _focusNodeFour,
                            previousFocusNode: _focusNodeThree,
                          ),
                        ],
                      ),
                      40.verticalSpace,
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'I don’t receive a code!',
                          style: context.bodyLarge!.copyWith(color: black),
                          children: [
                            TextSpan(
                              text: ' Please Resend',
                              style: context.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w700,
                                color: primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final FocusNode focusNode;
  final FocusNode? previousFocusNode;
  final FocusNode? nextFocusNode;

  const OtpInput({
    super.key,
    required this.controller,
    this.autoFocus = false,
    required this.focusNode,
    this.previousFocusNode,
    this.nextFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 60.w,
      child: RawKeyboardListener(
        focusNode: FocusNode(), // For keyboard events
        onKey: (RawKeyEvent event) {
          if (event is RawKeyDownEvent) {
            if (event.logicalKey == LogicalKeyboardKey.backspace) {
              // Backspace pressed
              if (controller.text.isEmpty && previousFocusNode != null) {
                FocusScope.of(context).requestFocus(previousFocusNode);
              }
            }
          }
        },
        child: TextField(
          autofocus: autoFocus,
          controller: controller,
          focusNode: focusNode,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: black,
          ),
          decoration: InputDecoration(
            counterText: '',
            contentPadding: EdgeInsets.symmetric(vertical: 18.h),
            filled: true,
            fillColor:
            focusNode.hasFocus ? white : white.withOpacity(0.7),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide(color: primary, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide(color: primary, width: 1),
            ),
          ),
          onChanged: (value) {
            if (value.length == 1 && nextFocusNode != null) {
              FocusScope.of(context).requestFocus(nextFocusNode);
            }
          },
        ),
      ),
    );
  }
}