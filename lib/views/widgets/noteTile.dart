import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:no_tes/controller/noteController.dart';

class noteTile extends StatelessWidget {
  noteTile({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    required this.id,
  });
  final int id;
  final String title;
  final String content;
  final String date;
  final _cont = Get.find<noteController>();
  @override
  Widget build(BuildContext context) {
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: isLandScape
            ? MediaQuery.of(context).size.height * .4
            : MediaQuery.of(context).size.height * .17,
        width: MediaQuery.of(context).size.width * .9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _cont.deleteNote(id),
                    icon: const Icon(Icons.delete),
                  )
                ],
              ),
              Text(content, maxLines: 3, overflow: TextOverflow.ellipsis),
              Text(date, style: const TextStyle(fontSize: 11)),
            ],
          ),
        ),
      ),
    );
  }
}
