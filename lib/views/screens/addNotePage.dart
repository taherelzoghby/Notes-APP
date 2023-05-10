import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:no_tes/constants.dart';
import 'package:no_tes/controller/noteController.dart';
import 'package:get/get.dart';
import '../../adaptive/adaptiveFloatingActionButton.dart';
import '../widgets/contentTextField.dart';
import '../widgets/titleTextField.dart';

class addNotePage extends StatelessWidget {
  final _cont = Get.find<noteController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Note'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleTextField(title: _cont.title, read_only: false),
                const SizedBox(height: 20),
                GetX<noteController>(
                  init: noteController(),
                  builder: (c) => Text(
                      '${DateFormat("MMM dd yyy HH:MM a").format(DateTime.now())} | ${_cont.char_count} character'),
                ),
                const SizedBox(height: 10),
                contentTextField(content: _cont.content, read_only: false),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: adaptiveFloatingActionButton(
        os: Os(),
        function: () => _cont.insertNote(),
        widget: const Icon(Icons.done),
      ),
    );
  }
}
