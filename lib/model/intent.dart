import 'package:meta/meta.dart';
import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// Represents an intent. Intents convert a number of user expressions or patterns into an action. An action is an extraction of a user command or sentence semantics.
class Intent {
  /// The unique identifier of this intent. Required for Intents.UpdateIntent and Intents.BatchUpdateIntents methods. Format: projects/<Project ID>/agent/intents/<Intent ID>.
  final String name;

  /// The name of this intent.
  final String displayName;

  /// Indicates whether webhooks are enabled for the intent.
  final String webhookState;

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

  /// The list of platforms for which the first response will be taken from among the messages assigned to the DEFAULT_PLATFORM. See [Platform].
  final String defaultResponsePlatforms;

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

  static Intent fromJson(Map<String, dynamic> json) => Intent(
        name: json['name'],
        displayName: json['displayName'],
        webhookState: json['webhookState'],
        priority: json['priority'],
        isFallback: json['isFallback'],
        mlDisabled: json['mlDisabled'],
        inputContextNames: json['inputContextNames'] == null
            ? null
            : List.from(json['inputContextNames']),
        events: json['events'] == null ? null : List.from(json['events']),
        trainingPhrases: json['trainingPhrases'] == null
            ? null
            : List.from(json['trainingPhrases'])
                .map((t) => TrainingPhrase.fromJson(t))
                .toList(),
        action: json['action'],
        outputContexts: json['outputContexts'] == null
            ? null
            : List.from(json['outputContexts'])
                .map((c) => Context.fromJson(c))
                .toList(),
        resetContexts: json['resetContexts'],
        parameters: json['parameters'] == null
            ? null
            : List.from(json['parameters'])
                .map((p) => Parameter.fromJson(p))
                .toList(),
        messages: json['messages'] == null
            ? null
            : List.from(json['messages'])
                .map((m) => messageFromJson(m))
                .toList(),
        defaultResponsePlatforms: json['defaultResponsePlatforms'],
        rootFollowupIntentName: json['rootFollowupIntentName'],
        parentFollowupIntentName: json['parentFollowupIntentName'],
        followupIntentInfo: json['followupIntentInfo'] == null
            ? null
            : List.from(json['followupIntentInfo'])
                .map((f) => FollowupIntentInfo.fromJson(f))
                .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'displayName': displayName,
        'webhookState': webhookState,
        'priority': priority,
        'isFallback': isFallback,
        'mlDisabled': mlDisabled,
        'inputContextNames': inputContextNames,
        'events': events,
        'trainingPhrases': trainingPhrases == null
            ? null
            : trainingPhrases.map((t) => t.toJson()).toList(),
        'action': action,
        'outputContexts': outputContexts == null
            ? null
            : outputContexts.map((c) => c.toJson()).toList(),
        'resetContexts': resetContexts,
        'parameters': parameters == null
            ? null
            : parameters.map((p) => p.toJson()).toList(),
        'messages':
            messages == null ? null : messages.map((m) => m.toJson()).toList(),
        'defaultResponsePlatforms': defaultResponsePlatforms,
        'rootFollowupIntentName': rootFollowupIntentName,
        'parentFollowupIntentName': parameters,
        'followupIntentInfo': followupIntentInfo == null
            ? null
            : followupIntentInfo.map((f) => f.toJson()).toList(),
      };
}
