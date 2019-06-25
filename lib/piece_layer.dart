import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_server/game_server.dart';

import 'main.dart';

class PieceLayer extends StatelessWidget {

  final List<Widget> pieces = new List();

  Widget build(BuildContext context) {
    var ui = UI
        .of(context)
        .ui;

    return StreamBuilder<Message>(
        stream: ui.events.stream,
        builder: (context, snapshot) {

          pieces.clear();

          (ui.position as ChessPosition).board.whiteArmy.forEach((p) {
            pieces.add(ChessPieceWidget(p, ChessColor.white));
          });

          (ui.position as ChessPosition).board.blackArmy.forEach((p) {
            pieces.add(ChessPieceWidget(p, ChessColor.black));
          });

          return Stack(

            children: pieces,

          );
        }
    );
  }

}

  class ChessPieceWidget extends StatelessWidget{
  final ChessPiece p;
  final ChessColor chessColor;

  const ChessPieceWidget(this.p,this.chessColor);


  @override
  Widget build(BuildContext context) {

    Tile t = p.tile;

  var ui = UI.of(context).ui;

  int tileColor = chessColor == ChessColor.white ?
      ui.theme.lightText.toInt : ui.theme.darkText.toInt;


    return Positioned(
      left: 10.0 * (7-t.i),
      top: 10.0 * t.j,

        child: IgnorePointer(
          child: Container(
            height: 10.0,
            width: 10.0,

            child: Center(
              child: Text(
                p.name,
                style: TextStyle(
                  fontSize: 9,
                  color: Color(tileColor),
                ),
              ),
            ),


          ),
        ),

    );
  }


  }



