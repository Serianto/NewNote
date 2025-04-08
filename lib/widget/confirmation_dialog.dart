

import 'package:aplikasi/widget/dialog_card.dart';
import 'package:aplikasi/widget/note_button.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return DialogCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
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
                onPressed: () => Navigator.pop(context, false),
                isOutlined:true,
                child: const Text('Tidak'),
              ),
              const SizedBox(height: 8),
              NoteButton(
                child: const Text('Iya'),
                onPressed: () => Navigator.pop(context, true),
              )
            ],
          )
        ],
      ),
    );
  }
}