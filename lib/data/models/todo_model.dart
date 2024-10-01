import 'package:hive/hive.dart';

part 'todo_model.g.dart';
@HiveType(typeId: 1)
class ToDoModel extends HiveObject{
  @HiveField(0)
  final String title;
  @HiveField(1)
   bool isCompleted;
ToDoModel({required this.title,required this.isCompleted});
}