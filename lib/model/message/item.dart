import 'package:meta/meta.dart';
import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// An item in the list or carusel
class Item {
  /// Additional information about this option.
  final SelectItemInfo info;

  /// The title of the list item.
  final String title;

  /// The main text describing the item.
  final String description;

  /// The image to display.
  final Image image;

  Item({
    @required this.info,
    @required this.title,
    this.description,
    this.image,
  });

  static Item fromJson(Map<String, dynamic> json) => Item(
        info: SelectItemInfo.fromJson(json['info']),
        title: json['title'],
        description: json['description'],
        image: Image.fromJson(json['image']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'info': info == null ? null : info.toJson(),
        'title': title,
        'description': description,
        'image': image == null ? null : image.toJson(),
      };
}
