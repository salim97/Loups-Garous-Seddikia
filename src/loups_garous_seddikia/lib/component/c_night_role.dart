import 'package:flutter/material.dart';
import '../model/model_game.dart';

class CnightRole extends StatefulWidget {
  final VoidCallback readyClicked;
  final ModelPlayer player;
  CnightRole({this.readyClicked, this.player});
  @override
  _CnightRoleState createState() => _CnightRoleState();
}

class _CnightRoleState extends State<CnightRole> {
  int counter = 1;
  int index = 0 ;
  @override
  Widget build(BuildContext context) {
    if(index == 0)
      return Page01(player: widget.player, index: index,);
    

  }
  
}


class Page01 extends StatelessWidget {
   final ModelPlayer player;
    int index ;
  Page01({this.player, this.index});
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
          GestureDetector(
            child: CircleAvatar(
              backgroundImage: AssetImage(
                "images/assets_images_ic_person_white_160px_with_background.png",
              ),
            ),
           
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      player.name,
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
              onPressed: () => this.index = 2 ,
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

class Page02 extends StatelessWidget {
  final ModelPlayer player;
    int index ;
  Page02({this.player, this.index});
  @override
  Widget build(BuildContext context) {
      return new Container(
      decoration: new BoxDecoration(
        color: Colors.pinkAccent
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(10.0),
                        child: Image.asset(
                player.role.image,
              ),
            ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      player.role.roleType.toString().replaceAll("RoleType.", ""),
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
              onPressed: () => this.index = 2 ,
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