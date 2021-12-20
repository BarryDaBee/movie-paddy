import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double? height;
  final double? width;
  // const Space._({Key? key, this.height, this.width}) : super(key: key);
  const Space.x(this.width, {Key? key})
      : height = 0,
        super(key: key);
  const Space.y(this.height, {Key? key})
      : width = 0,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
