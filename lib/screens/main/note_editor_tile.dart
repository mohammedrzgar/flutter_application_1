import 'package:flutter/material.dart';
import '/screens/main/main_viewmodel.dart';
import '../view.dart';
import '../../models/note.dart';

class NoteEditorTile extends StatefulWidget {
  final int index;

  const NoteEditorTile(this.index, {Key? key}) : super(key: key);

  @override
  State<NoteEditorTile> createState() => _NoteEditorTileState();
}

class _NoteEditorTileState extends State<NoteEditorTile> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  Widget build(BuildContext context) {
    return ViewWrapper<MainViewmodel>(
      builder: (_, vm, __) {
        final note = vm.getNote(widget.index);
        
        _titleController = TextEditingController(text: note.title);
        _contentController = TextEditingController(text: note.content);
        
        return ListTile(
          title: TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: 'Enter title',
            ),
            onChanged: (value) {
              vm.updateNote(
                index: widget.index,
                data: Note(
                  id: note.id,
                  title: value,
                  content: note.content,
                ),
              );
            },
          ),
          subtitle: TextField(
            controller: _contentController,
            decoration: const InputDecoration(
              hintText: 'Enter content',
            ),
            onChanged: (value) {
              vm.updateNote(
                index: widget.index,
                data: Note(
                  id: note.id,
                  title: note.title,
                  content: value,
                ),
              );
            },
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: () => vm.editIndex = null,
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  vm.removeNote(note.id);
                  vm.editIndex = null;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}