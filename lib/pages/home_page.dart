import 'package:flutter/material.dart';
import 'package:todo_flutter/components/dialog_box.dart';
import 'package:todo_flutter/data/models/todo_model.dart';

import '../components/todo_list.dart';
import '../data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final toDoDatabase = TodoDatabase();
  List<ToDoModel> toDoList = [];
  final _textController = TextEditingController();

// final _myBox=Hive.box<ToDoModel>('todo_box');
  @override
  void initState() {
    super.initState();
    toDoList = toDoDatabase.loadData();
  }

  Future<void> onSaveTask() async {
    var newTask = ToDoModel(title: _textController.text, isCompleted: false);

    setState(() {
      toDoList.add(newTask);
    });
    await toDoDatabase.addData(newTask);
    onCancelDialog();
  }

  void onCancelDialog() {
    _textController.clear();
    Navigator.pop(context);
  }

  Future<void> onDeleteTask(int index) async {
    setState(() {
      toDoList.removeAt(index);
    });
    await toDoDatabase.deleteData(index);
  }

  Future<void> onCheckBoxChanged(index) async {
    setState(() {
      toDoList[index].isCompleted = !toDoList[index].isCompleted;
    });
    await toDoDatabase.updateData(index, toDoList[index]);
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _textController,
              onSave: onSaveTask,
              onCancel: onCancelDialog);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(toDoList[index].title),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                onDeleteTask(index);
              },
              child: ToDoTile(
                  taskName: toDoList[index].title,
                  isChecked: toDoList[index].isCompleted,
                  onChanged: (state) => onCheckBoxChanged(index)),
            );
          }),
      appBar: AppBar(
        title: const Text(
          "To Do App",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {Navigator.pushNamed(context, '/settings');},
              icon: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12)),
                  child: Icon(Icons.settings)))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
