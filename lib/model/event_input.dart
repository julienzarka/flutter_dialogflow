import 'package:meta/meta.dart';

/// Events allow for matching intents by event name instead of the natural language input. For instance, input <event: { name: "welcome_event", parameters: { name: "Sam" } }> can trigger a personalized welcome response. The parameter name may be used by the agent in the response: "Hello #welcome_event.name! What can I do for you today?".
class EventInput {
  /// The unique identifier of the event.
  final String name;

  ///  The collection of parameters associated with the event.
  final Map<String, dynamic> parameters;

  /// The language of this query. See (Language Support)[https://cloud.google.com/dialogflow-enterprise/docs/reference/language] for a list of the currently supported language codes. Note that queries in the same session do not necessarily need to specify the same language
  final String languageCode;

  EventInput({
    @required this.name,
    @required this.languageCode,
    this.parameters,
  });

  static EventInput fromJson(Map<String, dynamic> json) => EventInput(
        name: json['name'],
        parameters: json['parameters'],
        languageCode: json['languageCode'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'parameters': parameters,
        'languageCode': languageCode,
      };
}
