import 'package:flutter/material.dart';
import '../model/model_game.dart';
import '../game.dart';
import 'c_grid_players.dart';

class CdayVote extends StatefulWidget {
  List<ModelPlayer> players = [];
  final VoidCallback callBackDone;
  CdayVote({this.callBackDone}){
      players = getIt<GameEngine>().players;
  }

  @override
  _CdayVoteState createState() => _CdayVoteState();
}

class _CdayVoteState extends State<CdayVote> {
  int _index = 0;

  int _currentIndex = -1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
  }
  
  _reset()
  {
    widget.players.forEach( (player) => player.vote = 0 );
     setState(() {
_index = 0;
        _currentIndex = -1;
     });
  }

  incrementIndex() {
    if (_index + 1 < widget.players.length)
      setState(() {
        _index++;
        _currentIndex = -1;
      });
    else {
      widget.callBackDone();
    }
  }

  @override
  Widget build(BuildContext context) {
      if(_index >= widget.players.length)
      {
        print("/*------------------------------------------*/");
        _reset();
      }
    return new Container(
        decoration: new BoxDecoration(color: Colors.pinkAccent),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                    child: SizedBox(
                        height: 150.0,
                        width: 150.0,
                        child: CircleAvatar(backgroundImage: ExactAssetImage('images/assets_images_ic_person_white_160px_with_background.png'))))),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.players[_index].name + " votes",
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
            CgridPlayers(skipplayer: widget.players[_index], callBackDone: () => incrementIndex()),
          ],
        ));
  }
}
