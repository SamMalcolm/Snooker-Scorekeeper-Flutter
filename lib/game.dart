import 'package:flutter/material.dart';
import 'main.dart';
import 'game.class.dart';

class Game extends StatefulWidget {
  Game({Key key, this.playerNames, this.playerHandicaps}) : super(key: key);

  final List playerNames;
  final List playerHandicaps;

  @override
  _Game createState() => _Game();
}

class _Game extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snooker Scoreboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('Return'),
            onPressed: () {
              Navigator.push(
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
        ],
      ),
    );
  }
}
