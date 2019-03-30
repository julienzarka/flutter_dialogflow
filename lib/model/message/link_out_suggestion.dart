import 'package:meta/meta.dart';

/// The suggestion chip message that allows the user to jump out to the app or website associated with this agent.
class LinkOutSuggestion {
  /// The name of the app or site this chip is linking to.
  final String destinationName;

  /// The URI of the app or site to open when the user taps the suggestion chip.
  final String uri;

  LinkOutSuggestion({
    @required this.destinationName,
    @required this.uri,
  });

  static LinkOutSuggestion fromJson(Map<String, dynamic> json) =>
      LinkOutSuggestion(
        destinationName: json['destinationName'],
        uri: json['uri'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'destinationName': destinationName,
        'uri': uri,
      };
}
