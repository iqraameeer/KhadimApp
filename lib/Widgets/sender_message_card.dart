import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/Const/asset_const.dart';
import '../Utils/Const/color_const.dart';

class SenderMessageCard extends StatefulWidget {
  const SenderMessageCard(this.fileName, this.msgType, this.msg, this.time,
      {Key? key})
      : super(key: key);

  final String msg;
  final String time;
  final String msgType;
  final String fileName;

  @override
  State<SenderMessageCard> createState() => _SenderMessageCardState();
}

class _SenderMessageCardState extends State<SenderMessageCard> {
  int? bufferDelay;
  Widget messageBuilder(context) {
    Widget body = Container();
    if (widget.msgType == "image") {
      body = Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: SizedBox(
          width: 250,
          height: 250,
          // child: Image.asset(
          //   ImageConst.fashionshowimg1,
          // ),
        ),
      );
    } else if (widget.msgType == "text") {
      body = Container(
        margin: EdgeInsets.only(left: 100),
        padding:
            EdgeInsets.only(left: 26.w, right: 26.w, top: 16.h, bottom: 10.h),
        child: SelectableText(
          widget.msg,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      );
    } else if (widget.msgType == "document") {
      body = body = Padding(
        padding: const EdgeInsets.only(left: 10, right: 20, top: 5, bottom: 5),
        child: SelectableText(
          widget.fileName,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      );
    } else if (widget.msgType == "audio") {
      body = body = Padding(
        padding: const EdgeInsets.only(left: 10, right: 20, top: 5, bottom: 5),
        child: SelectableText(
          widget.fileName,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      );
    }

    return body;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10.r),
              topLeft: Radius.circular(10.r),
              bottomLeft: Radius.circular(10.r),
            ),
          ),
          color: primary.withOpacity(0.5),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            messageBuilder(context),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Text(widget.time,
                  style: const TextStyle(fontSize: 13, color: Colors.white)),
            )
          ]),
        ));
  }
}
