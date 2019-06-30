import 'dart:isolate';

import 'package:chess/start_screen.dart';
import 'package:chess/widget_library/router.dart';
import 'package:chess/widget_library/ui_inherited_widget.dart';
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



