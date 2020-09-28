import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'gameview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snooker Scoreboard',
      theme:
          ThemeData(primarySwatch: Colors.green, brightness: Brightness.light),
      home: MyHomePage(title: 'Snooker Scoreboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String player1name = "Player 1";
  String player2name = "Player 2";

  int player1Handicap = 0;
  int player2Handicap = 0;

  bool handicap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(hintText: 'Player 1 Name'),
              onChanged: (String value) {
                setState(() {
                  value = (value != "") ? value : "Player 1";
                  player1name = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(hintText: 'Player 2 Name'),
              onChanged: (String value) {
                setState(() {
                  value = (value != "") ? value : "Player 2";
                  player2name = value;
                });
              },
            ),
          ),
          Text('Handicapped'),
          Checkbox(
            value: handicap,
            onChanged: (bool newValue) {
              setState(() {
                if (!newValue) {
                  player1Handicap = 0;
                  player2Handicap = 0;
                }
                handicap = newValue;
              });
            },
          ),
          if (handicap)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration:
                      InputDecoration(hintText: player1name + ' handicap'),
                  onChanged: (String value) {
                    setState(() {
                      int newValue;
                      newValue = int.parse(value);
                      player1Handicap = newValue;
                    });
                  }),
            ),
          if (handicap)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration:
                      InputDecoration(hintText: player2name + ' handicap'),
                  onChanged: (String value) {
                    setState(() {
                      int newValue;
                      newValue = int.parse(value);
                      player2Handicap = newValue;
                    });
                  }),
            ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameView(
                        playerNames: [player1name, player2name],
                        playerHandicaps: [player1Handicap, player2Handicap]),
                  ));
            },
            child: const Text('Start Game', style: TextStyle(fontSize: 20)),
          )
        ],
      ),
    );
  }
}
