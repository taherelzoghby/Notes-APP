import 'package:flutter/material.dart';

class titleTextField extends StatelessWidget {
  const titleTextField({
    super.key,
    required this.title,
    required this.read_only,
  });
  final TextEditingController title;
  final bool read_only;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: title,
      readOnly: read_only,
      decoration: const InputDecoration(
        hintText: 'Title',
        hintStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
        border: InputBorder.none,
      ),
    );
  }
}
