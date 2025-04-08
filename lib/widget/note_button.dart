import 'package:aplikasi/utils/constant.dart';
import 'package:flutter/material.dart';

class NoteButton extends StatelessWidget {
  const NoteButton({super.key, required this.child, this.onPressed, this.isOutlined = false}); 

  final Widget child;
  final VoidCallback? onPressed;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            color: isOutlined ? primary : grey300,
          )
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        onPressed: onPressed, 
        child: child),    
    );
  }
}