import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubtits/notes_cubit/notes_cubit.dart';

import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/views/edit_view.dart/edit_view.dart';

class CustomNoteItem extends StatefulWidget {
  const CustomNoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  State<CustomNoteItem> createState() => _CustomNoteItemState();
}

class _CustomNoteItemState extends State<CustomNoteItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditNoteView(
                      note: widget.note,
                    )));
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Delete Note'),
                content:
                    const Text('Are you sure you want to delete this note?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        widget.note.delete();
                        BlocProvider.of<NotesCubit>(context).fetchAllData();
                      },
                      child: const Text('Delete')),
                ],
              );
            });
        // widget.note.delete();
        // BlocProvider.of<NotesCubit>(context).fetchAllData();
      },
      child: Container(
        padding: const EdgeInsets.only(top: 6, bottom: 6, left: 6, right: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            //0xffFFCC80
            // color: Colors.grey,
            color: Color(widget.note.color)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              // contentPadding: EdgeInsets.zero,
              title: Text(
                widget.note.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                child: Text(
                  widget.note.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              // trailing: IconButton(
              //   padding: EdgeInsets.zero,
              //   onPressed: () {
              //     note.delete();
              //     BlocProvider.of<NotesCubit>(context).fetchAllData();
              //   },
              //   icon: const Icon(
              //     FontAwesomeIcons.trash,
              //     color: Colors.black,
              //     size: 26,
              //   ),
              // ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                widget.note.date,
                style: TextStyle(color: Colors.grey[800], fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
