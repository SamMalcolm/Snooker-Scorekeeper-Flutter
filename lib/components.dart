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

Widget returnScoreLine() {
  return Container(
    height: double.infinity,
    width: 35.00,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 1,
          child: Container(
              color: Color(0xFFCCCCCC),
              child: Padding(
                padding: const EdgeInsets.only(top: 36.0),
                child: Text('129',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black)),
              )),
        ),
        FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 0.5,
          child: Container(
              color: Color(0xFFC3A164),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('129',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
              )),
        ),
        FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 0.2,
          child: Container(
              color: Color(0xFF7D73B5),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('129',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
              )),
        ),
      ],
    ),
  );
}

Widget ballButton(text, gradientValues, cb) {
  return Expanded(
      child: Container(
          height: 90.00,
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
              onPressed: cb,
              child: Text('$text',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 22,
                    color: Colors.white,
                  )))));
}
