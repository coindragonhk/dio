import 'package:flutter/material.dart';

/// Helper class to show a snackbar using the passed context.
class ScaffoldSnackBar {
  ScaffoldSnackBar(this._context);

  final BuildContext _context;

  /// The scaffold of current context.
  factory ScaffoldSnackBar.of(BuildContext context) {
    return ScaffoldSnackBar(context);
  }

  /// Helper method to show a SnackBar.
  void show(String message) {
    ScaffoldMessenger.of(_context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message)),
      );
  }
}
