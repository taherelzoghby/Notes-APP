import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:no_tes/models/note.dart';
import 'package:no_tes/views/widgets/noteTile.dart';

class showNotes extends StatelessWidget {
  const showNotes({super.key, required this.notes});
  final List<Note> notes;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        //save data in map to transfer to other page
        Map<String, dynamic> data = {
          'id': notes[index].id,
          'title': notes[index].title,
          'content': notes[index].content,
          'date': notes[index].date,
        };
        return AnimationConfiguration.staggeredList(
          duration: const Duration(milliseconds: 150),
          delay: const Duration(milliseconds: 150),
          position: index,
          child: SlideAnimation(
            horizontalOffset: 50,
            child: FadeInAnimation(
              child: InkWell(
                onTap: () => Get.toNamed('/detailsPage', arguments: data),
                child: noteTile(
                  id: notes[index].id!,
                  title: notes[index].title!,
                  content: notes[index].content!,
                  date: notes[index].date!,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
