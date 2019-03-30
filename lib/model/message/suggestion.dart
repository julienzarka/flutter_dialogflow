import 'package:meta/meta.dart';

/// The suggestion chip message that the user can tap to quickly post a reply to the conversation.
class Suggestion {
  /// The text shown the in the suggestion chip.
  final String title;

  Suggestion({
    @required this.title,
  });

  static Suggestion fromJson(Map<String, dynamic> json) => Suggestion(
        title: json['title'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
      };
}
