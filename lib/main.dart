import 'package:flutter/material.dart';
import 'package:game_server/game_server.dart';

import 'game_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return InheritedPosition(
        ChessPosition(),

        GameScreen());
  }




}

class InheritedPosition extends InheritedWidget{
  final Position position;
  final Widget child;

  InheritedPosition(this.position, this.child);

  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static InheritedPosition of(BuildContext context) => 
      context.inheritFromWidgetOfExactType(InheritedPosition);




}