import 'package:aplikasi/widget/dialog_card.dart';
import 'package:aplikasi/widget/note_button.dart';
import 'package:aplikasi/widget/note_form_field.dart';
import 'package:flutter/widgets.dart';

class NewTagDialog extends StatefulWidget {
  const NewTagDialog({super.key, this.tag});

  final String? tag;

  @override
  State<NewTagDialog> createState() => _NewTagDialogState();
}

class _NewTagDialogState extends State<NewTagDialog> {
  late final TextEditingController tagController;
  late final GlobalKey<FormFieldState> tagKey;
  
  @override
  void initState() {
    tagController = TextEditingController(text: widget.tag);
    tagKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DialogCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Tambah Tag',
            style: TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 24),
          NoteFormField(
            key: tagKey,
            controller: tagController,
            hintText: 'Tambahkan Tag (< 16 Hurup)',
            validator: (value){
              if(value!.trim().isEmpty){
                return 'Tidak ada tag yang ditambahkan';
              }else if(value.trim().length > 16){
                return 'Dibilang jangan lebih dari 16 huruf';
              }
              return null;
            },
            onChanged: (newValue){
              tagKey.currentState?.validate();
            },
            autofocus: true,
          ),
          const SizedBox(height: 24),
          NoteButton(
            child: const Text('Tambah'),
            onPressed: (){
              if(tagKey.currentState?.validate() ?? false){
                Navigator.pop(context, tagController.text.trim());
              }
            },
          )
        ],
      ));
  }
}