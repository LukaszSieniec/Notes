import 'package:equatable/equatable.dart';
import 'package:notes_app/utils/extensions.dart';

class Note extends Equatable {
  final String content;
  final int creationDate;

  get myContent => content.removeEmptySpace();

  const Note({required this.content, required this.creationDate});

  factory Note.fromJson(Map<String, dynamic> json) =>
      Note(content: json['content'], creationDate: json['creation_date']);

  Map<String, dynamic> toJson() =>
      {'content': content, 'creation_date': creationDate};

  @override
  List<Object> get props => [content, creationDate];
}
