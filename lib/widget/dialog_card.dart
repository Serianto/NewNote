import 'package:flutter/material.dart';

class DialogCard extends StatelessWidget {
  const DialogCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.75,
          margin: MediaQuery.viewInsetsOf(context),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 2,
              color: Colors.black,
            ),
            boxShadow: const[
              BoxShadow(offset: Offset(4, 4)),
            ],
            borderRadius: BorderRadius.circular(16),
          ),
          child: child,
        ),
      ),
    );
  }
}