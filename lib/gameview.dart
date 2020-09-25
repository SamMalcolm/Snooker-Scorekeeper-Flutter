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
      mainAxisSize: MainAxisSize.max,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        returnScoreLine(),
        Padding(
          padding: const EdgeInsets.only(
              left: 8.0, right: 8.0, bottom: 8.0, top: 36.0),
          child: Column(
            children: [
              RaisedButton(
                child: Text('Return'),
                onPressed: () {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MyHomePage(title: 'Snooker Scoreboard'),
                      ));
                },
              ),
              Text(widget.playerNames[0]),
              if (widget.playerHandicaps != null)
                Text('${widget.playerHandicaps[0]}'),
              Text(widget.playerNames[1]),
              if (widget.playerHandicaps != null)
                Text('${widget.playerHandicaps[1]}'),
              Text('Reds Remaining'),
              Text('${this.game.redsRemaining}')
            ],
          ),
        ),
        returnScoreLine(),
      ],
    ));
  }
}
