import 'package:flutter/material.dart';
import 'package:tic_tac_toe/styled_button.dart';

class Playarea extends StatelessWidget {
  const Playarea(this.arr,this.turn,this.setClicked,this.isDone,{super.key});
  final List<List<String>> arr;
  final String turn;
  final void Function(int,int) setClicked;
  final bool isDone;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for(int i=0;i<3;i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for(int j=0;j<3;j++)
                StyledButton(arr,turn,setClicked,i,j,isDone)
            ],
          )
      ],
    );
  }
}