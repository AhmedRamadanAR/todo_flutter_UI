import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_flutter/data/models/todo_model.dart';
class TodoDatabase {
final _myBox = Hive.box<ToDoModel>('todo_box');

Future<void> addData(ToDoModel todoModel) async{
 await _myBox.add( todoModel);
}
List<ToDoModel> loadData(){
  return  _myBox.values.toList();
}
 Future<void> updateData(int index,ToDoModel todoModel)async{
     await _myBox.putAt(index, todoModel);
 }
 Future<void> deleteData(int index) async{
  await _myBox.deleteAt(index);
 }

}
