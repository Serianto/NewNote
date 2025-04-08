import 'package:aplikasi/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteToolbar extends StatelessWidget {
  const NoteToolbar({super.key, required this.controller});

  final QuillController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: white,
        border: Border.all(
          color: primary,
          strokeAlign: BorderSide.strokeAlignOutside
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: primary,
            offset: Offset(4, 4)
          )
        ]
      ),
      //child: QuillToolbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              QuillToolbarHistoryButton(
                options: const QuillToolbarHistoryButtonOptions(
                  isUndo: true,
                  iconData: FontAwesomeIcons.arrowRotateLeft), 
                controller: controller),

              QuillToolbarHistoryButton(
                options: const QuillToolbarHistoryButtonOptions(
                  isUndo: false,
                  iconData: FontAwesomeIcons.arrowRotateRight), 
                controller: controller),

              QuillToolbarToggleStyleButton(
                options: const QuillToolbarToggleStyleButtonOptions(
                  iconData: FontAwesomeIcons.bold
                ), 
                controller: controller, 
                attribute: Attribute.bold),

              QuillToolbarToggleStyleButton(
                options: const QuillToolbarToggleStyleButtonOptions(
                  iconData: FontAwesomeIcons.italic
                ),
                controller: controller, 
                attribute: Attribute.italic),

              QuillToolbarToggleStyleButton(
                options: const QuillToolbarToggleStyleButtonOptions(
                  iconData: FontAwesomeIcons.underline
                ), 
                controller: controller, 
                attribute: Attribute.underline),

              QuillToolbarToggleStyleButton(
                options: const QuillToolbarToggleStyleButtonOptions(
                  iconData: FontAwesomeIcons.strikethrough
                ), 
                controller: controller, 
                attribute: Attribute.strikeThrough),

              QuillToolbarColorButton(
                controller: controller, 
                isBackground: true,
                options: const QuillToolbarColorButtonOptions(
                  iconData: FontAwesomeIcons.palette
                ),
              ),

              QuillToolbarColorButton(
                controller: controller, 
                isBackground: false,
                options: const QuillToolbarColorButtonOptions(
                  iconData: FontAwesomeIcons.fillDrip
                ),
              ),

              QuillToolbarClearFormatButton(
                controller: controller, 
                options: const QuillToolbarClearFormatButtonOptions(
                  iconData: FontAwesomeIcons.textSlash
                ),
              ),

              QuillToolbarToggleStyleButton(
                options: const QuillToolbarToggleStyleButtonOptions(
                  iconData: FontAwesomeIcons.listOl
                ), 
                controller: controller, 
                attribute: Attribute.ol),

              QuillToolbarToggleStyleButton(
                options: const QuillToolbarToggleStyleButtonOptions(
                  iconData: FontAwesomeIcons.listUl
                ), 
                controller: controller, 
                attribute: Attribute.ul),

              QuillToolbarSearchButton(
                controller: controller, 
                options: const QuillToolbarSearchButtonOptions(
                  iconData: FontAwesomeIcons.magnifyingGlass
                ))
            ],
          ),
        ),
      //),
    );
  }
}

