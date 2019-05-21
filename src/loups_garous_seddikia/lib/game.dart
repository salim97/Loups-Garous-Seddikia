import 'dart:io';

import './model/model_game.dart';

class Game_engine {
  final List<ModelPlayer> players;
  int playerIndex = -1;

  int nightCount = 0;
  int dayCount = 0;
  bool isItNight = false;

  List<ModelHistoric> historic;

  Game_engine({this.players});

  void next() {
    if (playerIndex == -1) switchDayNight();

    playerIndex++;

    if (playerIndex == players.length) {
      processHistoric();
      playerIndex = -1;
      return;
    }

    if (isItNight) {
      ModelPlayer currentplayer = players[playerIndex];
      if (currentplayer.role.roleType == RoleType.werewolf) {
        print(currentplayer.name +
            " your role is " +
            RoleType.werewolf.toString());
        ModelPlayer target = selectSomeone(currentplayer);
        print("you have been select " + target.name);
        historic.add(ModelHistoric(
            currentPlayer: currentplayer,
            targetPlayer: target,
            action: ActionType.kill));
      }

      if (currentplayer.role.roleType == RoleType.hunter) {
        print(currentplayer.name +
            " your role is " +
            RoleType.werewolf.toString());
        ModelPlayer target = selectSomeone(currentplayer);
        print("you have been select " + target.name);
        historic.add(ModelHistoric(
            currentPlayer: currentplayer,
            targetPlayer: target,
            action: ActionType.bind));
      }

      if (currentplayer.role.roleType == RoleType.seer) {
        print(currentplayer.name +
            " your role is " +
            RoleType.werewolf.toString());
        ModelPlayer target = selectSomeone(currentplayer);
        print("you have been select " + target.name);
        historic.add(ModelHistoric(
            currentPlayer: currentplayer,
            targetPlayer: target,
            action: ActionType.see));
      }

      if (currentplayer.role.roleType == RoleType.witch) {
        print(currentplayer.name +
            " your role is " +
            RoleType.werewolf.toString());
        ModelPlayer target = selectSomeone(currentplayer);
        print("you have been select " + target.name);
        historic.add(ModelHistoric(
            currentPlayer: currentplayer,
            targetPlayer: target,
            action: ActionType.heal));
      }
    } else {}
  }

  void switchDayNight() {
    if (nightCount == dayCount) {
      nightCount++;
      isItNight = true;
    } else {
      dayCount++;
      isItNight = false;
    }
  }

  ModelPlayer selectSomeone(ModelPlayer skip) {
    int i = 0;
    players.forEach((player) {
      if (player == skip) return;
      print(i.toString() + ") " + player.name);
      i++;
    });
    int n = 2;
    print("n = " + n.toString());
    return players[n];
  }

  void processHistoric() {
    historic.forEach((historic) {

      
    });
  }
}
