import 'package:flutter/widgets.dart';
import 'package:game_server/game_server.dart';

abstract class FlutterDependencies{

  GameDependency gameDependency;

  List<Route> routes;

}

class Route{

  final String routeName;
  final Widget screen;

  Route(this.routeName, this.screen);

}