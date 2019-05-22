import 'package:flutter/material.dart';
import '../game.dart';
import '../model/model_game.dart';

class UIconfig extends StatefulWidget {
  @override
  _UIconfigState createState() => _UIconfigState();
}

class _UIconfigState extends State<UIconfig> {
    Map<String, bool> general = {
    'Reveal role when player dies': true,
    'No killing during the first night': true,
    'Players can skip voting': true,
    'Hide Number of votes': false,
  };
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Configuration')),
      body: new ListView(
        children: general.keys.map((String key) {
          return new CheckboxListTile(
            title: new Text(key),
            value: general[key],
            onChanged: (bool value) {
              setState(() {
                general[key] = value;
              });
            },
          );
        }).toList(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: RaisedButton(
                child: const Text('START GAME'),
                color: Colors.pinkAccent,
                onPressed: () {
                  print("KHRA");
                },
              ),
    );
  
  }
}