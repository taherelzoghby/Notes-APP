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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width * .03, vertical: height * .01),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: Colors.grey.withOpacity(.4),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * .06, vertical: height * .009),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
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
