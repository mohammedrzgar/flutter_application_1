import 'package:flutter/material.dart';

import 'main_viewmodel.dart';
import '../view.dart';

class NoteTile extends StatelessWidget {
  final int index;

  const NoteTile(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<MainViewmodel>(
      builder: (_, vm, __) {
        final note = vm.getNote(index);
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text(
              note.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              note.content,
              style: const TextStyle(color: Colors.black87),
            ),
            onTap: () => vm.editIndex = index,
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.grey),
              onPressed: () => vm.removeNote(note.id),
            ),
          ),
        );
      },
    );
  }
}