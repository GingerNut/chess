import 'package:chess/game_screen.dart';
import 'package:chess/start_screen.dart';
import 'package:chess/widget_library/flutter_dependencies.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:game_server/game_server.dart';

class FlutterChess implements FlutterDependencies{

  GameDependency gameDependency = ChessInjector();

  @override
  List<Route> routes = [
    Route(
    StartScreen.routeName,
    StartScreen(),
  ),

    Route(
      GameScreen.routeName,
      GameScreen(),
    ),


  ];

  Widget get home => StartScreen();

}