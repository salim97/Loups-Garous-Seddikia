import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/model_game.dart';
import '../game.dart';

class CnightResult extends StatefulWidget {
  @override
  _CnightResultState createState() => _CnightResultState();
}

class _CnightResultState extends State<CnightResult> {


  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: new BoxDecoration(color: Colors.pinkAccent),
        child:  Center(
          child: Text(
                    Provider.of<GameEngine>(context).gameIsDone() ? "Wolf won the game" : "villager",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
        ));
  }

}
