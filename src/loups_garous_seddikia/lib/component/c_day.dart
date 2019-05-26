import 'package:flutter/material.dart';
import 'package:loups_garous_seddikia/model/model_game.dart';
import 'package:provider/provider.dart';

import '../game.dart';

class Cday extends StatefulWidget {
  @override
  _CdayState createState() => _CdayState();
}

class _CdayState extends State<Cday> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            //colors: [const Color(0xFF915FB5),const Color(0xFFCA436B)],
            colors: [const Color(0xFF717DC5), const Color(0x003241A0)],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Image.asset(
              "images/assets_images_sun.png",
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      counter.toString() + ". Day",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Morning has come, the village awakes. \nHand the device to the game master.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: RaisedButton(
              child: const Text(
                'READY',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.pinkAccent,
              onPressed: () => Provider.of<GameEngine>(context).gamestate = GameState.morning_vote,
            ),
          ),
          Image.asset(
            "images/assets_images_mountains_day.png",
          ),
        ],
      ),
    );
  }
}
