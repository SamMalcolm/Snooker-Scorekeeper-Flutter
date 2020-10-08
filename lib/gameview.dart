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

  List<Widget> foulButtons() {
    List<Widget> result = [];
    for (int i = 4; i < 8; i++) {
      result.add(bigButton(
          Text('$i',
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
          game.foul(i);
        });
      }));
      if (i != 7) {
        result.add(SizedBox(width: 10.00));
      }
    }
    return result;
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
                ],
                (game.redsRemaining > 0)
                    ? () {
                        setState(() {
                          game.pot("R", fb);
                          fb = false;
                        });
                      }
                    : null),
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
                ballButton(
                    '+2',
                    [
                      const Color(0xffE0C534),
                      const Color(0xffCEB636),
                    ],
                    (game.yellowsRemaining > 0)
                        ? () {
                            setState(() {
                              game.pot("Y", fb);
                              fb = false;
                            });
                          }
                        : null),
                SizedBox(width: 10.00),
                ballButton(
                    '+3',
                    [
                      const Color(0xff4CA256),
                      const Color(0xff397140),
                    ],
                    (game.greensRemaining > 0)
                        ? () {
                            setState(() {
                              game.pot("G", fb);
                              fb = false;
                            });
                          }
                        : null),
                SizedBox(width: 10.00),
                ballButton(
                    '+4',
                    [
                      const Color(0xffB48247),
                      const Color(0xff694A20),
                    ],
                    (game.brownsRemaining > 0)
                        ? () {
                            setState(() {
                              game.pot("br", fb);
                              fb = false;
                            });
                          }
                        : null),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                ballButton(
                    '+5',
                    [
                      const Color(0xff5271D6),
                      const Color(0xff2F4EB4),
                    ],
                    (game.bluesRemaining > 0)
                        ? () {
                            setState(() {
                              game.pot("bl", fb);
                              fb = false;
                            });
                          }
                        : null),
                SizedBox(width: 10.00),
                ballButton(
                    '+6',
                    [
                      const Color(0xffE066BA),
                      const Color(0xff9B3D9B),
                    ],
                    (game.pinksRemaining > 0)
                        ? () {
                            setState(() {
                              game.pot("P", fb);
                              fb = false;
                            });
                          }
                        : null),
                SizedBox(width: 10.00),
                ballButton(
                    '+7',
                    [
                      const Color(0xff393939),
                      const Color(0xff0B0B0B),
                    ],
                    (game.blacksRemaining > 0)
                        ? () {
                            setState(() {
                              game.pot("B", fb);
                              fb = false;
                            });
                          }
                        : null),
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
              children: [...foulButtons()],
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
                setState(() {
                  game.undo();
                });
              }),
              SizedBox(width: 10.00),
              bigButton(
                  Text('Frame Conceded',
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
                  game.endGame();
                });
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
                setState(() {
                  game.passTurn();
                });
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
              '${game.players[0].framesWon}',
              style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 22,
                  fontWeight: (game.players[0].active)
                      ? FontWeight.bold
                      : FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              '${game.players[0].score}',
              style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 42,
                  fontWeight: (game.players[0].active)
                      ? FontWeight.bold
                      : FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              game.players[0].name,
              style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 18,
                  fontWeight: (game.players[0].active)
                      ? FontWeight.bold
                      : FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              'Break: ${game.players[0].currBreak}',
              style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 12,
                  fontWeight: (game.players[0].active)
                      ? FontWeight.bold
                      : FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              'HB: ${game.players[0].highestBreak}',
              style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 12,
                  fontWeight: (game.players[0].active)
                      ? FontWeight.bold
                      : FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            if (game.players[0].snookersRequired > 0)
              Text(
                'Snookers: ${game.players[0].snookersRequired}',
                style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 12,
                    fontWeight: (game.players[0].active)
                        ? FontWeight.bold
                        : FontWeight.normal),
                textAlign: TextAlign.center,
              ),
          ]),
        ),
        Expanded(
          child: Column(children: [
            Text(
              '(${game.framesPlayed})',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
          ]),
        ),
        Expanded(
          child: Column(children: [
            Text(
              '${game.players[1].framesWon}',
              style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 22,
                  fontWeight: (game.players[1].active)
                      ? FontWeight.bold
                      : FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              '${game.players[1].score}',
              style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 42,
                  fontWeight: (game.players[1].active)
                      ? FontWeight.bold
                      : FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              game.players[1].name,
              style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 18,
                  fontWeight: (game.players[1].active)
                      ? FontWeight.bold
                      : FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              'Break: ${game.players[1].currBreak}',
              style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 12,
                  fontWeight: (game.players[1].active)
                      ? FontWeight.bold
                      : FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            Text(
              'HB: ${game.players[1].highestBreak}',
              style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 12,
                  fontWeight: (game.players[1].active)
                      ? FontWeight.bold
                      : FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            if (game.players[1].snookersRequired > 0)
              Text(
                'Snookers: ${game.players[1].snookersRequired}',
                style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 12,
                    fontWeight: (game.players[1].active)
                        ? FontWeight.bold
                        : FontWeight.normal),
                textAlign: TextAlign.center,
              ),
          ]),
        ),
      ]),
    ];
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
          returnScoreLine(
              game.players[0].score,
              game.players[0].scoreFractionOfMax,
              game.players[0].maxScore,
              game.players[0].snookersReqdScoreline,
              game.players[0].snookersReqdFractionOfMax),
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
          returnScoreLine(
              game.players[1].score,
              game.players[1].scoreFractionOfMax,
              game.players[1].maxScore,
              game.players[1].snookersReqdScoreline,
              game.players[1].snookersReqdFractionOfMax),
          if (orientation == Orientation.landscape) SizedBox(width: 30.00)
        ],
      );
    }));
  }
}
