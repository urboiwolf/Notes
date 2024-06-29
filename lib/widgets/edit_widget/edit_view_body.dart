import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubtits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/widgets/edit_widget/edit_note_color_list.dart';
import 'package:notes_app/widgets/home_widget/custom_appbar.dart';
import 'package:notes_app/widgets/bottom_sheet_widget/custom_textformfield.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subtitle;
  bool istapped = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            CustomAppBar(
              onTap: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subtitle = subtitle ?? widget.note.subtitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllData();
                Navigator.pop(context);
              },
              title: 'Edit',
              icon: Icons.done,
            ),
            const SizedBox(
              height: 30,
            ),
            EditNoteColorList(note: widget.note),
            const SizedBox(
              height: 19,
            ),
            CustomTextFormField(
              onChanged: (value) {
                title = value;
              },
              initialValue: widget.note.title,
              maxLines: 1,
              textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Divider(),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              onChanged: (value) {
                subtitle = value;
              },
              initialValue: widget.note.subtitle,
              maxLines: 5,
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
