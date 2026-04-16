import 'package:flutter/material.dart';
import 'package:khadim_app/Utils/Const/color_const.dart';

import '../../../../Utils/Extensions/text_extension.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text(
          'Contact',
          style: context.titleMedium!.copyWith(color: black),
        ),
      ),
    );
  }
}
