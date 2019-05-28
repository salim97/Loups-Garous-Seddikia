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
  List<ModelPlayer> deads = [];

  update() {
    werewolf();
    deads = deads.toSet().toList();
    actionList.forEach((action) {
      if (action.currentPlayer.role.roleType == RoleType.witch) {
        if (action.action == ActionType.heal) deads.removeLast();

        if (action.action == ActionType.kill) deads.add(action.targetPlayer);
      }
    });

    ModelPlayer tmp = null;
    deads.forEach((dead) {
      if (dead.role.roleType == RoleType.hunter) {
        actionList.forEach((action) {
          if (action.currentPlayer == dead) {
            tmp = action.targetPlayer;
          }
        });
      }
    });
    if(tmp != null)
    deads.add(tmp);
  }

  @override
  Widget build(BuildContext context) {
    actionList = Provider.of<GameEngine>(context).actionList;
    update();
    deads = deads.toSet().toList();

    return Container(
        decoration: new BoxDecoration(color: Colors.pinkAccent),
        child: Column(
          children: <Widget>[
              Padding(
              padding: const EdgeInsets.all(18.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Last night's victims: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: this.deads.length,
              itemBuilder: (context, index) {
                return row(deads[index]);
                /*
            return ListTile(
              title: Text(actionList[index].currentPlayer.name + " => " + actionList[index].action.toString() + " => " + actionList[index].targetPlayer.name),
            );
            */
              },
            ),
            Center(
              child: RaisedButton(
                child: const Text(
                  'DONE',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                onPressed: () 
                {
                  deads.forEach( (dead) => Provider.of<GameEngine>(context).players.remove(dead) ) ;
                  deads.forEach( (dead) => Provider.of<GameEngine>(context).deads.add(dead) ) ;
                  Provider.of<GameEngine>(context).players.forEach( (p) =>  print(p.name));
                  Provider.of<GameEngine>(context).actionList.clear();
                  Provider.of<GameEngine>(context).gamestate = GameState.morning_splash;
                }
              ),
            ),
          
          ],
        ));
  }

  row(ModelPlayer player) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                    child: Container(
                  decoration: new BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 4)),
                  child: SizedBox(
                      height: 150.0,
                      width: 150.0,
                      child: CircleAvatar(backgroundImage: ExactAssetImage('images/assets_images_ic_person_white_160px_with_background.png'))),
                ))),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                    child: Container(
                        decoration: new BoxDecoration(color: Colors.purple, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 4)),
                        child: SizedBox(
                          height: 150.0,
                          width: 150.0,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Image.asset(
                                player.role.image,
                                height: 100,
                                width: 100,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )))),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            player.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            player.role.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  void werewolf() {
    actionList.forEach((action) {
      action.targetPlayer.vote = 0;
    });


  
    actionList.forEach((action) {
      if (action.currentPlayer.role.roleType == RoleType.werewolf) {
        action.targetPlayer.vote++;
      }
    });
    

    int max = 0;
    int numberOfmaxFound = 0;

    actionList.forEach((action) {
      
      if (action.targetPlayer.vote > max) {
        max = action.targetPlayer.vote;
      }
    });

    actionList.forEach((action) {
      if ( action.currentPlayer.role.roleType == RoleType.werewolf && action.targetPlayer.vote == max) {
        numberOfmaxFound++;
      }
    });

    if (numberOfmaxFound == 1) {
      actionList.forEach((action) {
        if (action.targetPlayer.vote == max) {
          deads.add(action.targetPlayer);
        }
      });
    }

    actionList.forEach((action) {
      action.targetPlayer.vote = 0;
    });
  }
}
