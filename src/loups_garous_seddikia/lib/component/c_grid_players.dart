import 'package:flutter/material.dart';
import '../model/model_game.dart';
import '../game.dart';

class CgridPlayers extends StatefulWidget {
  final ModelPlayer skipplayer;
  int selectedIndex = -1;
  final VoidCallback callBackDone;
  CgridPlayers({this.skipplayer, this.callBackDone});
  @override
  _CgridPlayersState createState() => _CgridPlayersState();
}

class _CgridPlayersState extends State<CgridPlayers> {
  List<ModelPlayer> players = [];

  _onSelected(int index) {
    setState(() => widget.selectedIndex = index);
  }

  _done() {
    if (widget.selectedIndex < 0) return;
    players[widget.selectedIndex].vote++;

    getIt<GameEngine>().players.forEach((player) {
      if (player == players[widget.selectedIndex]) {
        player = players[widget.selectedIndex];
      }
    });

    widget.callBackDone();
  }

  @override
  Widget build(BuildContext context) {
    players = List<ModelPlayer>.from(getIt<GameEngine>().players);
    players.remove(widget.skipplayer);
    return Column(
      children: <Widget>[
        GridView.count(
          padding: const EdgeInsets.all(4.0),
          physics: ScrollPhysics(), // to disable GridView's scrolling
          shrinkWrap: true,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          crossAxisCount: 2,
          children: List.generate(players.length, (index) {
            return Stack(
              children: <Widget>[
                GridTile(
                    child: GestureDetector(
                      onTap: () => _onSelected(index),
                      child: Padding(
                        padding: EdgeInsets.all(36.0),
                        child: Container(
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: widget.selectedIndex != null && widget.selectedIndex == index ? Colors.blue : Colors.white, width: 4)),
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
                    )),
                players[index].vote != 0
                    ? new Positioned(
                        right: 45,
                        bottom: 30,
                        child: new Container(
                          padding: EdgeInsets.all(6),
                          decoration: new BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 28,
                            minHeight: 28,
                          ),
                          child: Text(
                            players[index].vote.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : new Container()
              ],
            );

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
            onPressed: widget.selectedIndex == -1 ? null : () => _done(),
          ),
        ),
      ],
    );
  }
}
