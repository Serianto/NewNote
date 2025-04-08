import 'package:aplikasi/enum/order_option.dart';
import 'package:aplikasi/handler/note.dart';
import 'package:aplikasi/notifier/new_note_controller.dart';
import 'package:aplikasi/notifier/note_provider.dart';
import 'package:aplikasi/page/new_edit_screen.dart';
import 'package:aplikasi/utils/constant.dart';
import 'package:aplikasi/utils/dialogs.dart';
import 'package:aplikasi/utils/utils.dart';
// ignore: unused_import
import 'package:aplikasi/widget/new_tag_dialog.dart';
import 'package:aplikasi/widget/note_tag.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note, required this.isInGrid});

  final Note note;
  final bool isInGrid;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (_) => NewNoteController()..note = note, 
              child: const NewOrEditNotePage(false, isNewNote: false)
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: primary.withOpacity(0.5),
              offset: const Offset(4, 4)
            )
          ]
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(note.title != null) ...[
              Text(
                note.title!,
                maxLines: 1, 
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
            ],
            // ignore: unnecessary_null_comparison
            if(note.tags != null) ...[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    note.tags.length, 
                    (index) => NoteTag(label: note.tags[index])
                  )
                ),
              ),
              const SizedBox(height: 4),
            ],
            if(note.content != null) 
              isInGrid ? Expanded(child: Text(note.content!, style: const TextStyle(color: Colors.grey),)) : Text(note.content!, maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.grey),),
              if(isInGrid) const Spacer(),
              Row(
                children: [
                  Selector<NotesProvider, OrderOption>(
                    selector: (_, notesProvider) => notesProvider.orderBy, 
                    builder: (_, orderBy, __) => Text(
                      toShortDate(orderBy == 
                      OrderOption.dateModified ? note.dateModified : note.dateCreated),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: grey500,
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async{
                      final shouldDelete = await showConfirmationDialog(
                        context: context,
                        title: 'Apakah yakin ingin dihapus?'
                      ) ?? false;

                      if(shouldDelete && context.mounted){
                        context.read<NotesProvider>().deleteNote(note);
                      }
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.trash,
                      color: Colors.grey, 
                      size: 16,
                    ),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}