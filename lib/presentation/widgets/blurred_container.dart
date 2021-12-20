import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class BlurredContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;

  const BlurredContainer({Key? key, this.height, this.width, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3,
          sigmaY: 3,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
            color: const Color(0xFFDADADA).withOpacity(0.3),
          ),
          height: height,
          width: width,
          child: child,
        ),
      ),
    );
  }
}
