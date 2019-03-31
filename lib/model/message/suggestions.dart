import 'package:meta/meta.dart';
import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// The collection of suggestions.
class Suggestions extends Message {
  /// The list of suggested replies.
  final List<Suggestion> suggestions;

  Suggestions({
    String platform,
    @required this.suggestions,
  }) : super(platform: platform);

  static Suggestions fromJson(Map<String, dynamic> json) => Suggestions(
        platform: json['platform'],
        suggestions: List.from(json['suggestions']['suggestions'])
            .map((s) => Suggestion.fromJson(s))
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'platform': platform,
        'suggestions': {
          'suggestions': suggestions == null
              ? null
              : suggestions.map((s) => s.toJson()).toList(),
        }
      };
}
