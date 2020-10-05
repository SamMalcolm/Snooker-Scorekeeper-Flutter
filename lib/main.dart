import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'gameview.dart';
import 'components.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snooker',
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image(image: AssetImage('images/snooker.jpg')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Snooker Scorer',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 15.00),
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
          SizedBox(height: 15.00),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              bigButton(
                  Text('Handicap',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 22,
                        color: Colors.white,
                      )),
                  freeBallInputColour(handicap), () {
                setState(() {
                  handicap = !handicap;
                });
              }),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              bigButton(
                  Text('Start Game',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 22,
                        color: Colors.white,
                      )),
                  [
                    const Color(0xff4CA256),
                    const Color(0xff397140),
                  ], () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameView(
                          playerNames: [player1name, player2name],
                          playerHandicaps: [player1Handicap, player2Handicap]),
                    ));
              }),
            ]),
          ),
        ],
      ),
    );
  }
}
