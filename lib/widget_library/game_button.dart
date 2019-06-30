import 'package:chess/widget_library/ui_inherited_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

