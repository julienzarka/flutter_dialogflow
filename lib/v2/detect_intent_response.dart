import 'package:meta/meta.dart';
import 'package:flutter_dialogflow_v2/v2/detect_intent_request.dart';

/// If successful, the response body contains data with this structure.
class DetectIntentRequest {
  /// The unique identifier of the response. It can be used to locate a response in the training example set or for reporting issues.
  final String responseId;

  /// The selected results of the conversational query or event processing. See alternativeQueryResults for additional potential results.
  final QueryResult queryResult;

  /// Specifies the status of the webhook request.
  final Status webhookStatus;

  DetectIntentRequest({
    this.responseId,
    this.queryResult,
    this.webhookStatus,
  });

  static DetectIntentRequest fromJson(Map<String, dynamic> json) =>
      DetectIntentRequest(
        queryResult: QueryResult.fromJson(json['queryResult']),
        responseId: json['responseId'],
        webhookStatus: Status.fromJson(json['webhookStatus']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'responseId': responseId,
        'queryResult': queryResult == null ? null : queryResult.toJson(),
        'webhookStatus': webhookStatus == null ? null : webhookStatus.toJson(),
      };
}

/// The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. The error model is designed to be:
///
/// - Simple to use and understand for most users
/// - Flexible enough to meet unexpected needs
class Status {
  /// The status code, which should be an enum value of google.rpc.Code.
  final int code;

  /// A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.
  final String message;

  ///A list of messages that carry the error details. There is a common set of message types for APIs to use.
  ///
  /// An object containing fields of an arbitrary type. An additional field "@type" contains a URI identifying the type. Example: { "id": 1234, "@type": "types.example.com/standard/id" }.
  final List<Map<String, dynamic>> details;

  Status({
    this.code,
    this.message,
    this.details,
  });

  static Status fromJson(Map<String, dynamic> json) => Status(
        code: json['code'],
        message: json['message'],
        details: List.from(json['details']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'message': message,
        'details': details,
      };
}

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
  final double intentDetectionConfidence;

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
        fulfillmentMessages: List.from(json['fulfillmentMessages'])
            .map((m) => Message.fromJson(m))
            .toList(),
        webhookSource: json['webhookSource'],
        webhookPayload: json['webhookPayload'],
        outputContexts: List.from(json['outputContexts'])
            .map((c) => Context.fromJson(c))
            .toList(),
        intent: Intent.fromJson(json['intent']),
        intentDetectionConfidence: json['intentDetectionConfidence'],
        diagnosticInfo: json['intentDetectionConfidence'],
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

/// Represents an intent. Intents convert a number of user expressions or patterns into an action. An action is an extraction of a user command or sentence semantics.
class Intent {
  /// The unique identifier of this intent. Required for Intents.UpdateIntent and Intents.BatchUpdateIntents methods. Format: projects/<Project ID>/agent/intents/<Intent ID>.
  final String name;

  /// The name of this intent.
  final String displayName;

  /// Indicates whether webhooks are enabled for the intent.
  final String webhookState; // TODO enum

  /// The priority of this intent. Higher numbers represent higher priorities. If this is zero or unspecified, we use the default priority 500000.
  final int priority;

  /// Indicates whether this is a fallback intent.
  final bool isFallback;

  /// Indicates whether Machine Learning is disabled for the intent. Note: If ml_diabled setting is set to true, then this intent is not taken into account during inference in ML ONLY match mode. Also, auto-markup in the UI is turned off.
  final bool mlDisabled;

  /// The list of context names required for this intent to be triggered. Format: projects/<Project ID>/agent/sessions/-/contexts/<Context ID>.
  final List<String> inputContextNames;

  /// The collection of event names that trigger the intent. If the collection of input contexts is not empty, all of the contexts must be present in the active user session for an event to trigger this intent.
  final List<String> events;

  /// The collection of examples that the agent is trained on.
  final List<TrainingPhrase> trainingPhrases;

  /// The name of the action associated with the intent. Note: The action name must not contain whitespaces.
  final String action;

  /// The collection of contexts that are activated when the intent is matched. Context messages in this collection should not set the parameters field. Setting the lifespanCount to 0 will reset the context when the intent is matched. Format: projects/<Project ID>/agent/sessions/-/contexts/<Context ID>.
  final List<Context> outputContexts;

  /// Indicates whether to delete all contexts in the current session when this intent is matched.
  final bool resetContexts;

  /// The collection of parameters associated with the intent.
  final List<Parameter> parameters;

  /// The collection of rich messages corresponding to the Response field in the Dialogflow console.
  final List<Message> messages;

  /// The list of platforms for which the first response will be taken from among the messages assigned to the DEFAULT_PLATFORM.
  final String defaultResponsePlatforms; // TODO enum

  /// Read-only. The unique identifier of the root intent in the chain of followup intents. It identifies the correct followup intents chain for this intent. We populate this field only in the output.
  ///
  /// Format: projects/<Project ID>/agent/intents/<Intent ID>.
  final String rootFollowupIntentName;

  /// Read-only after creation. The unique identifier of the parent intent in the chain of followup intents. You can set this field when creating an intent, for example with [intents.create][] or [intents.batchUpdate][], in order to make this intent a followup intent.
  ///
  /// It identifies the parent followup intent. Format: projects/<Project ID>/agent/intents/<Intent ID>.
  final String parentFollowupIntentName;

  /// Read-only. Information about all followup intents that have this intent as a direct or indirect parent. We populate this field only in the output.
  final List<FollowupIntentInfo> followupIntentInfo;

  Intent({
    this.name,
    @required this.displayName,
    this.webhookState,
    this.priority,
    this.isFallback,
    this.mlDisabled,
    this.inputContextNames,
    this.events,
    this.trainingPhrases,
    this.action,
    this.outputContexts,
    this.resetContexts,
    this.parameters,
    this.messages,
    this.defaultResponsePlatforms,
    this.rootFollowupIntentName,
    this.parentFollowupIntentName,
    this.followupIntentInfo,
  });
}
