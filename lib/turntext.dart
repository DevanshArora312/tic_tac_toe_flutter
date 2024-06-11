import 'package:flutter/material.dart';

class Turntext extends StatelessWidget {
  const Turntext(this.turn,{super.key});
  final String turn;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 24.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          const TextSpan(text: 'It is '),
          TextSpan(text: turn, style: TextStyle(fontWeight: FontWeight.bold,color: turn=="O" ?Colors.red[800] :Colors.blue[800] )),
          const TextSpan(text: "'s turn to play...."),
        ],
      ),
    );
  }
}