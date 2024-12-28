import '../../services/note/note_service.dart';
import '../../models/note.dart';
import '../../app/service_locator.dart';
import '../viewmodel.dart';

class MainViewmodel extends Viewmodel {
  List<Note>? _notes;
  List<Note>? get notes => _notes;
  final NoteService _noteService = locator<NoteService>();

  get noteService => _noteService;

  int? _editIndex;
  int? get editIndex => _editIndex;
  set editIndex(value) => update(() async => _editIndex = value);

  int? get listCount {
    if (_notes == null) return 0;
    return _notes?.length;
  }

  Future<void> fetchNotes() async {
    _notes = await _noteService.getNoteList();
    notifyListeners();
  }

  Future<void> addNote(Note note) async {
    update(() async {
      await _noteService.createNote(note);
      await fetchNotes();
    });
  }

  Future<void> updateNote({
    required int index,
    required Note data,
  }) async {
    await _noteService.modifyNote(_notes![index].id, data);
    _notes![index] = Note(
      id: _notes![index].id,
      title: data.title,
      content: data.content,
    );
    notifyListeners();
  }

  Future<void> removeNote(String id) async {
    update(() async {
      await _noteService.deleteNote(id);
      await fetchNotes();
    });
  }

  Note getNote(int index) => _notes![index];
}