import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/model_game.dart';
import '../game.dart';

class CgameResult extends StatefulWidget {
  @override
  _CgameResultState createState() => _CgameResultState();
}

class _CgameResultState extends State<CgameResult> {


  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: new BoxDecoration(color: Colors.pinkAccent),
        child:  Column(
          children: <Widget>[
            Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                  child: Image.asset(
                                    Provider.of<GameEngine>(context).wolfWon() ? "images/alpha_werewolf.png" : "images/assets_images_roles_png_icon_villager.png",
                                    height: 100,
                                    width: 100,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
         
            Center(
              child: Text(
                        Provider.of<GameEngine>(context).wolfWon() ? "Wolf won the game" : "Villager won the game",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
            ),
          ],
        ));
  }

}
