import 'package:flutter/material.dart';
import '../game.dart';
import '../model/model_game.dart';

class UI_roles extends StatefulWidget {
  List<ModelPlayer> players = [];
  UI_roles({this.players});

  @override
  _UI_rolesState createState() => _UI_rolesState();
}

class _UI_rolesState extends State<UI_roles> {
  List<ModelRole> roles = [];

  listItem(ModelRole player) {
    return ListTile(
      leading: Icon(Icons.tag_faces),
      title: Text(player.roleType.toString()),
      trailing: Text(player.count.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Roles"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
             //Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new UI_roles(players: players)));
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: this.roles.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(this.roles[index].roleType.toString()),
              onDismissed: (direction) {
                roles.removeAt(index);
              },
              background: Container(color: Colors.red),
              child: this.listItem(this.roles[index]),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final int roleIndex = await this._asyncListDialog(context);
          bool alreadyExsits = false ;
          roles.forEach( (role) {
            if(role.roleType == RoleType.values[roleIndex])
            { 
              alreadyExsits = true ;
              setState(() {   role.count++;  });
            }
          });
          if(!alreadyExsits)
          setState(() {
            roles.add(ModelRole(roleType: RoleType.values[roleIndex], count: 1));
          });
        },
        tooltip: 'Add role',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<int> _asyncListDialog(BuildContext context) async {
    int roleIndex;
    return showDialog<int>(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Add new role'),
            content: new ListView.builder(
              shrinkWrap: true,
              itemCount: RoleType.values.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(RoleType.values[index].toString()),
                  onTap: () {
                      Navigator.of(context).pop(index);
                  },
                );
              },
            ));
      },
    );
  }
}
