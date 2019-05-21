import 'package:flutter/material.dart';
import '../model/model_game.dart';

class UIrole extends StatefulWidget {
  final RoleType role;
  int max ;
  int value ;
  UIrole({this.role, this.max, this.value = 0});

  @override
  _UIroleState createState() => _UIroleState();
}

class _UIroleState extends State<UIrole> {
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(border: new Border.all(color: Colors.grey)),
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage("images/alpha_werewolf.png"),
            height: 48.0,
            width: 48.0,
          ),
          Text(widget.role.toString().replaceFirst("RoleType.", "")),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleButton(
                  onTap: () {
                    setState(() {
                      if (widget.value > 0) widget.value--;
                    });
                  },
                  iconData: Icons.remove),
              Text(widget.value.toString()),
              CircleButton(
                  onTap: () {
                    setState(() {
                      if (widget.value < widget.max) widget.value++;
                    });
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
