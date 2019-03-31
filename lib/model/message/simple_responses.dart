import 'package:meta/meta.dart';
import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// The collection of simple response candidates. This message in QueryResult.fulfillment_messages and WebhookResponse.fulfillment_messages should contain only one SimpleResponse.
class SimpleResponses extends Message {
  /// The list of simple responses.
  final List<SimpleResponse> simpleResponses;

  SimpleResponses({
    String platform,
    @required this.simpleResponses,
  }) : super(platform: platform);

  static SimpleResponses fromJson(Map<String, dynamic> json) => SimpleResponses(
        platform: json['platform'],
        simpleResponses: List.from(json['simpleResponses']['simpleResponses'])
            .map((s) => SimpleResponse.fromJson(s))
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'platform': platform,
        'simpleResponses': {
          'simpleResponses': simpleResponses == null
              ? null
              : simpleResponses.map((s) => s.toJson()).toList(),
        }
      };
}
