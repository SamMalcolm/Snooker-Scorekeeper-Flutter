import 'package:flutter/material.dart';

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

  Color winningScorelineColor = Color(0xFFC3A164);

  void updateScoreLine(pointsRemaining, opponentsScore, minFoul) {
    winningScorelineColor = Color(0xFFC3A164);
    maxScore = score + pointsRemaining;
    scoreFractionOfMax = (score / maxScore);
    if (scoreFractionOfMax < 0) {
      scoreFractionOfMax = 0;
    }
    if (maxScore < opponentsScore) {
      double sr = (opponentsScore - maxScore) / minFoul;
      snookersRequired = sr.ceil();
    } else {
      snookersRequired = 0;
    }

    int scoringPoints = 1;
    snookersReqdFractionOfMax = 0;

    while (scoringPoints <= pointsRemaining && pointsRemaining > 27) {
      int pottentialScore = score;
      int pottentialPointsRemaining = pointsRemaining;
      pottentialScore += scoringPoints;
      pottentialPointsRemaining -= scoringPoints;
      if (opponentsScore + pottentialPointsRemaining < pottentialScore) {
        snookersReqdScoreline = pottentialScore;
        break;
      } else {
        if (pottentialPointsRemaining == 27) {
          scoringPoints += 2;
          winningScorelineColor = const Color(0xffCEB636);
        } else if (pottentialPointsRemaining == 25) {
          scoringPoints += 3;
          winningScorelineColor = const Color(0xff397140);
        } else if (pottentialPointsRemaining == 22) {
          scoringPoints += 4;
          winningScorelineColor = const Color(0xff694A20);
        } else if (pottentialPointsRemaining == 18) {
          scoringPoints += 5;
          winningScorelineColor = const Color(0xff2F4EB4);
        } else if (pottentialPointsRemaining == 13) {
          scoringPoints += 6;
          winningScorelineColor = const Color(0xff9B3D9B);
        } else if (pottentialPointsRemaining == 7) {
          scoringPoints += 7;
          winningScorelineColor = const Color(0xff0B0B0B);
        } else {
          scoringPoints++;
        }
      }
    }

    while (scoringPoints <= pointsRemaining && pointsRemaining <= 27) {
      int pottentialScore = score;
      int pottentialPointsRemaining = pointsRemaining;

      if (pottentialPointsRemaining == 27) {
        scoringPoints += 2;
        winningScorelineColor = const Color(0xffCEB636);
      } else if (pottentialPointsRemaining == 25) {
        scoringPoints += 3;
        winningScorelineColor = const Color(0xff397140);
      } else if (pottentialPointsRemaining == 22) {
        scoringPoints += 4;
        winningScorelineColor = const Color(0xff694A20);
      } else if (pottentialPointsRemaining == 18) {
        scoringPoints += 5;
        winningScorelineColor = const Color(0xff2F4EB4);
      } else if (pottentialPointsRemaining == 13) {
        scoringPoints += 6;
        winningScorelineColor = const Color(0xff9B3D9B);
      } else if (pottentialPointsRemaining == 7) {
        scoringPoints += 7;
        winningScorelineColor = const Color(0xff0B0B0B);
      }

      pottentialScore += scoringPoints;
      pottentialPointsRemaining -= scoringPoints;
      if (opponentsScore + pottentialPointsRemaining < pottentialScore) {
        snookersReqdScoreline = pottentialScore;
        break;
      }
    }

    snookersReqdFractionOfMax = snookersReqdScoreline / maxScore;

    // double srsl = (maxScore / 2) + opponentsScore;
    // snookersReqdScoreline = srsl.ceil();
    if (snookersReqdScoreline > maxScore) {
      snookersReqdFractionOfMax = 0;
    }
    if (opponentsScore + pointsRemaining < score) {
      snookersReqdFractionOfMax = 0;
    }
  }

  Player(this.name, this.handicap) {
    this.score = 0;
    this.framesWon = 0;
    score += handicap;
  }
}
