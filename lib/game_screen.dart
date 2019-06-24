import 'package:chess/board.dart';
import 'package:chess/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class GameScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,

      children: <Widget>[


        BoardWidget(),


      ],
    );
  }




}