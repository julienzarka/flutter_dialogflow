import 'package:meta/meta.dart';
import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// The button object that appears at the bottom of a card.
class BasicCardButton {
  /// The title of the button.
  final String title;

  /// Action to take when a user taps on the button.
  final OpenUriAction openUriAction;

  BasicCardButton({
    @required this.title,
    @required this.openUriAction,
  });

  static BasicCardButton fromJson(Map<String, dynamic> json) => BasicCardButton(
        title: json['title'],
        openUriAction: json['openUriAction'] == null
            ? null
            : OpenUriAction.fromJson(json['openUriAction']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'openUriAction': openUriAction == null ? null : openUriAction.toJson(),
      };
}
