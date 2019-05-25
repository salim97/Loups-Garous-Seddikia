import 'package:flutter/material.dart';

import './pages/ui_players.dart';
import './pages/ui_game.dart';
import 'game.dart';
import './model/model_game.dart';
import './component/c_grid_players.dart';

void main() {
  GameEngine gameEngine = new GameEngine();

  modelRoleMap[RoleType.werewolf] = new ModelRole(
      roleType: RoleType.werewolf,
      image: "images/alpha_werewolf.png",
      description: "ydiro vote binathom w yakatlo wahed",
      msg: "Select a player to kill? The other werewolves will see your vote. if the vote is tied, a random victim will be selected.");
  modelRoleMap[RoleType.hunter] = new ModelRole(
      roleType: RoleType.hunter,
      image: "images/assets_images_roles_png_icon_hunter.png",
      description: "kiymout yaktol m3ah wahed",
      msg: "In case you die this round, select a player you would like to kill");
  modelRoleMap[RoleType.witch] = new ModelRole(
      roleType: RoleType.witch,
      image: "images/assets_images_roles_png_icon_witch.png",
      description: "taktol khatra, thayi felil khatra",
      msg: "Use the poison to kill a player, or the elixir to save the victim of the werewolves this night. you have each potion only once");
  modelRoleMap[RoleType.seer] = new ModelRole(
      roleType: RoleType.seer,
      image: "images/assets_images_roles_png_icon_seer.png",
      description: "flil tchouf role ta3 wahed",
      msg: "Select a player to view their role");

  gameEngine.players.add(new ModelPlayer(name: "Salim", role: modelRoleMap[RoleType.werewolf]));
  gameEngine.players.add(new ModelPlayer(name: "Redoune", role: modelRoleMap[RoleType.seer]));
  gameEngine.players.add(new ModelPlayer(name: "Hakim", role: modelRoleMap[RoleType.hunter]));
  gameEngine.players.add(new ModelPlayer(name: "Jalil", role: modelRoleMap[RoleType.witch]));
  gameEngine.players.add(new ModelPlayer(name: "Nadir", role: modelRoleMap[RoleType.werewolf]));
  gameEngine.players.add(new ModelPlayer(name: "Bebe fuck", role: modelRoleMap[RoleType.werewolf]));
  getIt.registerSingleton<GameEngine>(gameEngine);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: UIgame(), // UIplayers(title: 'Loups Garous Seddikia'),
      debugShowCheckedModeBanner: false,
    );
  }
}
