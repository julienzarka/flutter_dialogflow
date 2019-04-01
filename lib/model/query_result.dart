import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// Represents the result of conversational query or event processing.
class QueryResult {
  /// The original conversational query text: - If natural language text was provided as input, queryText contains a copy of the input. - If natural language speech audio was provided as input, queryText contains the speech recognition result. If speech recognizer produced multiple alternatives, a particular one is picked. - If an event was provided as input, queryText is not set.
  final String queryText;

  /// The language that was triggered during intent detection. See Language Support for a list of the currently supported language codes.
  final String languageCode;

  /// The Speech recognition confidence between 0.0 and 1.0. A higher number indicates an estimated greater likelihood that the recognized words are correct. The default of 0.0 is a sentinel value indicating that confidence was not set.
  ///
  /// This field is not guaranteed to be accurate or set. In particular this field isn't set for StreamingDetectIntent since the streaming endpoint has separate confidence estimates per portion of the audio in StreamingRecognitionResult.
  final double speechRecognitionConfidence;

  /// The action name from the matched intent.
  final String action;

  /// The collection of extracted parameters.
  final Map<String, dynamic> parameters; // TODO struct

  /// This field is set to: - false if the matched intent has required parameters and not all of the required parameter values have been collected. - true if all required parameter values have been collected, or if the matched intent doesn't contain any required parameters.
  final bool allRequiredParamsPresent;

  /// The text to be pronounced to the user or shown on the screen. Note: This is a legacy field, fulfillmentMessages should be preferred.
  final String fulfillmentText;

  /// The collection of rich messages to present to the user.
  final List<Message> fulfillmentMessages;

  /// If the query was fulfilled by a webhook call, this field is set to the value of the source field returned in the webhook response.
  final String webhookSource;

  /// If the query was fulfilled by a webhook call, this field is set to the value of the payload field returned in the webhook response.
  final Map<String, dynamic> webhookPayload; // TODO struct

  /// The collection of output contexts. If applicable, outputContexts.parameters contains entries with name <parameter name>.original containing the original parameter values before the query.
  final List<Context> outputContexts;

  /// The intent that matched the conversational query. Some, not all fields are filled in this message, including but not limited to: name, displayName and webhookState.
  final Intent intent;

  /// The intent detection confidence. Values range from 0.0 (completely uncertain) to 1.0 (completely certain). If there are multiple knowledgeAnswers messages, this value is set to the greatest knowledgeAnswers.match_confidence value in the list.
  final num intentDetectionConfidence;

  /// The free-form diagnostic info. For example, this field could contain webhook call latency. The string keys of the Struct's fields map can change without notice.
  final Map<String, dynamic> diagnosticInfo; // TODO struct

  QueryResult({
    this.queryText,
    this.languageCode,
    this.speechRecognitionConfidence,
    this.action,
    this.parameters,
    this.allRequiredParamsPresent,
    this.fulfillmentText,
    this.fulfillmentMessages,
    this.webhookSource,
    this.webhookPayload,
    this.outputContexts,
    this.intent,
    this.intentDetectionConfidence,
    this.diagnosticInfo,
  });

  static QueryResult fromJson(Map<String, dynamic> json) => QueryResult(
        queryText: json['queryText'],
        languageCode: json['languageCode'],
        speechRecognitionConfidence: json['speechRecognitionConfidence'],
        action: json['action'],
        parameters: json['parameters'],
        allRequiredParamsPresent: json['allRequiredParamsPresent'],
        fulfillmentText: json['fulfillmentText'],
        fulfillmentMessages: json['fulfillmentMessages'] == null
            ? null
            : List.from(json['fulfillmentMessages'])
                .map((m) => messageFromJson(m))
                .toList(),
        webhookSource: json['webhookSource'],
        webhookPayload: json['webhookPayload'],
        outputContexts: json['outputContexts'] == null
            ? null
            : List.from(json['outputContexts'])
                .map((c) => Context.fromJson(c))
                .toList(),
        intent: json['intent'] == null ? null : Intent.fromJson(json['intent']),
        intentDetectionConfidence: json['intentDetectionConfidence'],
        diagnosticInfo: json['diagnosticInfo'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'queryText': queryText,
        'languageCode': languageCode,
        'speechRecognitionConfidence': speechRecognitionConfidence,
        'action': action,
        'parameters': parameters,
        'allRequiredParamsPresent': allRequiredParamsPresent,
        'fulfillmentText': fulfillmentText,
        'fulfillmentMessages': fulfillmentMessages == null
            ? null
            : fulfillmentMessages.map((m) => m.toJson()).toList(),
        'webhookSource': webhookSource,
        'webhookPayload': webhookPayload,
        'outputContexts': outputContexts == null
            ? null
            : outputContexts.map((c) => c.toJson()).toList(),
        'intent': intent == null ? null : intent.toJson(),
        'intentDetectionConfidence': intentDetectionConfidence,
        'diagnosticInfo': diagnosticInfo,
      };
}
