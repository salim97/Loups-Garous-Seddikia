import 'package:flutter/material.dart';
import 'package:loups_garous_seddikia/component/c_grid_players.dart';
import '../game.dart';

class Cnight extends StatefulWidget {
  final VoidCallback readyClicked;
  Cnight({this.readyClicked});
  @override
  _CnightState createState() => _CnightState();
}

class _CnightState extends State<Cnight> {
  int counter = 1;
  
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            //colors: [const Color(0xFF915FB5),const Color(0xFFCA436B)],
            colors: [const Color(0xFF3241A0), const Color(0xF0717DC5)],
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
              "images/assets_images_moon.png",
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
                      counter.toString() + ". Night",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Night has come, all players close their eyes and go to sleep.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "The game master receives the device, views his role, and gives the device to the next player once finished.",
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
              onPressed: () => widget.readyClicked(),
            ),
          ),
          Image.asset(
            "images/assets_images_mountains_night.png",
          ),
        ],
      ),
    );
  }
}
