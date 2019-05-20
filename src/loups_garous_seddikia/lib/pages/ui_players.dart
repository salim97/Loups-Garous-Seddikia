import 'package:flutter/material.dart';

class UI_players extends StatefulWidget {
  UI_players({
    Key key,
    this.title
  }): super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _UI_playersState createState() => _UI_playersState();
}

class _UI_playersState extends State < UI_players > {
  final List < String > players = ["Salim", "hakim", "Redoune", "Jalil", "Bebe fuck"];

  _addItem(String name) {
    return ListTile(
      leading: Icon(Icons.tag_faces),
      title: Text(name),
      trailing: Icon(Icons.edit),
    );
  }

  Future < String > _asyncInputDialog(BuildContext context) async {
    String teamName = '';
    return showDialog < String > (
      context: context,
      barrierDismissible: false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add new player'),
          content: new Row(
            children: < Widget > [
              new Expanded(
                child: new TextField(
                  autofocus: true,
                  decoration: new InputDecoration(
                    labelText: 'Player name'),
                  onChanged: (value) {
                    teamName = value;
                  },
                ))
            ],
          ),
          actions: < Widget > [
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
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: < Widget > [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              // null
            },
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: this.players.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(this.players[index]),
            onDismissed: (direction) {
             
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: Text(players[index] + " khroj 9awed"),
              ));

              players.removeAt(index);
            },
            background: Container(color: Colors.red),
            child: this._addItem(this.players[index]),
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String currentTeam = await this._asyncInputDialog(context);
          if(currentTeam.isEmpty) return ;
          setState(() {
            players.add(currentTeam);
          });
        },
        tooltip: 'Add player',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
