import 'package:flutter/material.dart';

class TimerCard extends StatelessWidget{

  final String player;
  final double height;

  const TimerCard(this.player, this.height);

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<TimeStamp>(
        stream: player.timer.events.stream,
        builder: (context, snapshot) {

          String string = 'timer ';

          if(snapshot != null){

            string = snapshot.data == null ? 'timer' : snapshot.data.display;

            if(player.timeLeft < 0.1) string = 'OUT ';
          }
          ;
          return Container(
            height: height,

            child: Center(
              child: Text(
                string,
                style: TextStyle(
                  color: FlutterInterface.getColor(Palette.colorCombo(player.color)),
                  fontSize: height /2,
                ),
              ),
            ),
          );
        }
    );;
  }


}