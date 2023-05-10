import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class adaptiveFloatingActionButton extends StatelessWidget {
  const adaptiveFloatingActionButton(
      {super.key,
      required this.os,
      required this.widget,
      required this.function});
  final String os;
  final Widget widget;
  final void Function()? function;
  @override
  Widget build(BuildContext context) {
    if (os == 'android')
      return FloatingActionButton(
        onPressed: () => function!(),
        child: widget,
      );
    return CupertinoButton(
      onPressed: () => function!(),
      child: widget,
    );
  }
}
