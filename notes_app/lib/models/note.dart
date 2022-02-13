class Note {
  final String content;
  final int creationDate;

  Note({required this.content, required this.creationDate});

  factory Note.fromJson(Map<String, dynamic> json) =>
      Note(content: json['content'], creationDate: json['creation_date']);

  Map<String, dynamic> toJson() =>
      {'content': content, 'creation_date': creationDate};
}
