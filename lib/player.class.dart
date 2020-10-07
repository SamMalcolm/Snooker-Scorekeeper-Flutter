class Player {
  String name;
  int handicap;
  int score;
  int framesWon = 0;
  int snookersRequired;
  int foulPointsGiven = 0;
  int foulPointsRecieved = 0;
  int pointsUntilSnookers;
  bool active = false;

  Player(this.name, this.handicap) {
    this.score = 0;
    this.framesWon = 0;

    score += handicap;
  }
}
