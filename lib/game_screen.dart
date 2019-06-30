import 'package:chess/board.dart';
import 'package:chess/start_screen.dart';
import 'package:chess/widget_library/game_button.dart';
import 'package:chess/widget_library/ui_inherited_widget.dart';
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


          GameButton(
            Icons.home,
              (){ui.events.add(ChangeScreen(StartScreen.routeName));},
            'home'
      ),

          GameButton(
              Icons.computer,
                  () async{
                    ui.resetGame();

                    ui.addPlayer(LocalPlayer(ui));
                    ui.addPlayer(ComputerPlayer(ChessInjector()));
                    await ui.startLocalGame();

                    ui.events.add(ChangeScreen(GameScreen.routeName));

                },
              'Comp'
          ),

          GameButton(
              Icons.person,
                  () async{
                ui.resetGame();

                ui.addPlayer(LocalPlayer(ui));
                ui.addPlayer(LocalPlayer(ui));
                await ui.startLocalGame();

                ui.events.add(ChangeScreen(GameScreen.routeName));

              },
              'Human'
          ),

        ],


      ),
    );
  }




}