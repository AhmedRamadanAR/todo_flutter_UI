// dialog_box.dart
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: TextFormField(
          style: const TextStyle(color: Colors.white),
          controller: controller,
          decoration: InputDecoration(
              enabledBorder: _border,
              focusedBorder: _border,
              border: _border,
              label: const Text('Type your task here'),
              hintStyle: const TextStyle(color: Colors.grey)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "please enter a value";
            } else {
              return null;
            }
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        onSave();
                      }
                    },
                    child: const Text("Save"))),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: ElevatedButton(
                    onPressed: onCancel, child: const Text("Cancel")))
          ],
        )
      ],
    );
  }
}

final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(color: Colors.white, width: 1));
