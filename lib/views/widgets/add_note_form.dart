import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/views/widgets/colors_list.dart';

import 'custom_add_note_button.dart';
import 'custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  String? title, content;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            const ColorsListView(),
            CustomTextFormField(
              onSaved: (value) {
                title = value;
              },
              hint: 'Title',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              onSaved: (value) {
                content = value;
              },
              hint: 'Content',
              maxLines: 6,
            ),
            const SizedBox(
              height: 32,
            ),
            
            BlocBuilder<AddNoteCubit, AddNoteState>(
                builder: (BuildContext context, state) {
              return CustomAddNoteButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      var formattedDate = DateFormat('dd/MM/yyyy hh:mm a' ).format(DateTime.now());
                      formKey.currentState!.save();
                      var noteModel = NoteModel(
                          title: title!,
                          content: content!,
                          date: formattedDate, 
                          color: Colors.blueAccent.value);
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  });
            }),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
