import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'gameview.dart';
import 'components.dart';

void main() => runApp(MyApp());

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

  List<Widget> handicapInput(phc, setval) {
    return [
      SizedBox(width: 10.00),
      bigButton(
          Text(
            '+10',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          [const Color(0xffCCCACA), const Color(0xffA2A0A0)], () {
        setval(10);
      }),
      SizedBox(width: 10.00),
      bigButton(
          Text(
            '+1',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          [const Color(0xffCCCACA), const Color(0xffA2A0A0)], () {
        setval(1);
      }),
      SizedBox(width: 10.00),
      Text(
        '$phc',
        style: TextStyle(
          fontFamily: 'Helvetica Neue',
          fontSize: 22,
        ),
      ),
      SizedBox(width: 10.00),
      bigButton(
          Text(
            '-1',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          [const Color(0xffCCCACA), const Color(0xffA2A0A0)], () {
        setval(-1);
      }),
      SizedBox(width: 10.00),
      bigButton(
          Text(
            '-10',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          [const Color(0xffCCCACA), const Color(0xffA2A0A0)], () {
        setval(-10);
      }),
      SizedBox(width: 10.00),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: OrientationBuilder(builder: (context, orientation) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    height: (orientation == Orientation.landscape)
                        ? 100.00
                        : 250.00,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment.topCenter,
                          image: AssetImage('images/table.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(5.0),
                      height: (orientation == Orientation.landscape)
                          ? 100.00
                          : 250.00,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.black.withAlpha(0),
                            Colors.black26,
                            Colors.black87
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Snooker Scoreboard',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(
                    (orientation == Orientation.landscape) ? 40.00 : 16.00),
                child: Column(children: [
                  SizedBox(height: 15.00),
                  TextField(
                    decoration: InputDecoration(hintText: 'Player 1 Name'),
                    onChanged: (String value) {
                      setState(() {
                        value = (value != "") ? value : "Player 1";
                        player1name = value;
                      });
                    },
                  ),
                  SizedBox(height: 15.00),
                  if (handicap)
                    Row(children: [
                      ...handicapInput(player1Handicap, (val) {
                        setState(() {
                          player1Handicap += val;
                        });
                      }),
                      SizedBox(height: 15.00),
                    ]),
                  TextField(
                    decoration: InputDecoration(hintText: 'Player 2 Name'),
                    onChanged: (String value) {
                      setState(() {
                        value = (value != "") ? value : "Player 2";
                        player2name = value;
                      });
                    },
                  ),
                  SizedBox(height: 15.00),
                  if (handicap)
                    Row(children: [
                      ...handicapInput(player2Handicap, (value) {
                        setState(() {
                          player2Handicap += value;
                        });
                      }),
                      SizedBox(height: 15.00),
                    ]),
                  SizedBox(height: 15.00),
                  Row(children: [
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
                  SizedBox(height: 15.00),
                  Row(children: [
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
                            builder: (context) => GameView(playerNames: [
                              player1name,
                              player2name
                            ], playerHandicaps: [
                              player1Handicap,
                              player2Handicap
                            ]),
                          ));
                    }),
                  ]),
                ]),
              )
            ],
          ),
        );
      }),
    ));
  }
}
