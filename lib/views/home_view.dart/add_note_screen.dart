import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/const/const.dart';
import 'package:notes_app/cubtits/addnote_cubit/add_notes_cubit.dart';
import 'package:notes_app/cubtits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/views/home_view.dart/custom_botton.dart';
import 'package:notes_app/widgets/bottom_sheet_widget/colors_listview.dart';
import 'package:notes_app/widgets/bottom_sheet_widget/custom_textformfield.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  String? title, subtitle;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
        listener: (context, state) {
          if (state is AddNotesSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllData();
            Navigator.pop(context);
          } else if (state is AddNotesError) {
            print('error is ${state.error}');
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: scaffoldColor,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: scaffoldColor,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new)),
              actions: [
                SaveNotes(),
              ],
            ),
            body: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          children: [
                            const ColorItemListView(),
                            const SizedBox(
                              height: 19,
                            ),
                            CustomTextFormField(
                              onSave: (value) {
                                title = value;
                              },
                              maxLines: 2,
                              hint: 'Title',
                              textStyle: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Divider(),
                            CustomTextFormField(
                              onSave: (value) {
                                subtitle = value;
                              },
                              hint: 'Content',
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 7,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  BlocBuilder<AddNotesCubit, AddNotesState> SaveNotes() {
    return BlocBuilder<AddNotesCubit, AddNotesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: CustomButton(
            // isLoading: true,
            isLoading: state is AddNotesLoading ? true : false,
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var currentDate = DateTime.now();
                var formattedDate =
                    DateFormat('dd-MM-yyyy').format(currentDate);
                var noteModel = NoteModel(
                    title: title!,
                    subtitle: subtitle!,
                    date: formattedDate,
                    color: Colors.teal.value);
                BlocProvider.of<AddNotesCubit>(context).addNotes(noteModel);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        );
      },
    );
  }
}
