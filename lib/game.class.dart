import 'player.class.dart';

class Game {
  List players = [];
  int framesPlayed = 1;
  int pointsRemaining = 147;

// BALLS
  int redsRemaining = 15;
  int yellowsRemaining = 1;
  int greensRemaining = 1;
  int brownsRemaining = 1;
  int bluesRemaining = 1;
  int pinksRemaining = 1;
  int blacksRemaining = 1;
  bool freeBall = false;

  void incrementReds() {
    redsRemaining++;
  }

  void decrementReds() {
    if (redsRemaining > 0) {
      redsRemaining--;
    }
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
