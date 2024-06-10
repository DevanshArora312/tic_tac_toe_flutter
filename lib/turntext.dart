import 'package:flutter/material.dart';

class Turntext extends StatelessWidget {
  const Turntext(this.turn,{super.key});
  final String turn;
  @override
  Widget build(BuildContext context) {
    return Text("It is $turn's turn to play.....",
    style: const TextStyle(
      fontSize: 20,
    ),);
  }
}