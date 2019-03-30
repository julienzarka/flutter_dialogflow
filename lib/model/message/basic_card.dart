import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// The basic card message. Useful for displaying information.
class BasicCard {
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
    this.title,
    this.subtitle,
    this.formattedText,
    this.image,
    this.buttons,
  });

  static BasicCard fromJson(Map<String, dynamic> json) => BasicCard(
        title: json['title'],
        subtitle: json['subtitle'],
        formattedText: json['formattedText'],
        image: Image.fromJson(json['image']),
        buttons: List.from(json['buttons'])
            .map((b) => BasicCardButton.fromJson(b))
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'subtitle': subtitle,
        'formattedText': formattedText,
        'image': image == null ? null : image.toJson(),
        'buttons':
            buttons == null ? null : buttons.map((b) => b.toJson()).toList(),
      };
}
