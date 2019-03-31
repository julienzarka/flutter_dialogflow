import 'package:meta/meta.dart';

/// Represents a context.
class Context {
  /// The unique identifier of the context. Format: projects/<Project ID>/agent/sessions/<Session ID>/contexts/<Context ID>.
  /// The Context ID is always converted to lowercase, may only contain characters in [a-zA-Z0-9_-%] and may be at most 250 bytes long.
  final String name;

  /// The number of conversational query requests after which the context expires. If set to 0 (the default) the context expires immediately. Contexts expire automatically after 20 minutes if there are no matching queries.
  final int lifespanCount;

  /// The collection of parameters associated with this context. Refer to [this doc](https://cloud.google.com/dialogflow-enterprise/docs/intents-actions-parameters) for syntax.
  final Map<String, dynamic> parameters;

  Context({
    @required this.name,
    this.lifespanCount,
    this.parameters,
  });

  static Context fromJson(Map<String, dynamic> json) => Context(
        name: json['name'],
        lifespanCount: json['lifespanCount'],
        parameters: json['parameters'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'lifespanCount': lifespanCount,
        'parameters': parameters,
      };
}
