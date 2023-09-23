import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_note_cubit/note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteView(
            noteModel: noteModel,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 16, bottom: 24, left: 8, right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(noteModel.color)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          ListTile(
            title: Text(
              noteModel.title,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 12),
              child: Text(
                noteModel.content,
                style: TextStyle(
                    fontSize: 20, color: Colors.black.withOpacity(0.6)),
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                noteModel.delete();
                BlocProvider.of<NotesCubit>(context).getNotes();
              },
              icon: const Icon(Icons.delete_rounded),
              color: Colors.black,
              iconSize: 32,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 24.0,
            ),
            child: Text(
              noteModel.date,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
        ]),
      ),
    );
  }
}
