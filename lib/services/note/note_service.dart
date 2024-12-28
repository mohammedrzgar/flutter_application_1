import '../../models/note.dart';

abstract class NoteService {
  Future<List<Note>> getNoteList();
  Future<void> createNote(Note note);
  Future<void> modifyNote(String noteId, Note updatedNote);
  Future<void> deleteNote(String noteId);
}
