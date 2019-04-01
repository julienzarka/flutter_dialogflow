import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// The quick replies response message.
class QuickReplies extends Message {
  /// The title of the collection of quick replies.
  final String title;

  /// The collection of quick replies.
  final List<String> quickReplies;

  QuickReplies({
    String platform,
    this.title,
    this.quickReplies,
  }) : super(platform: platform);

  static QuickReplies fromJson(Map<String, dynamic> json) => QuickReplies(
        platform: json['platform'],
        title: json['quickReplies']['title'],
        quickReplies: json['quickReplies']['quickReplies'] == null
            ? null
            : List.from(json['quickReplies']['quickReplies']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'platform': platform,
        'quickReplies': {
          'title': title,
          'quickReplies': quickReplies,
        }
      };
}
