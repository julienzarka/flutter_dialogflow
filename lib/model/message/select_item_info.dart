import 'package:meta/meta.dart';

/// Additional info about the select item for when it is triggered in a dialog.
class SelectItemInfo {
  /// A unique key that will be sent back to the agent if this response is given.
  final String key;

  /// A list of synonyms that can also be used to trigger this item in dialog.
  final List<String> synonyms;

  SelectItemInfo({
    @required this.key,
    this.synonyms,
  });

  static SelectItemInfo fromJson(Map<String, dynamic> json) => SelectItemInfo(
        key: json['key'],
        synonyms: json['synonyms'] == null
            ? null
            : List.from(json['synonyms']).map((s) => s.toString()).toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'key': key,
        'synonyms': synonyms,
      };
}
