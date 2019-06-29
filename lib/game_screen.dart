import 'package:chess/board.dart';
import 'package:chess/start_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_server/game_server.dart';

import 'main.dart';


class GameScreen extends StatelessWidget{
  static const String routeName = 'game';

  @override
  Widget build(BuildContext context) {

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
    return Container(
      color: Color(ui.theme.background.toInt),

      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget>[

          RaisedButton(
            padding: const EdgeInsets.all(8.0),
            textColor: Color(ui.theme.lightText.toInt),
            color: Color(ui.theme.button.toInt),
            onPressed: () async{

              ui.events.add(ChangeScreen(StartScreen.routeName));
            },
            child: new Text("Home"),

      ),


           RaisedButton(
            padding: const EdgeInsets.all(8.0),
            textColor: Color(ui.theme.lightText.toInt),
            color: Color(ui.theme.button.toInt),
            onPressed: () async{

              ui.resetGame();

              ui.addPlayer(Player());
              ui.addPlayer(ComputerPlayer(ChessInjector()));
              await ui.startLocalGame();

              ui.events.add(ChangeScreen(GameScreen.routeName));
            },
            child: new Text("Computer game"),
          ),

           RaisedButton(
            padding: const EdgeInsets.all(8.0),
            textColor: Color(ui.theme.lightText.toInt),
            color: Color(ui.theme.button.toInt),
            onPressed: () async{

              ui.resetGame();

              ui.addPlayer(Player());
              ui.addPlayer(Player());
              await ui.startLocalGame();

              ui.events.add(ChangeScreen(GameScreen.routeName));
            },
            child: new Text("Human game"),
          ),

        ],


      ),
    );
  }




}