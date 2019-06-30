import 'package:chess/widget_library/ui_inherited_widget.dart';
import 'package:flutter/material.dart';
import 'package:game_server/game_server.dart';

class TimerCard extends StatefulWidget{

  final String player;
  final double height;

  TimerCard(this.player, this.height);

  @override
  _TimerCardState createState() => _TimerCardState();
}

class _TimerCardState extends State<TimerCard> {
  double timeLeft;
  Stopwatch stopwatch = Stopwatch();
  bool inPlay = false;

  @override
  Widget build(BuildContext context) {
    String text = widget.player;

    if(inPlay) text = timeLeft.toString();

    var ui = UI.of(context).ui;

    return StreamBuilder<GameMessage>(
        stream: ui.events.stream,
        builder: (context, snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting){

            //TODO return a blank object - not null

          } else {

            GameMessage message = snapshot.data;

            print(message);

            if(message is GameTimer){

              switch(message.instruction){
                case 'start':
                  timeLeft = message.timeLeft;
                  stopwatch.reset();
                  stopwatch.start();
                  inPlay = true;
                  break;

                case 'stop':
                  stopwatch.stop();
                  inPlay = false;
                  break;
              }



            }

          }

          return Container(
            height: widget.height,

            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Color(ui.theme.lightText.toInt),
                  fontSize: widget.height,
                ),
              ),
            ),
          );
        }
    );;
  }
}