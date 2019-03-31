/// Represents a single followup intent in the chain.
class FollowupIntentInfo {
  /// The unique identifier of the followup intent. Format: projects/<Project ID>/agent/intents/<Intent ID>.
  final String followupIntentName;

  /// The unique identifier of the followup intent's parent. Format: projects/<Project ID>/agent/intents/<Intent ID>.
  final String parentFollowupIntentName;

  FollowupIntentInfo({
    this.followupIntentName,
    this.parentFollowupIntentName,
  });

  static FollowupIntentInfo fromJson(Map<String, dynamic> json) =>
      FollowupIntentInfo(
        followupIntentName: json['followupIntentName'],
        parentFollowupIntentName: json['parentFollowupIntentName'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'followupIntentName': followupIntentName,
        'parentFollowupIntentName': parentFollowupIntentName,
      };
}
