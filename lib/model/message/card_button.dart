/// Contains information about a button.
class CardButton {
  /// The text to show on the button.
  final String text;

  /// The text to send back to the Dialogflow API or a URI to open.
  final String postback;

  CardButton({this.text, this.postback});

  static CardButton fromJson(Map<String, dynamic> json) => CardButton(
        text: json['text'],
        postback: json['postback'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'text': text,
        'postback': postback,
      };
}
