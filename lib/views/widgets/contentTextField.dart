import 'package:flutter/material.dart';

class contentTextField extends StatelessWidget {
  const contentTextField({
    super.key,
    required this.content,
    required this.read_only,
  });
  final TextEditingController content;
  final bool read_only;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: content,
      maxLines: 90,
      readOnly: read_only,
      decoration: const InputDecoration(
        hintText: 'Start typing',
        border: InputBorder.none,
      ),
    );
  }
}
