import 'package:chess/game_screen.dart';
import 'package:chess/widget_library/bool_setting_widget.dart';
import 'package:chess/main.dart';
import 'package:chess/widget_library/double_setting_widget.dart';
import 'package:chess/widget_library/game_button.dart';
import 'package:chess/widget_library/ui_inherited_widget.dart';
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
                  Icon(Icons.arrow_forward_ios),
                        ()async{

                          if(ui.game == null){
                            ui.addPlayer(Player());
                            ui.addPlayer(Player());
                            await ui.startLocalGame();
                          }

                          ui.events.add(ChangeScreen(GameScreen.routeName));
                        },
                  'start game'

                )
              ],

            )

          ],

        ),
      ),
    );
  }


}









