import 'package:aplikasi/handler/note.dart';
import 'package:aplikasi/widget/note_card.dart';
import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  const NoteList({super.key, required this.notes}); 

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index){
        return NoteCard(
          note: notes[index], 
          isInGrid: false);
      }, 
      clipBehavior: Clip.none,
      separatorBuilder: (context, index) => const SizedBox(height: 8,), 
      itemCount: notes.length);
  }
}