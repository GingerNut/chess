
import 'package:chess/main.dart';
import 'package:flutter/material.dart';
import 'package:game_server/game_server.dart';

class DoubleSettingsWidget extends StatefulWidget{

  final String text;
  final BoolSetting setting;

  const DoubleSettingsWidget(this.text, this.setting);

  @override
  _DoubleSettingsWidgetState createState() => _DoubleSettingsWidgetState();
}

class _DoubleSettingsWidgetState extends State<DoubleSettingsWidget> {

  String text;
  BoolSetting setting;

  _DoubleSettingsWidgetState();

  initState(){
    text = widget.text;
    setting = widget.setting;
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    var ui = UI.of(context).ui;

    return Row(

      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[

        Expanded(
            child: Container()),

        Text(
          text,

          style: TextStyle(
              fontSize: 40,
              color: Color(ui.theme.lightText.toInt)

          ),


        ),

        Expanded(
            child: Container()),

        Switch(
          value: setting.value,
          onChanged: (value) {
            setState(() {
              setting.value = value;
            });
          },
          activeTrackColor: Color(ui.theme.button.toInt),
          activeColor: Color(ui.theme.highlight.toInt),
        ),

        Expanded(
            child: Container()),

      ],


    );
  }
}