import 'package:aplikasi/handler/note.dart';
import 'package:aplikasi/notifier/new_note_controller.dart';
import 'package:aplikasi/utils/constant.dart';
import 'package:aplikasi/utils/dialogs.dart';
import 'package:aplikasi/utils/utils.dart';
import 'package:aplikasi/widget/note_icon_button.dart';
import 'package:aplikasi/widget/note_tag.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NoteMetadata extends StatefulWidget {
  const NoteMetadata({super.key, required this.note});

  final Note? note;

  @override
  State<NoteMetadata> createState() => _NoteMetadataState();
}

class _NoteMetadataState extends State<NoteMetadata> {
  late final NewNoteController newNoteController;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    newNoteController = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(widget.note != null) ...[
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: Text(
                  'Terakhir dirubah',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: grey500),
                    )
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(toLongDate(widget.note!.dateModified),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: grey900),))
            ],
          ),
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: Text(
                  'Dibuat',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: grey500),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Text(toLongDate(widget.note!.dateCreated),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: grey900
                  ),))
            ],
          )
        ],
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Text(
                    'Tag',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: grey500,
                    ),
                  ),
                  const SizedBox(width: 8),
              NoteIconButton(
                icon: FontAwesomeIcons.circlePlus,
                onPressed: () async {
                  final String? tag = await showNewTagDialog(context: context);

                  if(tag != null){
                    newNoteController.addTag(tag);
                  }
                },
              ),
            ]
          ),
          ),
          Expanded(
            flex: 5,
            child: Selector<NewNoteController, List<String>>(
              selector: (_, newNoteController) => newNoteController.tags,
              builder: (_, tags, __) => tags.isEmpty 
              ? const Text(
                'Tidak ada yang ditambahkan',
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  color: grey900),
                  ): SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      tags.length,
                      (index) => NoteTag(
                        label: tags[index],
                        onClosed: (){
                          newNoteController.removeTag(index);
                        },
                        onTap: () async {
                          final String? tag = await showNewTagDialog(
                            context: context,
                            tag: tags[index],
                          );

                          if(tag != null && tag != tag[index]){
                            newNoteController.updateTag(tag, index);
                          }
                        }
                      )
                    )
                  )
                )
              ),
            )
          ],
        )
      ],
    );
  }
}