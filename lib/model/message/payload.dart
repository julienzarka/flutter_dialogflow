import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// A custom, platform-specific payload.
class Payload extends Message {
  /// The custom payload.
  final Map<String, dynamic> payload;

  Payload({
    String platform,
    this.payload,
  }) : super(platform: platform);

  static Payload fromJson(Map<String, dynamic> json) => Payload(
        platform: json['platform'],
        payload: json['payload'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'platform': platform,
        'payload': payload,
      };
}
