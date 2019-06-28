import 'package:chess/widget_library/bool_setting_widget.dart';
import 'package:chess/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{


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

          ],

        ),
      ),
    );
  }


}

class GameButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }



}



