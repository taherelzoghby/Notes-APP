import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class adaptiveTextField extends StatelessWidget {
  const adaptiveTextField({
    Key? key,
    required this.os,
    this.controller,
    this.read_only,
    this.hint,
    this.style,
    this.placeholderStyle,
    this.max_lines,
  }) : super(key: key);
  final String os;
  final TextEditingController? controller;
  final bool? read_only;
  final String? hint;
  final TextStyle? style;
  final TextStyle? placeholderStyle;
  final int? max_lines;

  @override
  Widget build(BuildContext context) {
    if (os == 'android') {
      return TextField(
        maxLines: max_lines ?? 1,
        controller: controller,
        readOnly: read_only ?? false,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: style,
          border: InputBorder.none,
        ),
      );
    }

    return CupertinoTextField(
      maxLines: max_lines ?? 1,
      controller: controller,
      placeholder: hint,
      readOnly: read_only ?? false,
      placeholderStyle: style,
      decoration: BoxDecoration(),
    );
  }
}
