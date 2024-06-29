import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubtits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/home_widget/custom_listview_item.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllData();
    super.initState();
  }

  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 22,
          ),
          Center(
            child: Text(
              'Notes',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: CustomListViewItem(),
          ),
        ],
      ),
    );
  }
}
