import 'package:flutter/material.dart';
import 'package:no_tes/controller/noteController.dart';
import 'package:get/get.dart';
import '../widgets/contentTextField.dart';
import '../widgets/titleTextField.dart';

class detailsNotePage extends StatelessWidget {
  final _cont = Get.find<noteController>();
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = Get.arguments;
    _cont.title.text = data['title'];
    _cont.content.text = data['content'];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed('/editNotePage', arguments: data),
            icon: const Icon(Icons.edit),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 0) {
                _cont.deleteNote(data['id']);
                Get.back();
              }
              if (value == 1) {
                _cont.shareNote(_cont.title.text, _cont.content.text);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: const [
                    Icon(Icons.delete, color: Colors.red),
                    SizedBox(width: 10),
                    Text('delete'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: const [
                    Icon(Icons.share, color: Colors.blue),
                    SizedBox(width: 10),
                    Text('share'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleTextField(read_only: true, title: _cont.title),
                const SizedBox(height: 20),
                Text('${data['date']} | ${_cont.char_count} character'),
                const SizedBox(height: 10),
                contentTextField(read_only: true, content: _cont.content),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
