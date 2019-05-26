import 'dart:math';

import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import './model/model_game.dart';
import 'component/c_day.dart';
import 'component/c_day_resulte.dart';
import 'component/c_day_vote.dart';

GetIt getIt = new GetIt();

class GameEngine extends ChangeNotifier {
  List<ModelPlayer> players = [];
  List<ModelRole> roles = [];
  List<ModelHistoric> actionList = [];
  List<ModelHistoric> historic = [];

  Widget _currentWidget;
  Widget get currentWidget => _currentWidget;
  set currentWidget(Widget val) {
    _currentWidget = val;
    notifyListeners();
  }

  GameState _gamestate;
  GameState get gamestate => _gamestate;
  set gamestate(GameState val) {
    _gamestate = val;
    updateCurrentWidget();
    notifyListeners();
  }

  int _playerIndex = -1;
  int get playerIndex => _playerIndex;
  set playerIndex(int val) {
    _playerIndex = val;
    notifyListeners();
  }

  // global config
  bool hide_number_of_votes = true;
  bool players_can_skip_voting = true;
  bool no_killing_during_the_first_night = true;
  bool reveal_role_when_player_dies = true;

  GameEngine() {
    gamestate = GameState.morning_splash;

    initRandomData();
  }

  void updateCurrentWidget() {
    if (gamestate == GameState.morning_splash) currentWidget =  Cday();
    if (gamestate == GameState.morning_vote) currentWidget = CdayVote();
    if (gamestate == GameState.morning_result) currentWidget = CdayResulte();
  }

  void initRandomData() {
    players.add(new ModelPlayer(name: "Salim", role: null));
    players.add(new ModelPlayer(name: "Redoune", role: null));
    players.add(new ModelPlayer(name: "Hakim", role: null));
    //players.add(new ModelPlayer(name: "Jalil", role: modelRoleMap[RoleType.witch]));
    //players.add(new ModelPlayer(name: "Nadir", role: modelRoleMap[RoleType.werewolf]));
    //players.add(new ModelPlayer(name: "Bebe fuck", role: modelRoleMap[RoleType.werewolf]));
  }


  void initGame() {
    print(players.length);
    print(roles.length);
    Random rand = new Random();
    int randValue, max;
    players.forEach((player) {
      max = roles.length - 1;
      if (max == 0)
        randValue = 0;
      else
        randValue = rand.nextInt(max);

      player.role = roles[randValue];
      roles.removeAt(randValue);
    });
    print(players.length);
    print(roles.length);
    
  }
/*
  void next() {
    if (_playerIndex == -1) switchDayNight();

    _playerIndex++;

    if (_playerIndex == players.length) {
      processHistoric();
      _playerIndex = -1;
      return;
    }

    if (isItNight) {
      ModelPlayer currentplayer = players[_playerIndex];
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
    historic.forEach((historic) {});
  }
*/

}
