import 'package:meta/meta.dart';

/// Represents a part of a training phrase.
class Part {
  /// The text for this part.
  final String text;

  /// The entity type name prefixed with @. This field is required for annotated parts of the training phrase.
  final String entityType;

  /// The parameter name for the value extracted from the annotated part of the example. This field is required for annotated parts of the training phrase.
  final String alias;

  /// Indicates whether the text was manually annotated. This field is set to true when the Dialogflow Console is used to manually annotate the part. When creating an annotated part with the API, you must set this to true.
  final bool userDefined;

  Part({
    @required this.text,
    this.entityType,
    this.alias,
    this.userDefined,
  });

  static Part fromJson(Map<String, dynamic> json) => Part(
        text: json['text'],
        entityType: json['entityType'],
        alias: json['alias'],
        userDefined: json['userDefined'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'text': text,
        'entityType': entityType,
        'alias': alias,
        'userDefined': userDefined,
      };
}
