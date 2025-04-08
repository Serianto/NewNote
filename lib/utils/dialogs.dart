import 'package:aplikasi/widget/confirmation_dialog.dart';
import 'package:aplikasi/widget/message_dialog.dart';
import 'package:aplikasi/widget/new_tag_dialog.dart';
import 'package:flutter/material.dart';

Future<String?> showNewTagDialog({
  required BuildContext context,
  String? tag,
}) {
  return showDialog<String?>(
    context: context,
    builder: (context) => NewTagDialog(tag: tag)
  );
}

Future<bool?> showConfirmationDialog({
  required BuildContext context,
  required String title,
}){
  return showDialog<bool?>(
    context: context, 
    builder: (_) => ConfirmationDialog(title: title));
}

Future<bool?> showMessageDialog({
  required BuildContext context,
  required String message,
}){
  return showDialog<bool?>(
    context: context, 
    builder: (_) => MessageDialog(message: message));
}