
import 'package:chess/game_screen.dart';
import 'package:chess/main.dart';
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

    return StreamBuilder<GameMessage>(

        stream: UI.of(context).ui.events.stream,
        builder: (context, snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting){
            return screen;

          } else {

            GameMessage gameMessage = snapshot.data;

            switch (gameMessage.runtimeType){
              case ChangeScreen:
                switch(gameMessage.message){
                  case GameScreen.routeName: screen = GameScreen();
                  break;

                  case StartScreen.routeName: screen = StartScreen();
                  break;

                }

            }

          }

          return screen;
        }
    );
  }
}