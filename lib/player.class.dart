class Player {
  // NAME
  String name;

  // SCORING METRICS
  int handicap = 0;
  int score = 0;
  int framesWon = 0;
  int snookersRequired = 0;

  // FOUL
  int foulPointsGiven = 0;
  int foulPointsRecieved = 0;

  // AT TABLE
  bool active = false;

  // BREAK
  int currBreak = 0;
  int highestBreak = 0;

  // SCORELINE DATA
  int maxScore = 147;
  double scoreFractionOfMax = 0;
  int snookersReqdScoreline = 74;
  double snookersReqdFractionOfMax = 74 / 147;

  void updateScoreLine(pointsRemaining, opponentsScore, minFoul) {
    maxScore = score + pointsRemaining;
    scoreFractionOfMax = (score / maxScore);

    if (maxScore < opponentsScore) {
      double sr = (opponentsScore - maxScore) / minFoul;
      snookersRequired = sr.round();
    } else {
      snookersRequired = 0;
    }

    double srsl = ((pointsRemaining + score) / 2) + opponentsScore + 1;
    snookersReqdScoreline = srsl.ceil();
    snookersReqdFractionOfMax = srsl / maxScore;
  }

  Player(this.name, this.handicap) {
    this.score = 0;
    this.framesWon = 0;
    score += handicap;
  }
}
