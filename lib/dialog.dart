import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox(this.reset,this.msg,{super.key});
  final void Function() reset;
  final String msg;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text("Game Over!"),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),
        actions: [
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop();
            }, 
            child: const Text("Close")
          ),
          ElevatedButton(
            onPressed: (){
              reset();
              Navigator.of(context).pop();
            }, 
            child: const Text("New Game")
          ),
        ],
        content:Text(msg),
      );
  }
}