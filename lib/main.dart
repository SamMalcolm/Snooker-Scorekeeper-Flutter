import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snooker Scoreboard',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Snooker Scoreboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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

  void _incrementCounter() {
    setState(() {
      player1Handicap++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                    builder: (context) => Game(
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
