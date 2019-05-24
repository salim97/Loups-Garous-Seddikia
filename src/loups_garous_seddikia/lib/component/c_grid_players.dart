import 'package:flutter/material.dart';
import '../model/model_game.dart';
import '../game.dart';

class CgridPlayers extends StatefulWidget {
  final ModelPlayer skipplayer;
  int _selectedIndex = -1;
  CgridPlayers({this.skipplayer});
  @override
  _CgridPlayersState createState() => _CgridPlayersState();
  
}

class _CgridPlayersState extends State<CgridPlayers> {
  List<ModelPlayer> players = [];
 

 
  _onSelected(int index) {
    setState(() => widget._selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    players = List<ModelPlayer>.from(getIt<GameEngine>().players);
    players.remove(widget.skipplayer);
    return GridView.count(
      padding: const EdgeInsets.all(4.0),
      physics: ScrollPhysics(), // to disable GridView's scrolling
      shrinkWrap: true,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      crossAxisCount: 2,
      children: List.generate(players.length, (index) {
        return GridTile(
            child: GestureDetector(
              onTap: () => _onSelected(index),
              child: Padding(
                padding: EdgeInsets.all(36.0),
                child: Container(
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: widget._selectedIndex != null && widget._selectedIndex == index ? Colors.blue : Colors.white, width: 4)),
                  child: CircleAvatar(
                    backgroundImage: ExactAssetImage('images/assets_images_ic_person_white_160px_with_background.png'),
                  ),
                ),
              ),
            ),
            footer: Center(
              child: Text(players[index].name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  )),
            ));

        //return Center(child: UIrole(rolRoleType.values[i], max: getIt<GameEngine>().players.length));
      }),
    );
  }
}
