import 'package:chess/game_screen.dart';
import 'package:chess/widget_library/bool_setting_widget.dart';
import 'package:chess/main.dart';
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





class GameButton extends StatelessWidget{

  Icon icon;
  Function onPressed;
  String text;

  GameButton(
      this.icon,
      this.onPressed,
      this.text
      );

  @override
  Widget build(BuildContext context) {

    var ui = UI.of(context).ui;

    // TODO: implement build
    return  Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(80.0),
          child: RaisedButton(
            color: Color(ui.theme.button.toInt),
            onPressed: onPressed,
            child: icon,
          ),
        ),
      ),
    );
  }
}





