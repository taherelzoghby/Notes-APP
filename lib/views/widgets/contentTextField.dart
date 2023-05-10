import 'package:flutter/material.dart';

import '../../adaptive/adaptiveTextField.dart';
import '../../constants.dart';

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
    return adaptiveTextField(
      controller: content,
      max_lines: 90,
      read_only: read_only,
      hint: 'Start typing',
      os: Os(),
    );
  }
}
