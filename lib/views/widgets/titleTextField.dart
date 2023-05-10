import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_tes/constants.dart';

import '../../adaptive/adaptiveTextField.dart';

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
    return adaptiveTextField(
      controller: title,
      read_only: read_only,
      hint: 'Title',
      style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
      os: Os(),
    );
  }
}
