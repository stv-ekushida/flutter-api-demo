import 'package:flutter/material.dart';

/// Error State
class ErrorView extends StatelessWidget {
  final String title;

  const ErrorView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}
