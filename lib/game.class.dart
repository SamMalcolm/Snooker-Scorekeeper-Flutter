import 'player.class.dart';

class Game {
  List players = [];
  int framesPlayed;
  int redsRemaining = 15;
  int pointsRemaining;
  bool freeBall;

  int get reds_remaining {
    return redsRemaining;
  }

  void calculateRemaining() {
    if (this.redsRemaining > 0) {
      this.pointsRemaining = 8 * this.redsRemaining + 27;
    } else {}
  }

  Game(playerNames, handicaps) {
    this.players.add(new Player(playerNames[0], handicaps[0]));
    this.players.add(new Player(playerNames[1], handicaps[1]));
    this.redsRemaining = 15;
  }
}
