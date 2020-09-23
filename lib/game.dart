import 'package:flutter/material.dart';
import 'main.dart';
import 'game.class.dart';

class Game extends StatelessWidget {
  Game({
    Key key,
  }) : super(key: key);
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
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MyHomePage(title: 'Snooker Scoreboard'),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
