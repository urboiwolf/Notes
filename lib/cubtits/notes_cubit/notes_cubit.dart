import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/const/const.dart';
import 'package:notes_app/model/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  fetchAllData() async {
    var notesBox = Hive.box<NoteModel>(keybox);
    // await notesBox.add(noteModel);
    notes = notesBox.values.toList();

    emit(NotesSuccess());
  }
}
