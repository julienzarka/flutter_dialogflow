import 'package:meta/meta.dart';
import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// The card for presenting a carousel of options to select from.
class CaruselSelect extends Message {
  /// Carousel items.
  final List<Item> items;

  CaruselSelect({
    String platform,
    @required this.items,
  }) : super(platform: platform);

  static CaruselSelect fromJson(Map<String, dynamic> json) => CaruselSelect(
        platform: json['platform'],
        items: List.from(json['caruselSelect']['items'])
            .map((i) => Item.fromJson(i))
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'platform': platform,
        'caruselSelect': {
          'items': items == null ? null : items.map((i) => i.toJson()).toList(),
        }
      };
}
