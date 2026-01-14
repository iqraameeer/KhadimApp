import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khadim_app/Utils/Extensions/text_extension.dart';
import '../../../Utils/Const/asset_const.dart';
import '../../../Utils/Const/color_const.dart';
import 'signup_view_model.dart';

class sendOtpScreen extends StatefulWidget {
  const sendOtpScreen({super.key});

  @override
  State<sendOtpScreen> createState() => _sendOtpScreenState();
}

class _sendOtpScreenState extends State<sendOtpScreen> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  final FocusNode _focusNodeOne = FocusNode();
  final FocusNode _focusNodeTwo = FocusNode();
  final FocusNode _focusNodeThree = FocusNode();
  final FocusNode _focusNodeFour = FocusNode();

  final SignupViewModel _controller = Get.find<SignupViewModel>();

  @override
  void initState() {
    super.initState();
    _fieldOne.addListener(_onOtpChange);
    _fieldTwo.addListener(_onOtpChange);
    _fieldThree.addListener(_onOtpChange);
    _fieldFour.addListener(_onOtpChange);
  }

  void _onOtpChange() {
    if (_fieldOne.text.isNotEmpty &&
        _fieldTwo.text.isNotEmpty &&
        _fieldThree.text.isNotEmpty &&
        _fieldFour.text.isNotEmpty) {
      _controller.showSuccessDialog(context);
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: primary,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            children: [
              40.verticalSpace,
              Center(child: Image.asset(ImageConst.logo)),
              20.verticalSpace,
              Text(
                'Verification Code',
                style: context.displaySmall!.copyWith(color: primary),
              ),
              5.verticalSpace,
              Text(
                'Enter the verification code sent\nto your number',
                style: context.bodyLarge!.copyWith(color: primary),
                textAlign: TextAlign.center,
              ),
              41.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OtpInput(
                      controller: _fieldOne,
                      autoFocus: true,
                      focusNode: _focusNodeOne,
                      nextFocusNode: _focusNodeTwo),
                  OtpInput(
                    controller: _fieldTwo,
                    autoFocus: false,
                    focusNode: _focusNodeTwo,
                    previousFocusNode: _focusNodeOne,
                    nextFocusNode: _focusNodeThree,
                  ),
                  OtpInput(
                      controller: _fieldThree,
                      autoFocus: false,
                      focusNode: _focusNodeThree,
                      previousFocusNode: _focusNodeTwo,
                      nextFocusNode: _focusNodeFour),
                  OtpInput(
                      controller: _fieldFour,
                      autoFocus: false,
                      focusNode: _focusNodeFour,
                      previousFocusNode: _focusNodeThree),
                ],
              ),
              40.verticalSpace,
              RichText(
                text: TextSpan(
                  text: 'I don’t receive a code!',
                  style: context.bodyLarge!.copyWith(color: grey),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Please Resend',
                        style: context.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w700, color: primary)),
                  ],
                ),
              ),
            ],
          ),
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
    Key? key,
    required this.controller,
    this.autoFocus = false,
    required this.focusNode,
    this.previousFocusNode,
    this.nextFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: 80.w,
      child: TextFormField(
        autofocus: autoFocus,
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: secondary.withOpacity(0.3),
          counterText: '',
          contentPadding: EdgeInsets.all(18),
        ),
        style: TextStyle(fontSize: 30.sp, color: primary),
        onChanged: (value) {
          if (value.length == 1 && nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          } else if (value.isEmpty && previousFocusNode != null) {
            FocusScope.of(context).requestFocus(previousFocusNode);
          }
        },
      ),
    );
  }
}