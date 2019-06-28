import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:game_server/game_server.dart';

import 'game_screen.dart';

void main() async{




  runApp(MyApp());


}

class MyApp extends StatelessWidget{

  const MyApp();


  @override
  Widget build(BuildContext context) {




    return UI(

        MaterialApp(
            home: GameScreen()));
  }


}

class UI extends InheritedWidget{
  final LocalInterface  ui = LocalInterface(ChessInjector());
  final Widget child;

  UI(this.child);

  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static UI of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(UI);




}