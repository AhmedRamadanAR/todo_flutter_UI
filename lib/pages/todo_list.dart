import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isChecked;
  Function(bool?)? onChanged;

  ToDoTile({required this.taskName, required this.isChecked, this.onChanged});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            children: [
              Checkbox(
                  value: isChecked,
                  onChanged: onChanged,
                  activeColor: Colors.black),
              Text(
                taskName,
                style: TextStyle(decoration: isChecked? TextDecoration.lineThrough : TextDecoration.none),
              )
            ],
          ),
          decoration: BoxDecoration(
              color: Color(0xFF979797),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
