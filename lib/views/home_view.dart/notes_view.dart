import 'package:flutter/material.dart';
import 'package:notes_app/const/const.dart';
import 'package:notes_app/views/home_view.dart/add_note_screen.dart';

import 'package:notes_app/widgets/home_widget/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Color(0xFF171C26),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNoteScreen()));
          // showModalBottomSheet(
          //     isScrollControlled: true,
          //     backgroundColor: Colors.black,
          //     shape: const RoundedRectangleBorder(
          //         borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(18),
          //     )),
          //     context: context,
          //     builder: (context) {
          //       return const AddNoteBottomSheet();
          //     });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 42,
        ),
      ),
      body: const SafeArea(
        child: NotesViewBody(),
      ),
    );
  }
}
