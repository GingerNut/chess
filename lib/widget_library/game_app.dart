import 'package:chess/widget_library/router.dart';
import 'package:flutter/material.dart';

import 'ui_inherited_widget.dart';

class GameApp extends StatelessWidget{

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