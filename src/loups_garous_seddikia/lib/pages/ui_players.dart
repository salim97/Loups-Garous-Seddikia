import 'package:flutter/material.dart';
import '../game.dart';
import '../model/model_game.dart';
import 'ui_roles.dart';

class UIplayers extends StatefulWidget {
  UIplayers({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _UIplayersState createState() => _UIplayersState();
}

class _UIplayersState extends State<UIplayers> {
  List<ModelPlayer> players = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GameEngine gameEngine = getIt<GameEngine>();
    players = gameEngine.players;
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
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new UIroles()));
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
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () async {
          final String currentTeam = await this._asyncInputDialog(context, username: player.name);
          if (currentTeam.isEmpty) return;
          setState(() {
            player.name = currentTeam;
          });
        },
      ),
    );
  }

  Future<String> _asyncInputDialog(BuildContext context, {String username = ""}) async {
    TextEditingController _controller = new TextEditingController(text: username);

    return showDialog<String>(
      context: context,
      barrierDismissible: false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(username.isEmpty ? "Add new player" : "Edit player name"),
          content: new Row(
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                autofocus: true,
                decoration: new InputDecoration(
                  labelText: 'Player name',
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.clear,
                      size: 20.0,
                    ),
                    onPressed: () => _controller.text="",
                  ),
                ),
                controller: _controller,
              ))
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop("");
              },
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop(_controller.text);
              },
            ),
          ],
        );
      },
    );
  }
}
