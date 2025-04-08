import 'package:aplikasi/widget/dialog_card.dart';
import 'package:aplikasi/widget/note_button.dart';
import 'package:flutter/widgets.dart';

class MessageDialog extends StatelessWidget {
  const MessageDialog({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return DialogCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NoteButton(
                child: const Text('Ok'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          )
        ],
      ));
  }
}