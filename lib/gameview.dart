import 'package:flutter/material.dart';
import 'game.class.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'components.dart';

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
  bool foulInput = false;
  bool fb = false;
  bool init = false;
  Widget ballButton(text, gradientValues) {
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
                onPressed: () {
                  print('Pressed');
                },
                child: Text('$text',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 22,
                      color: Colors.white,
                    )))));
  }

  List scoringInput() {
    return [
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(children: [
          Row(children: [
            bigButton(
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('+1',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 22,
                            color: Colors.white,
                          )),
                      Container(),
                      Text('${game.redsRemaining}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 22,
                            color: Colors.white,
                          )),
                    ]),
                [
                  const Color(0xffC72D2D),
                  const Color(0xff9D2C2C),
                ], () {
              print('pressed');
            }),
            SizedBox(width: 10.00),
            Expanded(
                child: Row(
              children: [
                bigButton(
                    Text('+',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 22,
                          color: Colors.white,
                        )),
                    [
                      const Color(0xffC72D2D),
                      const Color(0xff9D2C2C),
                    ], () {
                  setState(() {
                    game.incrementReds();
                  });
                }),
                SizedBox(width: 10.00),
                bigButton(
                    Text('-',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 22,
                          color: Colors.white,
                        )),
                    [
                      const Color(0xffC72D2D),
                      const Color(0xff9D2C2C),
                    ], () {
                  setState(() {
                    game.decrementReds();
                  });
                }),
              ],
            ))
          ]),

          //

          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                ballButton('+2', [
                  const Color(0xffE0C534),
                  const Color(0xffCEB636),
                ]),
                SizedBox(width: 10.00),
                ballButton('+3', [
                  const Color(0xff4CA256),
                  const Color(0xff397140),
                ]),
                SizedBox(width: 10.00),
                ballButton('+4', [
                  const Color(0xffB48247),
                  const Color(0xff694A20),
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                ballButton('+5', [
                  const Color(0xff5271D6),
                  const Color(0xff2F4EB4),
                ]),
                SizedBox(width: 10.00),
                ballButton('+6', [
                  const Color(0xffE066BA),
                  const Color(0xff9B3D9B),
                ]),
                SizedBox(width: 10.00),
                ballButton('+7', [
                  const Color(0xff393939),
                  const Color(0xff0B0B0B),
                ]),
              ],
            ),
          ),
          SizedBox(height: 10.00),
          if (!foulInput)
            Row(
              children: [
                bigButton(
                    Text('Foul',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 22,
                          color: Colors.white,
                        )),
                    [
                      const Color(0xffCCCACA),
                      const Color(0xffA2A0A0),
                    ], () {
                  setState(() {
                    foulInput = true;
                  });
                })
              ],
            ),
          if (foulInput)
            Row(
              children: [
                bigButton(
                    Text('4',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 22,
                          color: Colors.white,
                        )),
                    [
                      const Color(0xffCCCACA),
                      const Color(0xffA2A0A0),
                    ], () {
                  setState(() {
                    foulInput = false;
                  });
                }),
                SizedBox(width: 10.00),
                bigButton(
                    Text('5',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 22,
                          color: Colors.white,
                        )),
                    [
                      const Color(0xffCCCACA),
                      const Color(0xffA2A0A0),
                    ], () {
                  setState(() {
                    foulInput = false;
                  });
                }),
                SizedBox(width: 10.00),
                bigButton(
                    Text('6',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 22,
                          color: Colors.white,
                        )),
                    [
                      const Color(0xffCCCACA),
                      const Color(0xffA2A0A0),
                    ], () {
                  setState(() {
                    foulInput = false;
                  });
                }),
                SizedBox(width: 10.00),
                bigButton(
                    Text('7',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 22,
                          color: Colors.white,
                        )),
                    [
                      const Color(0xffCCCACA),
                      const Color(0xffA2A0A0),
                    ], () {
                  setState(() {
                    foulInput = false;
                  });
                }),
              ],
            ),
          SizedBox(height: 10.00),
          Row(
            children: [
              bigButton(
                  Text('Free Ball',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 22,
                        color: Colors.white,
                      )),
                  freeBallInputColour(fb), () {
                setState(() {
                  fb = !fb;
                });
              })
            ],
          ),
          SizedBox(height: 10.00),
          Row(
            children: [
              bigButton(
                  Text('Undo',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 22,
                        color: Colors.white,
                      )),
                  [
                    const Color(0xffCCCACA),
                    const Color(0xffA2A0A0),
                  ], () {
                print('pressed');
              }),
              SizedBox(width: 10.00),
              bigButton(
                  Text('Resign',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 22,
                        color: Colors.white,
                      )),
                  [
                    const Color(0xffCCCACA),
                    const Color(0xffA2A0A0),
                  ], () {
                print('pressed');
              })
            ],
          ),
          SizedBox(height: 10.00),
          Row(
            children: [
              bigButton(
                  Text('Pass Turn',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: 22,
                        color: Colors.white,
                      )),
                  [
                    const Color(0xffCCCACA),
                    const Color(0xffA2A0A0),
                  ], () {
                print('pressed');
              })
            ],
          ),
        ]),
      )
    ];
  }

  List scoreBoard() {
    return [
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Column(children: [
            Text(
              '3',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '32',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 42,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              game.players[0].name,
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ]),
        ),
        Expanded(
          child: Container(
            child: Text(
              '(${game.framesPlayed})',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Column(children: [
            Text(
              '3',
              style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              '147',
              style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 42,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              game.players[1].name,
              style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ]),
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
    print('BUILDING');

    setState(() {
      if (!init) {
        game = new Game(widget.playerNames, widget.playerHandicaps);
        init = true;
      }
    });

    return Scaffold(body: OrientationBuilder(builder: (context, orientation) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          returnScoreLine(),
          Expanded(
            child: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...scoreBoard(),
                      ...scoringInput(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          returnScoreLine(),
          if (orientation == Orientation.landscape) SizedBox(width: 30.00)
        ],
      );
    }));
  }
}
