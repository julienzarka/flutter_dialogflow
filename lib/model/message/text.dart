/// The text response message.
class Text {
  /// The collection of the agent's responses.
  final List<String> text;

  Text({
    this.text,
  });

  static Text fromJson(Map<String, dynamic> json) => Text(
        text: List.from(json['text']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'text': text,
      };
}
