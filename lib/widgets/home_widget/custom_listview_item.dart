import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubtits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/widgets/home_widget/custom_note_item.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return ConditionalBuilder(
          condition: notes.isNotEmpty,
          builder: (context) {
            return GridView.builder(
              itemCount: notes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                return CustomNoteItem(
                  note: notes[index],
                );
              },
            );
          },
          fallback: (context) {
            return Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/Frame 2.png'),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'No notes',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Create a note and it will show up here.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                )
              ],
            ));
          },
        );
        // return ListView.builder(
        //   itemCount: notes.length,
        //   itemBuilder: (context, index) {
        //     return Padding(
        //       padding: const EdgeInsets.symmetric(vertical: 8.0),
        //       child: CustomNoteItem(
        //         note: notes[index],
        //       ),
        //     );
        //   },
        // );
      },
    );
  }
}
