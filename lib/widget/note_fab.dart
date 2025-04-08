import 'package:aplikasi/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteFab extends StatelessWidget {
  const NoteFab({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(4, 4)
          )
        ],
      ),
      child: FloatingActionButton.large(
        onPressed: onPressed,
        backgroundColor: primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            color: Colors.black,
          )
        ),
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }
}