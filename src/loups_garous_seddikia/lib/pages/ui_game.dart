import 'package:flutter/material.dart';
import 'package:loups_garous_seddikia/model/model_game.dart';
import 'package:provider/provider.dart';
import '../game.dart';

class UIgame extends StatefulWidget {
  @override
  _UIgameState createState() => _UIgameState();
}

class _UIgameState extends State<UIgame> {
  int indexedStack = 0;
  void readyclickedNight() {
    print("readyclickedNight") ;
    setState(() {
      indexedStack = 1;
    });
  }

  void readyclickedDay() {
    setState(() {
      indexedStack = 2;
    });
  }

  void callBackVoteDone() {
    setState(() {
      indexedStack = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GameEngine gameEngine = Provider.of<GameEngine>(context);
    Provider.of<GameEngine>(context).players.forEach( (player) {
      print(player.name + " "+ player.role.name);
    });

    return new Scaffold(
        
          appBar: new AppBar(
            title: new Text('Loups Garous Seddikia'),
             ),
          body: gameEngine.currentWidget
    );
    /*
    return WillPopScope(
      onWillPop: _onBackPressed,
          child: new Scaffold(
        
          appBar: new AppBar(
            title: new Text('Loups Garous Seddikia'),
              leading: new Container(),),
          body: gameEngine.currentWidget
          /*
          IndexedStack(index: indexedStack, children: <Widget>[
              
              Cnight(readyClicked: readyclickedNight),
              Cday(readyClicked: readyclickedDay),
              CdayVote(callBackDone: callBackVoteDone,),
              CdayResulte(callBackDone: readyclickedDay,) ,
            ]),*/
          ),
    );*/
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Do you want to stop this game ?"),
        actions: <Widget>[
          FlatButton(
            child: Text("No"),
            onPressed: () => Navigator.pop(context, false),
          ),
          FlatButton(
            child: Text("Yes"),
            onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
          ),
        ],
      )
    );
  }
}
