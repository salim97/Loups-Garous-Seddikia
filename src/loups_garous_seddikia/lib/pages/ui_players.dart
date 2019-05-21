import 'package:flutter/material.dart';
import '../game.dart';
import '../model/model_game.dart';
import 'ui_roles.dart';

class UI_players extends StatefulWidget {
  UI_players({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _UI_playersState createState() => _UI_playersState();
}

class _UI_playersState extends State<UI_players> {
  List<ModelPlayer> players = [];
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      players.add(new ModelPlayer(name: "Salim", role: null));
      players.add(new ModelPlayer(name: "Redoune", role: null));
      players.add(new ModelPlayer(name: "Hakim", role: null));

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
             Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new UI_roles(players: players)));
            },
          ),
        ],
      ),

      body: ListView.builder(
          itemCount: this.players.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(this.players[index].name),
              onDismissed: (direction) {
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: Text(players[index].name + " khroj 9awed"),
                ));

                players.removeAt(index);
              },
              background: Container(color: Colors.red),
              child: this.listItem(this.players[index]),
            );
          }),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String currentTeam = await this._asyncInputDialog(context);
          if (currentTeam.isEmpty) return;
          setState(() {
            players.add(ModelPlayer(name: currentTeam, role: null));
          });
        },
        tooltip: 'Add player',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    
    );
  }

  listItem(ModelPlayer player) {
    return ListTile(
      leading: Icon(Icons.tag_faces),
      title: Text(player.name),
      trailing: Icon(Icons.edit),
    );
  }

  Future<String> _asyncInputDialog(BuildContext context) async {
    String teamName = '';
    return showDialog<String>(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add new player'),
          content: new Row(
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                autofocus: true,
                decoration: new InputDecoration(labelText: 'Player name'),
                onChanged: (value) {
                  teamName = value;
                },
              ))
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop(teamName);
              },
            ),
          ],
        );
      },
    );
  }

}