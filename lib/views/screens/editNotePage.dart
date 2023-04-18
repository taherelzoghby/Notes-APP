import 'package:flutter/material.dart';
import 'package:no_tes/controller/noteController.dart';
import 'package:get/get.dart';
import '../widgets/contentTextField.dart';
import '../widgets/titleTextField.dart';

class editNotePage extends StatelessWidget {
  final _cont = Get.find<noteController>();
  late String date;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = Get.arguments;
    _cont.title.text = data['title'];
    _cont.content.text = data['content'];
    date = data['date'];
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Note'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleTextField(title: _cont.title, read_only: false),
                const SizedBox(height: 20),
                Obx(
                  () => Text('$date | ${_cont.char_count} character'),
                ),
                const SizedBox(height: 10),
                contentTextField(content: _cont.content, read_only: false),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _cont.updateNote(data['id']);
          Get.back();
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
