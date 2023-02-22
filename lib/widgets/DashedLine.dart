import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  late int dashedWidth;
  late int dashedWeight;
  late Axis axis;

  DashedLine(
      {Key? key,
      this.dashedWidth = 10,
      this.dashedWeight = 1,
      this.axis = Axis.horizontal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      children: ,
    );
  }
}
