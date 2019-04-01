import 'package:meta/meta.dart';
import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

class DetectIntentRequest {
  /// The parameters of this query.
  final QueryParameters queryParams;

  /// The input specification. It can be set to:
  /// 1.  an audio config which instructs the speech recognizer how to process the speech audio,
  /// 2.  a conversational query in the form of text, or
  /// 3.  an event that specifies which intent to trigger.
  final QueryInput queryInput;

  /// The natural language speech audio to be processed. This field should be populated iff queryInput is set to an input audio config. A single request can contain up to 1 minute of speech audio data.
  /// A base64-encoded string.
  final String inputAudio;

  DetectIntentRequest({
    @required this.queryInput,
    this.queryParams,
    this.inputAudio,
  });

  static DetectIntentRequest fromJson(Map<String, dynamic> json) =>
      DetectIntentRequest(
        queryParams: json['queryParams'] == null
            ? null
            : QueryParameters.fromJson(json['queryParams']),
        queryInput: json['queryInput'] == null
            ? null
            : QueryInput.fromJson(json['queryInput']),
        inputAudio: json['inputAudio'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'queryParams': queryParams == null ? null : queryParams.toJson(),
        'queryInput': queryInput == null ? null : queryInput.toJson(),
        'inputAudio': inputAudio
      };
}
