import 'package:chess/widget_library/flutter_dependencies.dart';
import 'package:chess/widget_library/router.dart';
import 'package:flutter/material.dart';

import 'ui_inherited_widget.dart';

class GameApp extends StatelessWidget{

  final FlutterDependencies flutterDependencies;

  const GameApp(this.flutterDependencies);

  Widget build(BuildContext context) {

    return UI(

        MaterialApp(
            home: Scaffold(
              body: UI(

                Router(
                ),
                flutterDependencies

              ),
            ),
        ),
    flutterDependencies);
  }






}