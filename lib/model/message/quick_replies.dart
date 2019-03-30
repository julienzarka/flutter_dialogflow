/// The quick replies response message.
class QuickReplies {
  /// The title of the collection of quick replies.
  final String title;

  /// The collection of quick replies.
  final List<String> quickReplies;

  QuickReplies({
    this.title,
    this.quickReplies,
  });

  static QuickReplies fromJson(Map<String, dynamic> json) => QuickReplies(
        title: json['title'],
        quickReplies: List.from(json['quickReplies']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'quickReplies': quickReplies,
      };
}
