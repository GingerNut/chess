import 'package:chess/board.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_server/game_server.dart';

import 'main.dart';


class GameScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    var ui = UI.of(context).ui;
    ui.addPlayer(Player());
    ui.addPlayer(Player());
     ui.startLocalGame();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,

        children: <Widget>[


          BoardWidget(),

          ButtonRow(),


        ],
      ),
    );
  }




}

class ButtonRow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var ui = UI.of(context).ui;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: <Widget>[
        new RaisedButton(
          padding: const EdgeInsets.all(8.0),
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: () async{

            ui.resetGame();

            ui.addPlayer(Player());
            ui.addPlayer(ComputerPlayer(ChessInjector()));
            await ui.startLocalGame();

            print('started computer game');

            ui.events.add(Success());
          },
          child: new Text("Computer game"),
        ),

        new RaisedButton(
          padding: const EdgeInsets.all(8.0),
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: () async{

            ui.resetGame();

            ui.addPlayer(Player());
            ui.addPlayer(Player());
            await ui.startLocalGame();

            print('started human game');

            ui.events.add(Success());
          },
          child: new Text("Human game"),
        ),

      ],


    );
  }




}