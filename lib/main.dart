import 'dart:isolate';

import 'package:chess/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:game_server/game_server.dart';

import 'game_screen.dart';

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return UI(

        MaterialApp(
            home: Scaffold(
              body: UI(

                Router(
                ),

              ),
            )));
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
