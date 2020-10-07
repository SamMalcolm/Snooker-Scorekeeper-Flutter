import 'player.class.dart';

class Game {
  List players = [];
  List frames = [];
  List currFrame = [];
  int framesPlayed = 0;
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

  void calculatePointsRemaining() {
    pointsRemaining = (8 * redsRemaining) +
        (2 * yellowsRemaining) +
        (3 * greensRemaining) +
        (4 * brownsRemaining) +
        (5 * bluesRemaining) +
        (6 * pinksRemaining) +
        (7 * blacksRemaining);
  }

  void incrementReds() {
    redsRemaining++;
    calculatePointsRemaining();
  }

  void decrementReds() {
    if (redsRemaining > 0) {
      redsRemaining--;
      calculatePointsRemaining();
    }
  }

  void foul(value) {
    currFrame.add('F$value');

    Player p = getInactivePlayer();
    p.score += value;
    p.foulPointsRecieved += value;

    Player a = getActivePlayer();
    a.foulPointsGiven += value;
  }

  Player getActivePlayer() {
    List pl = players.where((p) => p.active).toList();
    Player p = pl[0];
    return p;
  }

  Player getInactivePlayer() {
    List pl = players.where((p) => !p.active).toList();
    Player p = pl[0];
    return p;
  }

  void passTurn() {
    for (int i = 0; i < players.length; i++) {
      if (players[i].active) {
        players[i].active = false;
      } else {
        players[i].active = true;
      }
    }
    currFrame.add('PT');
  }

  void endGame() {
    framesPlayed++;
    frames.add(currFrame);
    currFrame = [];

    if (players[0].score > players[1].score) {
      players[0].framesWon++;
    } else {
      players[1].framesWon++;
    }

    for (int i = 0; i < players.length; i++) {
      players[i].score = players[i].handicap;
    }

    redsRemaining = 15;
    yellowsRemaining = 1;
    greensRemaining = 1;
    brownsRemaining = 1;
    bluesRemaining = 1;
    pinksRemaining = 1;
    blacksRemaining = 1;
    calculatePointsRemaining();
  }

  void pot(colour) {
    switch (colour) {
      case "R":
        getActivePlayer().score++;
        redsRemaining--;
        currFrame.add("R");
        break;
      case "Y":
        getActivePlayer().score += 2;
        currFrame.add("Y");
        break;
      case "G":
        getActivePlayer().score += 3;
        currFrame.add("Y");
        break;
      case "br":
        getActivePlayer().score += 4;
        currFrame.add("Y");
        break;
      case "bl":
        getActivePlayer().score += 5;
        currFrame.add("Y");
        break;
      case "P":
        getActivePlayer().score += 6;
        currFrame.add("Y");
        break;
      case "B":
        getActivePlayer().score += 7;
        currFrame.add("Y");
        break;
    }
    calculatePointsRemaining();
    getActivePlayer().updateScoreLine(pointsRemaining);
  }

  Game(playerNames, handicaps) {
    this.players.add(new Player(playerNames[0], handicaps[0]));
    this.players.add(new Player(playerNames[1], handicaps[1]));
    this.redsRemaining = 15;
    players[0].active = true;
  }
}
