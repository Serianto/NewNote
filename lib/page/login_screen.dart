import 'package:aplikasi/handler/note.dart';
import 'package:aplikasi/notifier/new_note_controller.dart';
import 'package:aplikasi/notifier/note_provider.dart';
import 'package:aplikasi/page/new_edit_screen.dart';
import 'package:aplikasi/service/auth_service.dart';
import 'package:aplikasi/utils/dialogs.dart';
import 'package:aplikasi/widget/no_note.dart';
import 'package:aplikasi/widget/note_fab.dart';
import 'package:aplikasi/widget/note_grid.dart';
import 'package:aplikasi/widget/note_icon_button_outlined.dart';
import 'package:aplikasi/widget/note_list.dart';
import 'package:aplikasi/widget/search_field.dart';
import 'package:aplikasi/widget/view_option.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awesome Notes 📒'),
        actions: [
          NoteIconButtonOutlined(
            icon: FontAwesomeIcons.rightFromBracket,
            onPressed: () async {
              final bool shouldLogout = await showConfirmationDialog(
                    context: context,
                    title: 'Do you want to sign out of the app?',
                  ) ??
                  false;
              if (shouldLogout) AuthService.logout();
            },
          ),
        ],
      ),
      floatingActionButton: NoteFab(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => NewNoteController(),
                child: NewOrEditNotePage(
                  isNewNote: true),
              ),
            ),
          );
        },
      ),
      body: Consumer<NotesProvider>(
        builder: (context, notesProvider, child) {
          final List<Note> notes = notesProvider.notes;
          return notes.isEmpty && notesProvider.searchTerm.isEmpty
              ? const NoNotes()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SearchField(),
                      if (notes.isNotEmpty) ...[
                        const ViewOptions(),
                        Expanded(
                          child: notesProvider.isGrid
                              ? NoteGrid(notes: notes)
                              : NoteList(notes: notes),
                        ),
                      ] else
                        const Expanded(
                          child: Center(
                            child: Text(
                              'No notes found for your search query!',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}