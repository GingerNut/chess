import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_server/game_server.dart';

import 'main.dart';

class TileLayer extends StatelessWidget {

  final List<Widget> pieces = new List();

  Widget build(BuildContext context) {
    var ui = UI
        .of(context)
        .ui;

    return StreamBuilder<Message>(
        stream: ui.events.stream,
        builder: (context, snapshot) {
          pieces.clear();

          (ui.position as ChessPosition).board.tiles.forEach((t) {
            pieces.add(ChessTile(t));
          });


          return Stack(

            children: pieces,

          );
        }
    );
  }

}

  class ChessTile extends StatelessWidget{
  final Tile t;

  const ChessTile(this.t);


  @override
  Widget build(BuildContext context) {

  var ui = UI.of(context).ui;

    return StreamBuilder<Message>(
      stream: ui.events.stream,
      builder: (context, snapshot) {

        int tileColor = (t.i + t.j).isEven ?
        ui.theme.tileDark.toInt : ui.theme.tileLight.toInt;

        if((ui.input as ChessInput).selected != null){
          if((ui.input as ChessInput).selected.legalMoves.contains(t)) tileColor = ui.theme.highlight.toInt;
        }

        return Positioned(
          left: 10.0 * (7-t.i),
          top: 10.0 * t.j,

          child: GestureDetector(

            onTap: (){
              (ui.input as ChessInput).tapTile(t);

              (ui.input as ChessInput).selected = t.pieces.isNotEmpty ? t.pieces.first : null;

            },

            child: SizedBox(
              height: 10.0,
              width: 10.0,

              child: Container(
                color: Color(tileColor),
              ),


            ),
          ),
        );
      }
    );
  }


  }



