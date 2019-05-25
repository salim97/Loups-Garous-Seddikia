import 'package:flutter/material.dart';
import '../model/model_game.dart';
import '../game.dart';
import 'c_grid_players.dart';

class CdayResulte extends StatefulWidget {
  final VoidCallback callBackDone;

  ModelPlayer dead = null;
  CdayResulte({this.callBackDone});

  @override
  _CdayResulteState createState() => _CdayResulteState();
}

class _CdayResulteState extends State<CdayResulte> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  update() {
    List<ModelPlayer> players = [];
    players = getIt<GameEngine>().players;
    int max = 0;
    int numberOfmaxFound = 0;
    players.forEach((player) {
      if (player.vote > max) {
        max = player.vote;
      }
    });
    players.forEach((player) {
      if (player.vote == max) {
        numberOfmaxFound++;
      }
    });
    if (numberOfmaxFound == 1) {
      players.forEach((player) {
        if (player.vote == max) {
          widget.dead = player;
        }
      });
      players.remove(widget.dead);
    }
  }

  _done() {
    widget.callBackDone();
  }

  @override
  Widget build(BuildContext context) {
    update();

    if (widget.dead == null)
      return Container(
        child: Center(
          child: Text("rouh nik mok"),
        ),
      );
    return Container(
        decoration: new BoxDecoration(color: Colors.pinkAccent),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "The village has killed: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
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
                                    widget.dead.role.image,
                                    height: 100,
                                    width: 100,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )))),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.dead.name + " is a",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.dead.role.roleType.toString().replaceAll("RoleType.", ""),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "The victim is not allowed to talk until the end of the game.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
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
                onPressed: () => _done(),
              ),
            ),
          ],
        ));
  }
}
