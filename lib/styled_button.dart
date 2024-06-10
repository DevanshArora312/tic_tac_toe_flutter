import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton(this.arr,this.turn,this.setClicked,this.row,this.col,this.isDone,{super.key});
  final List<List<String>> arr;
  final String turn;
  final void Function(int,int) setClicked;
  final int row,col;
  final bool isDone;
  @override
  Widget build(BuildContext context) {
    
    return ElevatedButton(
      onPressed: arr[row][col] == "" || isDone ? () => setClicked(row,col) : null, 
      child: Text(arr[row][col],style: TextStyle(
        fontSize: 20,
        color: arr[row][col] == "O" ? Colors.red[800] : Colors.blue[800]
      ),) 
      );
  }
}