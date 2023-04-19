import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_tes/controller/noteController.dart';
import 'package:no_tes/views/widgets/noTasks.dart';
import 'package:no_tes/views/widgets/searchBar.dart';

import '../widgets/showNotes.dart';

class home extends StatelessWidget {
  final _cont = Get.put(noteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(.9),
      appBar: AppBar(
        title: const Text("Notes"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: searchBar()),
              icon: Icon(Icons.search)),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 0) _cont.deleteAllNotes();
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: const [
                    Icon(Icons.delete),
                    SizedBox(width: 10),
                    Text('delete all notes'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: GetBuilder<noteController>(
        init: noteController(),
        builder: (_) => _cont.isEmpty()
            ? const noTasks()
            : showNotes(
                notes: _cont.notes,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/addNotePage'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
