import 'package:flutter/material.dart';
import 'package:game_server/game_server.dart';

import 'game_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return UI(
        LocalInterface(ChessInjector()),

        GameScreen());
  }




}

class UI extends InheritedWidget{
  final LocalInterface  ui;
  final Widget child;

  UI(this.ui, this.child){

    ui.addPlayer(Player());
    ui.addPlayer(Player());
    ui.startLocalGame();


  }

  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static UI of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(UI);




}