import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/model_game.dart';
import '../game.dart';
import 'c_show_role.dart';

class CgridPlayersNight extends StatefulWidget {
  final ModelPlayer skipplayer;
  int selectedIndex = -1;
  final VoidCallback callBackDone;

  CgridPlayersNight({
    this.skipplayer,
    this.callBackDone,
  });
  @override
  _CgridPlayersNightState createState() => _CgridPlayersNightState();
}

class _CgridPlayersNightState extends State<CgridPlayersNight> {
  List<ModelPlayer> players = [];
  List<ModelHistoric> actionList = [];
  bool hideVoteNumber = false;
  _onSelected(int index) {
    setState(() => widget.selectedIndex = index);
  }

  _done() {
    if (widget.selectedIndex < 0) return;
    if (widget.skipplayer.role.roleType == RoleType.hunter)
      actionList.add(ModelHistoric(currentPlayer: widget.skipplayer, targetPlayer: players[widget.selectedIndex], action: ActionType.kill));
    if (widget.skipplayer.role.roleType == RoleType.witch)
      actionList.add(ModelHistoric(currentPlayer: widget.skipplayer, targetPlayer: players[widget.selectedIndex], action: ActionType.kill));

    widget.callBackDone();
  }

  @override
  Widget build(BuildContext context) {
    hideVoteNumber = Provider.of<GameEngine>(context).hide_number_of_votes;
    actionList = Provider.of<GameEngine>(context).actionList;

    players = List<ModelPlayer>.from(Provider.of<GameEngine>(context).players);
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
                      onTap: players[index].role.roleType == widget.skipplayer.role.roleType ? null : () => _onSelected(index),
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
                players[index].role.roleType == widget.skipplayer.role.roleType
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
                            "werewolf",
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
        siwtchButtonForEachRole()
      ],
    );
  }

  siwtchButtonForEachRole() {
    if (widget.skipplayer.role.roleType == RoleType.werewolf)
      return Center(
        child: RaisedButton(
          child: const Text(
            'KILL',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: Colors.blue,
          onPressed: widget.selectedIndex == -1
              ? null
              : () {
                  actionList.add(ModelHistoric(currentPlayer: widget.skipplayer, targetPlayer: players[widget.selectedIndex], action: ActionType.kill));
                  widget.callBackDone();
                },
        ),
      );
    if (widget.skipplayer.role.roleType == RoleType.seer)
      return Center(
        child: RaisedButton(
          child: const Text(
            'SELECT',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: Colors.blue,
          onPressed: widget.selectedIndex == -1
              ? null
              : () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new ShowRole(
                            skipplayer: players[widget.selectedIndex],
                          )));
                  widget.callBackDone();
                },
        ),
      );
  }
}
