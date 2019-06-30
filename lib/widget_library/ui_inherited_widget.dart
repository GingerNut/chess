
import 'package:flutter/material.dart';
import 'package:game_server/game_server.dart';

class UI extends InheritedWidget{
  final LocalInterface  ui = LocalInterface(ChessInjector());
  final Widget child;

  UI(this.child);

  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static UI of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(UI);

}