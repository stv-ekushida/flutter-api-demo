import 'package:flutter/material.dart';

/// Empty State
class EmptyView extends StatelessWidget {
  final String title;

  const EmptyView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}
