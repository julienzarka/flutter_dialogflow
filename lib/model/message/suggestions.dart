import 'package:meta/meta.dart';
import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// The collection of suggestions.
class Suggestions {
  /// The list of suggested replies.
  final List<Suggestion> suggestions;

  Suggestions({
    @required this.suggestions,
  });

  static Suggestions fromJson(Map<String, dynamic> json) => Suggestions(
        suggestions: List.from(json['suggestions'])
            .map((s) => Suggestion.fromJson(s))
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'suggestions': suggestions == null
            ? null
            : suggestions.map((s) => s.toJson()).toList(),
      };
}
