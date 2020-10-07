class Player {
  String name;
  int handicap;
  int score = 0;
  int framesWon = 0;
  int snookersRequired;
  int foulPointsGiven = 0;
  int foulPointsRecieved = 0;
  int pointsUntilSnookers;
  bool active = false;

  int maxScore = 147;
  double scoreFractionOfMax = 0;

  void updateScoreLine(pointsRemaining) {
    maxScore = score + pointsRemaining;
    scoreFractionOfMax = (score / maxScore) * 100;
  }

  Player(this.name, this.handicap) {
    this.score = 0;
    this.framesWon = 0;

    score += handicap;
  }
}
