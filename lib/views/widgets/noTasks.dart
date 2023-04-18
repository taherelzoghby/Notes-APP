// ignore: file_names
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class noTasks extends StatelessWidget {
  const noTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/note.svg',
            semanticsLabel: 'My SVG Image',
            height: MediaQuery.of(context).size.height * .2,
            color: Colors.orange.withOpacity(.5),
          ),
          const SizedBox(height: 25),
          const Text(
            "You don't have any notes",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 21),
          )
        ],
      ),
    );
  }
}
