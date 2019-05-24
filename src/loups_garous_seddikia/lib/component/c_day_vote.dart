import 'package:flutter/material.dart';
import '../model/model_game.dart';
import '../game.dart';

class CdayVote extends StatelessWidget {
  List<ModelPlayer> players = [];
  int _index = 0;
  int _tmp = -1 ;
  CdayVote() {
    players = getIt<GameEngine>().players;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: new BoxDecoration(color: Colors.pinkAccent),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(child: SizedBox(height: 150.0, width: 150.0, child: CircleAvatar(child: Icon(Icons.tag_faces, size: 150.0))))),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      players[_index].name + " votes",
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
                    "The game master now asks each player in turn who he wants to vote for. Each player should explain their vote.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              padding: const EdgeInsets.all(4.0),
              physics: ScrollPhysics(), // to disable GridView's scrolling
              shrinkWrap: true,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              crossAxisCount: 2,
              children: List.generate(players.length-1, (index) {
                _tmp++;
                if(_tmp == _index)
                _tmp++;
                return Center(
                    child: Column(children: <Widget>[
                  SizedBox(
                      height: 80.0,
                      width: 80.0,
                      child: CircleAvatar(
                          child: Icon(
                        Icons.tag_faces,
                        size: 80.0,
                      ))),
                      SizedBox(height: 10.0,),
                      Text(players[_tmp].name, style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),)
                ]));
                //return Center(child: UIrole(rolRoleType.values[i], max: getIt<GameEngine>().players.length));
              }),
            ),
            Center(
              child: RaisedButton(
                child: const Text(
                  'VOTE',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                onPressed: () => null,
              ),
            ),
          ],
        ));
  }
}
