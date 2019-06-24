import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_server/game_server.dart';

class GameScreen extends StatelessWidget{

  LocalInterface interface = LocalInterface(ChessInjector());


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(


      color: Color(interface.theme.background.toInt),
    );
  }




}