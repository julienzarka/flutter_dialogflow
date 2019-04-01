import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// The basic card message. Useful for displaying information.
class BasicCard extends Message {
  /// The title of the card.
  final String title;

  /// The subtitle of the card.
  final String subtitle;

  /// Required, unless image is present. The body text of the card.
  final String formattedText;

  /// The image for the card.
  final Image image;

  /// The collection of card buttons.
  final List<BasicCardButton> buttons;

  BasicCard({
    String platform,
    this.title,
    this.subtitle,
    this.formattedText,
    this.image,
    this.buttons,
  }) : super(platform: platform);

  static BasicCard fromJson(Map<String, dynamic> json) => BasicCard(
        platform: json['platform'],
        title: json['basicCard']['title'],
        subtitle: json['basicCard']['subtitle'],
        formattedText: json['basicCard']['formattedText'],
        image: json['basicCard']['image'] == null
            ? null
            : Image.fromJson(json['basicCard']['image']),
        buttons: json['basicCard']['buttons'] == null
            ? null
            : List.from(json['basicCard']['buttons'])
                .map((b) => BasicCardButton.fromJson(b))
                .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'platform': platform,
        'basicCard': {
          'title': title,
          'subtitle': subtitle,
          'formattedText': formattedText,
          'image': image == null ? null : image.toJson(),
          'buttons':
              buttons == null ? null : buttons.map((b) => b.toJson()).toList(),
        }
      };
}
