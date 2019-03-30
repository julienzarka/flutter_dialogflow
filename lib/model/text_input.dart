import 'package:meta/meta.dart';

/// Represents the natural language text to be processed.
class TextInput {
  /// The UTF-8 encoded natural language text to be processed. Text length must not exceed 256 characters.
  final String text;

  /// The language of this conversational query. See [Language Support](https://cloud.google.com/dialogflow-enterprise/docs/reference/language) for a list of the currently supported language codes. Note that queries in the same session do not necessarily need to specify the same language.
  final String languageCode;

  TextInput({
    @required this.text,
    @required this.languageCode,
  });

  static TextInput fromJson(Map<String, dynamic> json) => TextInput(
        text: json['text'],
        languageCode: json['languageCode'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'text': text,
        'languageCode': languageCode,
      };
}
