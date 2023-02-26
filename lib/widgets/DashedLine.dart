import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  late double dashedWidth;
  late double dashedWeight;
  late double dashedInterval;
  late Axis axis;
  late Color color;

  DashedLine(
      {Key? key,
      this.dashedWidth = 10,
      this.dashedWeight = 1,
      this.dashedInterval = 10,
      this.color = Colors.black,
      this.axis = Axis.horizontal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final length = axis == Axis.horizontal
          ? constraints.constrainWidth()
          : constraints.constrainHeight();

      final width = axis == Axis.horizontal ? dashedWidth : dashedWeight;
      final height = axis == Axis.horizontal ? dashedWeight : dashedWidth;

      final count = (length /
              ((axis == Axis.horizontal ? width : height) + dashedInterval))
          .ceil();

      return Container(
          constraints: BoxConstraints(
              maxWidth: constraints.constrainWidth(),
              maxHeight: constraints.constrainHeight()),
          child: Flex(
            direction: axis,
            // children: List.generate(
            //     count,
            //     (index) => Container(
            //           color: color,
            //           width: width,
            //           height: height,
            //           margin: axis == Axis.horizontal
            //               ? EdgeInsets.only(right: dashedInterval)
            //               : EdgeInsets.only(bottom: dashedInterval),
            //         )),
            children: List.filled(count, null)
                .asMap()
                .entries
                .map((e) => Container(
                      color: color,
                      width: width,
                      height: height,
                      margin: e.key != count - 1
                          ? axis == Axis.horizontal
                              ? EdgeInsets.only(right: dashedInterval)
                              : EdgeInsets.only(bottom: dashedInterval)
                          : null,
                    ))
                .toList(),
          ));
    });
  }
}
