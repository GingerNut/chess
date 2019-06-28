
import 'package:chess/main.dart';
import 'package:flutter/material.dart';

class BoolSettingsWidget extends StatefulWidget{

  final String text;
  final bool variable;

  const BoolSettingsWidget(this.text, this.variable);

  @override
  _BoolSettingsWidgetState createState() => _BoolSettingsWidgetState(text, variable);
}

class _BoolSettingsWidgetState extends State<BoolSettingsWidget> {

  String text;
  bool variable;

  _BoolSettingsWidgetState(this.text, this.variable);

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
          value: variable,
          onChanged: (value) {
            setState(() {
              variable = value;

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