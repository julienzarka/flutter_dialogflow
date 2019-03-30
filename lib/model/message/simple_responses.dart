import 'package:meta/meta.dart';
import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// The collection of simple response candidates. This message in QueryResult.fulfillment_messages and WebhookResponse.fulfillment_messages should contain only one SimpleResponse.
class SimpleResponses {
  final List<SimpleResponse> simpleResponses;
  SimpleResponses({
    @required this.simpleResponses,
  });

  static SimpleResponses fromJson(Map<String, dynamic> json) => SimpleResponses(
        simpleResponses: List.from(json['simpleResponses'])
            .map((s) => SimpleResponse.fromJson(s))
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'simpleResponses': simpleResponses == null
            ? null
            : simpleResponses.map((s) => s.toJson()).toList(),
      };
}
