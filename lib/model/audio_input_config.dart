import 'package:meta/meta.dart';

/// Instructs the speech recognizer how to process the audio content.
class InputAudioConfig {
  /// Audio encoding of the audio content to process. Use [AudioEncoding].
  final String audioEncoding;

  /// Sample rate (in Hertz) of the audio content sent in the query. Refer to [Cloud Speech API documentation](https://cloud.google.com/speech-to-text/docs/basics) for more details.
  final int sampleRateHertz;

  /// The language of the supplied audio. Dialogflow does not do translations. See [Language Support](https://cloud.google.com/dialogflow-enterprise/docs/reference/language) for a list of the currently supported language codes. Note that queries in the same session do not necessarily need to specify the same language.
  final String languageCode;

  /// The collection of phrase hints which are used to boost accuracy of speech recognition. Refer to [Cloud Speech API documentation](https://cloud.google.com/speech-to-text/docs/basics#phrase-hints) for more details.
  final List<String> phraseHints;

  InputAudioConfig({
    @required this.audioEncoding,
    @required this.sampleRateHertz,
    @required this.languageCode,
    this.phraseHints,
  });

  static InputAudioConfig fromJson(Map<String, dynamic> json) =>
      InputAudioConfig(
        audioEncoding: json['audioEncoding'],
        sampleRateHertz: json['sampleRateHertz'],
        languageCode: json['languageCode'],
        phraseHints:
            json['phraseHints'] == null ? null : List.from(json['phraseHints']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'audioEncoding': audioEncoding,
        'sampleRateHertz': sampleRateHertz,
        'languageCode': languageCode,
        'phraseHints': phraseHints
      };
}
