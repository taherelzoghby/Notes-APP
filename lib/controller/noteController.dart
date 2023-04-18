import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:no_tes/models/note.dart';
import 'package:string_stats/string_stats.dart';

import '../main.dart';
import 'package:share/share.dart';

class noteController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  List<Note> notes = [];
  // ignore: non_constant_identifier_names
  RxInt char_count = 0.obs;
  @override
  void onInit() {
    getAllNotes();
    super.onInit();
  }

  bool isEmpty() {
    if (notes.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  //insert Note
  insertNote() async {
    String titl = title.text;
    String conte = content.text;
    if (titl.isBlank == true) {
      titl = "Unknown";
    }
    Note note = Note(
      title: titl,
      content: conte,
      date: DateFormat("yyyy-MM-dd – kk:mm").format(DateTime.now()),
    );
    await database.insertNote(note);
    characterCount(titl + conte);
    //to remove old text
    title.text = "";
    content.text = "";
    char_count = 0.obs;
    //to get all notes when back
    getAllNotes();
    Get.back();
  }

  //delete note
  deleteNote(int id) async {
    Note note = Note(id: id);
    await database.deleteNote(note);
    getAllNotes();
  }

  //update note
  updateNote(int id) async {
    String titl = title.text;
    String conte = content.text;
    if (titl.isBlank == true) {
      titl = "Unknown";
    }
    Note note = Note(
      id: id,
      title: titl,
      content: conte,
      date: DateFormat("yyyy-MM-dd – kk:mm").format(DateTime.now()),
    );
    int res = await database.updateNote(note);
    print(res);
    characterCount(titl + conte);
    //to remove old text
    title.text = "";
    content.text = "";
    char_count = 0.obs;
    //to get all notes when back
    getAllNotes();
    Get.back();
  }

  //get all notes
  getAllNotes() async {
    notes = await database.readNotes();
    update();
  }

  //share note
  void shareNote(String title, String content) async {
    Share.share("""
title : $title
content : $content
""");
  }

  //delete all notes
  deleteAllNotes() {
    database.deleteMyDatabase();
    getAllNotes();
    update();
  }

  //calc number of chars
  characterCount(String word) {
    char_count.value = charCount(word);
  }
}
