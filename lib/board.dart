import 'package:chess/tile_layer.dart';
import 'package:flutter/cupertino.dart';

import 'main.dart';

class BoardWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    var interface = UI.of(context).ui;

    return Expanded(

      child: Container(

        color: Color(interface.theme.background.toInt),

        child: FittedBox(

          child: SizedBox(
            height: 80,
            width: 80,

            child: TileLayer(),


          ),
        ),
      ),
    );
  }






}