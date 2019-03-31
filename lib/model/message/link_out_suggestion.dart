import 'package:meta/meta.dart';
import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// The suggestion chip message that allows the user to jump out to the app or website associated with this agent.
class LinkOutSuggestion extends Message {
  /// The name of the app or site this chip is linking to.
  final String destinationName;

  /// The URI of the app or site to open when the user taps the suggestion chip.
  final String uri;

  LinkOutSuggestion({
    String platform,
    @required this.destinationName,
    @required this.uri,
  }) : super(platform: platform);

  static LinkOutSuggestion fromJson(Map<String, dynamic> json) =>
      LinkOutSuggestion(
        platform: json['platform'],
        destinationName: json['linkOutSuggestion']['destinationName'],
        uri: json['linkOutSuggestion']['uri'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'platform': platform,
        'linkOutSuggestion': {
          'destinationName': destinationName,
          'uri': uri,
        }
      };
}
