// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:wardrobe/widgets/Buttons.dart';

class newCollection extends StatelessWidget {
  VoidCallback onSave;
  final controller;
  newCollection({super.key, required this.onSave, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name your collection!",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(onPressed: onSave, text: "Save"),

                const SizedBox(width: 4),
                //cancel button
                MyButton(onPressed: Navigator.of(context).pop, text: "Cancel"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class newOutfit extends StatelessWidget {
  VoidCallback onSave;
  final controller;
  newOutfit({super.key, required this.onSave, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name your outfit!",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(onPressed: onSave, text: "Save"),

                const SizedBox(width: 4),
                //cancel button
                MyButton(onPressed: Navigator.of(context).pop, text: "Cancel"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
