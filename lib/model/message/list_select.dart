import 'package:meta/meta.dart';
import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// The card for presenting a list of options to select from.
class ListSelect extends Message {
  /// The overall title of the list.
  final String title;

  /// List items.
  final List<Item> items;

  ListSelect({
    String platform,
    this.title,
    @required this.items,
  }) : super(platform: platform);

  static ListSelect fromJson(Map<String, dynamic> json) => ListSelect(
        platform: json['platform'],
        title: json['listSelect']['title'],
        items: json['listSelect']['items'] == null
            ? null
            : List.from(json['listSelect']['items'])
                .map((i) => Item.fromJson(i))
                .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'platform': platform,
        'listSelect': {
          'title': title,
          'items': items == null ? null : items.map((i) => i.toJson()).toList(),
        },
      };
}
