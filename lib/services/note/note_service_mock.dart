import 'note_service.dart';
import '../../models/note.dart';

class NoteMockService extends NoteService {
  final List<Note> _noteList = [];

  @override
  Future<List<Note>> getNoteList() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _noteList;
  }

  @override
  Future<void> createNote(Note note) async {
    await Future.delayed(const Duration(milliseconds: 300));
    note.id = (_noteList.length + DateTime.now().millisecondsSinceEpoch).toString();
    _noteList.add(note);
  }

  @override
  Future<void> modifyNote(String noteId, Note updatedNote) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _noteList.indexWhere((note) => note.id == noteId);
    if (index != -1) {
      _noteList[index] = updatedNote;
    }
  }

  @override
  Future<void> deleteNote(String noteId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _noteList.removeWhere((note) => note.id == noteId);
  }
}