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
  int minFoul = 4;

  void calculatePointsRemaining() {
    pointsRemaining = (8 * redsRemaining) +
        (2 * yellowsRemaining) +
        (3 * greensRemaining) +
        (4 * brownsRemaining) +
        (5 * bluesRemaining) +
        (6 * pinksRemaining) +
        (7 * blacksRemaining);
    if (currFrame.length > 0) {
      if (currFrame[currFrame.length - 1] == "R") {
        pointsRemaining += 7;
      }
    }
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

    p.updateScoreLine(pointsRemaining, a.score, minFoul);
    a.updateScoreLine(pointsRemaining, p.score, minFoul);
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
      players[i].currBreak = 0;
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
    currFrame.add("END");
    frames.add(currFrame);
    currFrame = [];

    if (players[0].score > players[1].score) {
      players[0].framesWon++;
    } else {
      players[1].framesWon++;
    }

    for (int i = 0; i < players.length; i++) {
      players[i].score = players[i].handicap;
      players[i].currBreak = 0;
      players[i].snookersRequired = 0;
      players[i].maxScore = 147;
      players[i].snookersReqdScoreline = 74;
      players[i].updateScoreLine(147, 0, 4);
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

  void pot(colour, fb) {
    Player ap = getActivePlayer();
    switch (colour) {
      case "R":
        ap.score++;
        ap.currBreak++;
        if (!fb) {
          redsRemaining--;
        }
        break;
      case "Y":
        ap.score += 2;
        ap.currBreak += 2;
        if (redsRemaining == 0 &&
            !fb &&
            (currFrame[currFrame.length - 1] != "R" &&
                currFrame[currFrame.length - 1] != "R*")) {
          yellowsRemaining--;
        }
        break;
      case "G":
        ap.score += 3;
        ap.currBreak += 3;
        if (redsRemaining == 0 &&
            !fb &&
            (currFrame[currFrame.length - 1] != "R" &&
                currFrame[currFrame.length - 1] != "R*")) {
          greensRemaining--;
        }
        break;
      case "br":
        ap.score += 4;
        ap.currBreak += 4;
        if (redsRemaining == 0 &&
            !fb &&
            (currFrame[currFrame.length - 1] != "R" &&
                currFrame[currFrame.length - 1] != "R*")) {
          brownsRemaining--;
        }
        break;
      case "bl":
        ap.score += 5;
        ap.currBreak += 5;
        if (redsRemaining == 0 &&
            !fb &&
            (currFrame[currFrame.length - 1] != "R" &&
                currFrame[currFrame.length - 1] != "R*")) {
          bluesRemaining--;
        }
        break;
      case "P":
        ap.score += 6;
        ap.currBreak += 6;
        if (redsRemaining == 0 &&
            !fb &&
            (currFrame[currFrame.length - 1] != "R" &&
                currFrame[currFrame.length - 1] != "R*")) {
          pinksRemaining--;
        }
        break;
      case "B":
        ap.score += 7;
        ap.currBreak += 7;
        if (redsRemaining == 0 &&
            !fb &&
            (currFrame[currFrame.length - 1] != "R" &&
                currFrame[currFrame.length - 1] != "R*")) {
          print("LAST ACTION: ");
          print(currFrame[currFrame.length - 1]);
          blacksRemaining--;
        }
        break;
    }
    if (!fb) {
      currFrame.add(colour);
    } else {
      currFrame.add('$colour*');
    }

    calculatePointsRemaining();
    Player ip = getInactivePlayer();

    if (brownsRemaining == 0) {
      minFoul = 5;
    }
    if (bluesRemaining == 0) {
      minFoul = 6;
    }
    if (pinksRemaining == 0) {
      minFoul = 7;
    }

    ap.updateScoreLine(pointsRemaining, ip.score, minFoul);
    ip.updateScoreLine(pointsRemaining, ap.score, minFoul);
    if (ap.currBreak > ap.highestBreak) {
      ap.highestBreak = ap.currBreak;
    }

    if (blacksRemaining == 0) {
      if (players[1].score != players[0].score) {
        endGame();
      } else {
        blacksRemaining++;
      }
    }
  }

  void undo() {
    if (currFrame.length > 0) {
      switch (currFrame[currFrame.length - 1]) {
        // REEVERSE VARIOUS ACTIONS
      }
    }
  }

  Game(playerNames, handicaps) {
    this.players.add(new Player(playerNames[0], handicaps[0]));
    this.players.add(new Player(playerNames[1], handicaps[1]));
    this.redsRemaining = 15;
    players[0].active = true;
  }
}
