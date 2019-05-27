import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../game.dart';
import '../model/model_game.dart';
import 'c_grid_players.dart';
import 'c_grid_players_night.dart';

class CnightRole extends StatefulWidget {
  final VoidCallback readyClicked;
  final ModelPlayer player;
  CnightRole({this.readyClicked, this.player});
  @override
  _CnightRoleState createState() => _CnightRoleState();
}

class _CnightRoleState extends State<CnightRole> {
  int _index = 0 ;
  //int _currentIndex = -1;
  int pageIndex = 0 ;
  List<ModelPlayer> players = [];

 incrementIndex(BuildContext context) {
    if (_index + 1 < players.length)
      //Provider.of<GameEngine>(context).players.elementAt(_index).
      setState(() {
        _index++;
        pageIndex=0;
        //_currentIndex = -1;
      });
    else {
      Provider.of<GameEngine>(context).gamestate = GameState.night_result;
    }
  }
  _reset() {
    Provider.of<GameEngine>(context).actionList.clear();
    setState(() {
      _index = 0;
      pageIndex = 0;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if (_index >= players.length) {
      print("/*------------------------------------------*/");
      _reset();
    }
    players = List.from(Provider.of<GameEngine>(context).players);
 
    if(pageIndex == 0)
      return page01();

    if(pageIndex == 1)
      return page02();

  }

    page02() {
    return new Container(
        decoration: new BoxDecoration(color: Colors.pinkAccent),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
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
                                    players[_index].role.image,
                                    height: 100,
                                    width: 100,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )))),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      players[_index].role.name ,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    players[_index].role.msg,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            CgridPlayersNight(skipplayer: players[_index], callBackDone: () => incrementIndex(context),),
          ],
        ));
  
  }
    page01() {
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
                    child: Center(
                        child: Container(
                      decoration: new BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 4)),
                      child: SizedBox(
                          height: 150.0,
                          width: 150.0,
                          child: CircleAvatar(backgroundImage: ExactAssetImage('images/assets_images_ic_person_white_160px_with_background.png'))),
                    ))),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      players[this._index].name,
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
                    "Hand the device to this player. Select the profile above once you are ready",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: RaisedButton(
              child: const Text(
                'SHOW ROLE',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.pinkAccent,
              onPressed: () => setState(() { pageIndex = 1 ; }) ,
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

