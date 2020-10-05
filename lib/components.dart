import 'package:flutter/material.dart';

Widget bigButton(child, gradientValues, pressed) {
  return Expanded(
      child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18.0),
      gradient: LinearGradient(
        begin: Alignment(1.0, -1.92),
        end: Alignment(-0.94, 1.75),
        colors: gradientValues,
        stops: [0.0, 1.0],
      ),
    ),
    child: RawMaterialButton(
      onPressed: pressed,
      child: Padding(padding: const EdgeInsets.all(16.0), child: child),
    ),
  ));
}

List<Color> freeBallInputColour(condition) {
  if (condition) {
    return [const Color(0xff9B9797), const Color(0xff7E7C7C)];
  } else {
    return [const Color(0xffCCCACA), const Color(0xffA2A0A0)];
  }
}
