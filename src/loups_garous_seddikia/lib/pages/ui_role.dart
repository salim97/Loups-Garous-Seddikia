import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/model_game.dart';
import '../game.dart';

class UIrole extends StatefulWidget {
  final RoleType role;

  UIrole({this.role});

  @override
  _UIroleState createState() => _UIroleState();
}

class _UIroleState extends State<UIrole> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    final GameEngine gameEngine = Provider.of<GameEngine>(context);
    return Container(
      decoration: new BoxDecoration(border: new Border.all(color: Colors.grey)),
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage(modelRoleMap[widget.role].image),
            height: 48.0,
            width: 48.0,
          ),
          Text(ModelRole(widget.role).name),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleButton(
                  onTap: () {
                    setState(() {
                      if (this.value > 0) {
                        for (final role in gameEngine.roles) {
                          if (role.roleType == widget.role) {
                            gameEngine.roles.remove(role);
                            break;
                          }
                        }

                        this.value--;
                      }
                    });
                  },
                  iconData: Icons.remove),
              Text(this.value.toString()),
              CircleButton(
                  onTap: () {
                    if (gameEngine.players.length == gameEngine.roles.length) return;
                    if (this.value < gameEngine.players.length) {
                      setState(() {
                        gameEngine.roles.add(new ModelRole(roleType: widget.role));
                        this.value++;
                      });
                    }
                  },
                  iconData: Icons.add),
            ],
          )
        ],
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;

  const CircleButton({Key key, this.onTap, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 30.0;

    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: Colors.blueAccent,
          shape: BoxShape.circle,
        ),
        child: new Icon(
          iconData,
          color: Colors.black,
        ),
      ),
    );
  }
}
