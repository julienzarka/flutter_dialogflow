import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// The text response message.
class Text extends Message {
  /// The collection of the agent's responses.
  final List<String> text;

  Text({
    String platform,
    this.text,
  }) : super(platform: platform);

  static Text fromJson(Map<String, dynamic> json) => Text(
        platform: json['platform'],
        text: json['text']['text'] == null
            ? null
            : List.from(json['text']['text']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'platform': platform,
        'text': {
          'text': text,
        }
      };
}
