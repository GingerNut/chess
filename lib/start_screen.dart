
import 'package:chess_mobile/game_screen.dart';
import 'package:chess_mobile/widget_library/bool_setting_widget.dart';
import 'package:chess_mobile/widget_library/double_setting_widget.dart';
import 'package:chess_mobile/widget_library/game_button.dart';
import 'package:chess_mobile/widget_library/ui_inherited_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_server/game_server.dart';

class StartScreen extends StatelessWidget{
  static const String routeName = 'home';


  @override
  Widget build(BuildContext context) {

    var ui = UI.of(context).ui;

    return SafeArea(
      child: Container(

        color: Color(ui.theme.background.toInt),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            Container(

            ),

            DoubleSettingsWidget('Game Time', ui.localSettings.gameTime),

            BoolSettingsWidget('Timer', ui.localSettings.timer),

            Row(
              children: <Widget>[

                GameButton(
                    Icons.person,
                        () async{
                      ui.resetGame();

                      ui.addPlayer(LocalPlayer(ui));
                      ui.addPlayer(LocalPlayer(ui));

                      ui.newGame.firstPlayer = 'Player 1';
                      ui.playerId = 'Player 1';


                      await ui.startLocalGame();

                      ui.events.add(ChangeScreen(GameScreen.routeName));

                    },
                    'Human'
                ),

                GameButton(
                    Icons.computer,
                        () async{
                      ui.resetGame();

                      LocalPlayer user = LocalPlayer(ui);

                      ui.addPlayer(user);
                      ui.addPlayer(ComputerPlayer(ChessInjector()));
                      ui.playerId = user.id;
                      await ui.startLocalGame();

                      ui.events.add(ChangeScreen(GameScreen.routeName));

                    },
                    'Comp'
                ),

                if(ui.game != null )GameButton(
                    Icons.arrow_back,
                        () async{

                      ui.events.add(ChangeScreen(GameScreen.routeName));

                    },
                    'Comp'
                ),
              ],

            )

          ],

        ),
      ),
    );
  }


}









