import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// The card response message.
class Card extends Message {
  /// The title of the card.
  final String title;

  /// The subtitle of the card.
  final String subtitle;

  /// The public URI to an image file for the card.
  final String imageUri;

  /// The collection of card buttons.
  final List<CardButton> buttons;

  Card({
    String platform,
    this.title,
    this.subtitle,
    this.imageUri,
    this.buttons,
  }) : super(platform: platform);

  static Card fromJson(Map<String, dynamic> json) => Card(
        platform: json['platform'],
        title: json['card']['title'],
        subtitle: json['card']['subtitle'],
        imageUri: json['card']['imageUri'],
        buttons: List.from(json['card']['buttons'])
            .map((b) => CardButton.fromJson(b))
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'platform': platform,
        'card': {
          'title': title,
          'subtitle': subtitle,
          'imageUri': imageUri,
          'buttons':
              buttons == null ? null : buttons.map((b) => b.toJson()).toList(),
        }
      };
}
