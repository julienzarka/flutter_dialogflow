import 'package:meta/meta.dart';
import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// Represents an example that the agent is trained on.
class TrainingPhrase {
  /// Output only. The unique identifier of this training phrase.
  final String name;

  /// The type of the training phrase.
  final String type;

  /// The ordered list of training phrase parts. The parts are concatenated in order to form the training phrase.
  ///
  /// Note: The API does not automatically annotate training phrases like the Dialogflow Console does.
  ///
  /// Note: Do not forget to include whitespace at part boundaries, so the training phrase is well formatted when the parts are concatenated.
  ///
  /// If the training phrase does not need to be annotated with parameters, you just need a single part with only the Part.text field set.
  ///
  /// If you want to annotate the training phrase, you must create multiple parts, where the fields of each part are populated in one of two ways:
  ///
  /// - [Part.text] is set to a part of the phrase that has no parameters.
  /// - [Part.text] is set to a part of the phrase that you want to annotate, and the entityType, alias, and userDefined fields are all set.
  final List<Part> parts;

  /// Indicates how many times this example was added to the intent. Each time a developer adds an existing sample by editing an intent or training, this counter is increased.
  final int timesAddedCount;

  TrainingPhrase({
    this.name,
    @required this.type,
    @required this.parts,
    this.timesAddedCount,
  });

  static TrainingPhrase fromJson(Map<String, dynamic> json) => TrainingPhrase(
        name: json['name'],
        type: json['type'],
        parts: json['parts'] == null
            ? null
            : List.from(json['parts']).map((p) => Part.fromJson(p)).toList(),
        timesAddedCount: json['timesAddedCount'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'type': type,
        'parts': parts == null ? null : parts.map((p) => p.toJson()).toList(),
        'timesAddedCount': timesAddedCount,
      };
}
