import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// Represents the query input. It can contain either:
/// 1.  an audio config which instructs the speech recognizer how to process the speech audio,
/// 2.  a conversational query in the form of text, or
/// 3.  an event that specifies which intent to trigger.
class QueryInput {
  /// Instructs the speech recognizer how to process the speech audio.
  final InputAudioConfig audioConfig;

  /// The natural language text to be processed.
  final TextInput text;

  /// The event to be processed.
  final EventInput event;

  QueryInput({
    this.audioConfig,
    this.text,
    this.event,
  }) {
    assert(
        (audioConfig != null && text == null && event == null) ||
            (audioConfig == null && text != null && event == null) ||
            (audioConfig == null && text == null && event != null) ||
            (audioConfig == null && text == null && event == null),
        'Input can be only one of the following: audioConfig, text or event.');
  }

  static QueryInput fromJson(Map<String, dynamic> json) => QueryInput(
        audioConfig: json['audioConfig'] == null
            ? null
            : InputAudioConfig.fromJson(json['audioConfig']),
        text: json['text'] == null ? null : TextInput.fromJson(json['text']),
        event:
            json['event'] == null ? null : EventInput.fromJson(json['event']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'text': text == null ? null : text.toJson(),
        'event': event == null ? null : event.toJson(),
        'audioConfig': audioConfig == null ? null : audioConfig.toJson(),
      };
}
