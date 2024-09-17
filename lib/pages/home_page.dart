import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter/dialog_box.dart';
import 'package:todo_flutter/pages/todo_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List todoList=[["finish assigment",true],
    ["dart",true],
    ["financial proposal",true],
    ["technical proposal",true],
    ["interview",true]
  ];
  void onCheckBoxChanged(bool ? state,index){
    setState(() {
      todoList[index][1]= ! todoList[index][1];
    });
  }
  void createNewTask(){
    showDialog(context: context,builder: (context){
return DialogBox();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2F2F2),
      body: ListView.builder(itemCount: todoList.length, itemBuilder: (context, index) {
        return ToDoTile(
            taskName: todoList[index][0], isChecked: todoList[index][1],onChanged: (state)=>onCheckBoxChanged(state, index));
      }),
      appBar: AppBar(
        backgroundColor: Color(0xff161616),
        title: const Text(
          "To Do App",
          style: TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF161616),
        onPressed:createNewTask,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
