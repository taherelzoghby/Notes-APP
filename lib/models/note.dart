class Note {
  int? id;
  String? title;
  String? content;
  String? date;
  Note({
    this.id,
    this.title,
    this.content,
    this.date,
  });

//convert data to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'date': date,
    };
  }
}
