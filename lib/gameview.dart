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

  List scoringInput() {
    return [
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        gradient: LinearGradient(
                          begin: Alignment(1.0, -1.92),
                          end: Alignment(-0.94, 1.75),
                          colors: [
                            const Color(0xffC72D2D),
                            const Color(0xff9D2C2C),
                          ],
                          stops: [0.0, 1.0],
                        ),
                      ),
                      child: TextButton(
                          onPressed: () {
                            print('Pressed');
                          },
                          child: Text('+1',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 22,
                                color: const Color(0xffFFFFFF),
                              )))))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          gradient: LinearGradient(
                            begin: Alignment(1.0, -1.92),
                            end: Alignment(-0.94, 1.75),
                            colors: [
                              const Color(0xffC72D2D),
                              const Color(0xff9D2C2C),
                            ],
                            stops: [0.0, 1.0],
                          ),
                        ),
                        child: TextButton(
                            onPressed: () {
                              print('Pressed');
                            },
                            child: Text('+2',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 22,
                                  color: const Color(0xffFFFFFF),
                                ))))),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          gradient: LinearGradient(
                            begin: Alignment(1.0, -1.92),
                            end: Alignment(-0.94, 1.75),
                            colors: [
                              const Color(0xffC72D2D),
                              const Color(0xff9D2C2C),
                            ],
                            stops: [0.0, 1.0],
                          ),
                        ),
                        child: TextButton(
                            onPressed: () {
                              print('Pressed');
                            },
                            child: Text('+3',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 22,
                                  color: const Color(0xffFFFFFF),
                                ))))),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          gradient: LinearGradient(
                            begin: Alignment(1.0, -1.92),
                            end: Alignment(-0.94, 1.75),
                            colors: [
                              const Color(0xffC72D2D),
                              const Color(0xff9D2C2C),
                            ],
                            stops: [0.0, 1.0],
                          ),
                        ),
                        child: TextButton(
                            onPressed: () {
                              print('Pressed');
                            },
                            child: Text('+4',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 22,
                                  color: const Color(0xffFFFFFF),
                                )))))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          gradient: LinearGradient(
                            begin: Alignment(1.0, -1.92),
                            end: Alignment(-0.94, 1.75),
                            colors: [
                              const Color(0xffC72D2D),
                              const Color(0xff9D2C2C),
                            ],
                            stops: [0.0, 1.0],
                          ),
                        ),
                        child: TextButton(
                            onPressed: () {
                              print('Pressed');
                            },
                            child: Text('+5',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 22,
                                  color: const Color(0xffFFFFFF),
                                ))))),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 80.00,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        gradient: LinearGradient(
                          begin: Alignment(1.0, -1.92),
                          end: Alignment(-0.94, 1.75),
                          colors: [
                            const Color(0xffC72D2D),
                            const Color(0xff9D2C2C),
                          ],
                          stops: [0.0, 1.0],
                        ),
                      ),
                      child: TextButton(
                          onPressed: () {
                            print('Pressed');
                          },
                          child: Text('+6',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 22,
                                color: const Color(0xffFFFFFF),
                              )))),
                )),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          gradient: LinearGradient(
                            begin: Alignment(1.0, -1.92),
                            end: Alignment(-0.94, 1.75),
                            colors: [
                              const Color(0xffC72D2D),
                              const Color(0xff9D2C2C),
                            ],
                            stops: [0.0, 1.0],
                          ),
                        ),
                        child: TextButton(
                            onPressed: () {
                              print('Pressed');
                            },
                            child: Text('+7',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 22,
                                  color: const Color(0xffFFFFFF),
                                )))))
              ],
            ),
          )
        ]),
      )
    ];
  }

  List scoreBoard() {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Column(children: [
              Text(
                '3',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 22,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '32',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 42,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Sam',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 18,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.center,
              ),
            ]),
          ),
          Expanded(
            child: Container(
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
          ),
          Expanded(
            child: Column(children: [
              Text(
                '3',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 22,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '147',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 42,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'David',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 18,
                  color: const Color(0xff707070),
                ),
                textAlign: TextAlign.center,
              ),
            ]),
          ),
        ]),
      )
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
      children: <Widget>[
        returnScoreLine(),
        Expanded(
          child: Column(
            children: [
              ...scoreBoard(),
              ...scoringInput(),
            ],
          ),
        ),
        returnScoreLine(),
      ],
    ));
  }
}
