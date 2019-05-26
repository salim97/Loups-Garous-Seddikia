import 'package:flutter/material.dart';
import 'package:loups_garous_seddikia/pages/ui_config.dart';
import 'package:loups_garous_seddikia/pages/ui_players.dart';
import 'package:provider/provider.dart';

import './pages/ui_game.dart';
import 'game.dart';

void main() {
  GameEngine gameEngine = new GameEngine();

  getIt.registerSingleton<GameEngine>(gameEngine);

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
