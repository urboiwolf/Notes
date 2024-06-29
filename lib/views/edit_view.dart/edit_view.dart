import 'package:flutter/material.dart';
import 'package:notes_app/const/const.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/widgets/edit_widget/edit_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: SafeArea(
        child: EditNoteViewBody(note: note),
      ),
    );
  }
}
