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
    
    return Container(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        // padding: const EdgeInsets.all(50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero)
        ),
        fixedSize: const Size(110, 110)
      ),
      onPressed: arr[row][col] != "" || isDone ? null : () => setClicked(row,col), 
      child: Text(arr[row][col],style: TextStyle(
        fontSize: 20,
        color: arr[row][col] == "O" ? Colors.red[800] : Colors.blue[800]
      ),) 
      ),
    );
  }
}