import 'package:flutter/material.dart';
import 'package:loups_garous_seddikia/pages/ui_config.dart';
import 'package:loups_garous_seddikia/pages/ui_players.dart';
import 'package:provider/provider.dart';

import './pages/ui_game.dart';
import 'game.dart';
import 'model/model_game.dart';

void main() {
  //GameEngine gameEngine = new GameEngine();

  //getIt.registerSingleton<GameEngine>(gameEngine);
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
        
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameEngine>.value(
      notifier: GameEngine(),
          child: MaterialApp(
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
        home: UIplayers(title: 'Loups Garous Seddikia'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
