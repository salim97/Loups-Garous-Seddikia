import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/model_game.dart';
import '../game.dart';

class CnightResult extends StatefulWidget {

  @override
  _CnightResultState createState() => _CnightResultState();
}

class _CnightResultState extends State<CnightResult> {
  List<ModelHistoric> actionList;
  

  @override
  Widget build(BuildContext context) {
    actionList = Provider.of<GameEngine>(context).actionList;
       print("/*------------------------------------------*/");
    print(actionList.length);

 
    return Container(
       
        child: ListView.builder(
          itemCount: this.actionList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(actionList[index].currentPlayer.name + " => "+
                          actionList[index].action.toString() + " => "+ actionList[index].targetPlayer.name),
            );
          },
        ));
  }
}
