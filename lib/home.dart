import 'package:flutter/material.dart';
import 'package:tic_tac_toe/dialog.dart';
import 'package:tic_tac_toe/playarea.dart';
import 'package:tic_tac_toe/turntext.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String turn = 'O';
  int moves = 0;
  List<List<String>> arr = List<List<String>>.generate(3, (i) => List<String>.generate(3, (index) => "",growable: false),growable: false,);
  bool isDone = false;
  String checkEnd(){
    for(int i=0;i<3;i++){
      if(arr[i][0] == arr[i][1] && arr[i][0] == arr[i][2] && arr[i][0] != "" ){
        return arr[i][0];
      }
    }
    for(int i=0;i<3;i++){
      if(arr[0][i] == arr[1][i] && arr[0][i] == arr[2][i] && arr[0][i] != "" ){
        return arr[0][i];
        }
    }
    if(arr[0][0] == arr[1][1] && arr[0][0] == arr[2][2] && arr[0][0] != "" ){
      return arr[0][0];
    }
    if(arr[2][0] == arr[1][1] && arr[2][0] == arr[0][2] && arr[0][2] != "" ){
      return arr[0][2];
    }
    return "";
  }
  void setClicked(int row,int col){
    setState(() {
      arr[row][col] = turn; 
      turn = turn == 'O' ? 'X' : 'O';
      moves = moves + 1;
    });
    String win = checkEnd();
    if(win != ""){
        setState(() {
          isDone = true;
        });
      showDialog(context: context, builder: (BuildContext context){
        return DialogBox(reset,"Congratulations, $win Won!!");        
      });
    }else {
      if(moves == 9){
        setState(() {
          isDone = true;
        });
        showDialog(context: context, builder: (BuildContext context){
          return DialogBox(reset,"It's a Draw!!");        
        });
      }
    }
  }
  void reset(){
    setState(() {
      isDone = false;
      arr = List<List<String>>.generate(3, (i) => List<String>.generate(3, (index) => "",growable: false),growable: false,); 
      turn = "O";
      moves = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic-Tac-Toe"),
        backgroundColor: Colors.blue[400],
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child:Turntext(turn)),
          Playarea(arr,turn,setClicked,isDone),
          FilledButton(
            onPressed: reset, 
            child: const Text("Reset")
          ),
      ],) 
    );
  }
}