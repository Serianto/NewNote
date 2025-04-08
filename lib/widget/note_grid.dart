import 'package:aplikasi/handler/note.dart';
import 'package:aplikasi/widget/note_card.dart';
import 'package:flutter/material.dart';

class NoteGrid extends StatelessWidget {
  const NoteGrid({super.key, required this.notes}); 

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: notes.length,
      itemBuilder: (context, int index) {
        return NoteCard(
          note: notes[index], 
          isInGrid: true);
      },
    );
  }
}