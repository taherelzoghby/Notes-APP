import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_tes/controller/noteController.dart';
import 'package:no_tes/models/note.dart';

import '../../main.dart';
import 'noteTile.dart';

class searchBar extends SearchDelegate {
  final _cont = Get.find<noteController>();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Get.back(),
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Note> notes = _cont.notes
        .where(
          (element) =>
              element.title!.contains(query) ||
              element.content!.contains(query),
        )
        .toList();

    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> data = {
          'id': notes[index].id,
          'title': notes[index].title,
          'content': notes[index].content,
          'date': notes[index].date,
        };
        return InkWell(
          onTap: () => Get.toNamed('/detailsPage', arguments: data),
          child: noteTile(
            title: notes[index].title!,
            content: notes[index].content!,
            date: notes[index].date!,
            id: notes[index].id!,
          ),
        );
      },
    );
  }
}
