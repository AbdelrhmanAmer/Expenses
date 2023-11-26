import 'dart:developer';

import 'package:flutter/material.dart';

class NewExpanse extends StatefulWidget {
  const NewExpanse({super.key});

  @override
  State<NewExpanse> createState() => _NewExpanseState();
}

class _NewExpanseState extends State<NewExpanse> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50, // طول الاحرف
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: (){
                  log(_titleController.text);
                },
                child: const Text("Save Expanse"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
