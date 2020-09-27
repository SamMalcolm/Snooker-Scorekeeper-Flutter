import 'package:flutter/material.dart';
import 'main.dart';
import 'game.class.dart';

class GameView extends StatefulWidget {
  GameView({Key key, this.playerNames, this.playerHandicaps}) : super(key: key);

  final List playerNames;
  final List playerHandicaps;

  @override
  _GameView createState() => _GameView();
}

class _GameView extends State<GameView> {
  int redsRemaining;
  Game game;

  List scoreBoard() {
    return [
      Row(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              // width: double.infinity / 3,
              child: Text(
                '3',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 22,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(
                '(7)',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 22,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(
                '3',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 22,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ])
    ];
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

  @override
  Widget build(BuildContext context) {
    setState(() {
      game = new Game(widget.playerNames, widget.playerHandicaps);
    });
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        returnScoreLine(),
        Row(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [...scoreBoard()],
        ),
        returnScoreLine(),
      ],
    ));
  }
}
