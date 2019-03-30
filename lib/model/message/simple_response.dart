/// The simple response message containing speech or text.
class SimpleResponse {
  /// One of textToSpeech or ssml must be provided. The plain text of the speech output. Mutually exclusive with ssml.
  final String textToSpeech;

  /// One of textToSpeech or ssml must be provided. Structured spoken response to the user in the SSML format. Mutually exclusive with textToSpeech.
  final String ssml;

  /// The text to display.
  final String displayText;

  SimpleResponse({
    this.textToSpeech,
    this.ssml,
    this.displayText,
  });

  static SimpleResponse fromJson(Map<String, dynamic> json) => SimpleResponse(
        textToSpeech: json['textToSpeech'],
        ssml: json['ssml'],
        displayText: json['displayText'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'textToSpeech': textToSpeech,
        'ssml': ssml,
        'displayText': displayText,
      };
}
