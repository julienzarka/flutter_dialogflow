import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// If successful, the response body contains data with this structure.
class DetectIntentResponse {
  /// The unique identifier of the response. It can be used to locate a response in the training example set or for reporting issues.
  final String responseId;

  /// The selected results of the conversational query or event processing. See alternativeQueryResults for additional potential results.
  final QueryResult queryResult;

  /// Specifies the status of the webhook request.
  final Status webhookStatus;

  DetectIntentResponse({
    this.responseId,
    this.queryResult,
    this.webhookStatus,
  });

  static DetectIntentResponse fromJson(Map<String, dynamic> json) =>
      DetectIntentResponse(
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
