import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// The card response message.
class Card {
  /// The title of the card.
  final String title;

  /// The subtitle of the card.
  final String subtitle;

  /// The public URI to an image file for the card.
  final String imageUri;

  /// The collection of card buttons.
  final List<CardButton> buttons;

  Card({
    this.title,
    this.subtitle,
    this.imageUri,
    this.buttons,
  });

  static Card fromJson(Map<String, dynamic> json) => Card(
        title: json['title'],
        subtitle: json['subtitle'],
        imageUri: json['imageUri'],
        buttons: List.from(json['buttons'])
            .map((b) => CardButton.fromJson(b))
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'subtitle': subtitle,
        'imageUri': imageUri,
        'buttons':
            buttons == null ? null : buttons.map((b) => b.toJson()).toList(),
      };
}
