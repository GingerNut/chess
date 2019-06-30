
import 'package:chess/start_screen.dart';
import 'package:chess/widget_library/ui_inherited_widget.dart';
import 'package:flutter/material.dart';
import 'package:game_server/game_server.dart';

class Router extends StatefulWidget{



  @override
  _RouterState createState() => _RouterState();
}

class _RouterState extends State<Router> {
  Widget screen = StartScreen();

  Widget build(BuildContext context) {

    var routes = UI.of(context).flutterDependencies.routes;

    return StreamBuilder<GameMessage>(

        stream: UI.of(context).ui.events.stream,
        builder: (context, snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting){
            return screen;

          } else {

            routes.forEach((r){
              if(r.routeName == snapshot.data.message) screen = r.screen;
            });

          }

          return screen;
        }
    );
  }
}