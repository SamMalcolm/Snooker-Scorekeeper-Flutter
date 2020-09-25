class Player {
  String name;
  int handicap;
  int score;
  int framesWon;
  int snookersRequired;
  int foulPointsGiven;
  int pointsUntilSnookers;
  bool active;

  Player(this.name, this.handicap) {
    this.score = 0;
    this.framesWon = 0;
  }
}
