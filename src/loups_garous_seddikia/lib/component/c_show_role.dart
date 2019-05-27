import 'package:flutter/material.dart';
import 'package:loups_garous_seddikia/model/model_game.dart';

class ShowRole extends StatefulWidget {
   final ModelPlayer skipplayer;
ShowRole({this.skipplayer});
  @override
  _ShowRoleState createState() => _ShowRoleState();
}

class _ShowRoleState extends State<ShowRole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(color: Colors.pinkAccent),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                        child: Container(
                      decoration: new BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 4)),
                      child: SizedBox(
                          height: 150.0,
                          width: 150.0,
                          child: CircleAvatar(backgroundImage: ExactAssetImage('images/assets_images_ic_person_white_160px_with_background.png'))),
                    ))),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                        child: Container(
                            decoration: new BoxDecoration(color: Colors.purple, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 4)),
                            child: SizedBox(
                              height: 150.0,
                              width: 150.0,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                  child: Image.asset(
                                    widget.skipplayer.role.image,
                                    height: 100,
                                    width: 100,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )))),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.skipplayer.name + " is a",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.skipplayer.role.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                
                ],
              ),
            ),
            Center(
              child: RaisedButton(
                child: const Text(
                  'DONE',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                onPressed: () => Navigator.of(context).pop()
              ),
            ),
          ],
        ))
  
      
    );
  }
}