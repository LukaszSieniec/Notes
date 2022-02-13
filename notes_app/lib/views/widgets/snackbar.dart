import 'package:flutter/material.dart';

class PrimarySnackBar extends SnackBar {
  final String title;

  PrimarySnackBar({required this.title, Key? key})
      : super(
            key: key,
            content: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
            duration: const Duration(seconds: 2));
}
