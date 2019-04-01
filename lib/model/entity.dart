import 'package:meta/meta.dart';

/// An entity entry for an associated entity type.
class Entity {
  /// The primary value associated with this entity entry. For example, if the entity type is vegetable, the value could be scallions.
  ///
  /// For KIND_MAP entity types:
  /// - A canonical value to be used in place of synonyms.
  ///
  /// For KIND_LIST entity types:
  /// - A string that can contain references to other entity types (with or without aliases).
  final String value;

  /// A collection of value synonyms. For example, if the entity type is vegetable, and value is scallions, a synonym could be green onions.
  ///
  /// For KIND_LIST entity types:
  /// - This collection must contain exactly one synonym equal to value.
  final List<String> synonyms;

  Entity({
    @required this.value,
    @required this.synonyms,
  });

  static Entity fromJson(Map<String, dynamic> json) => Entity(
        value: json['value'],
        synonyms: json['synonyms'] == null ? null : List.from(json['synonyms']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'value': value,
        'synonyms': synonyms,
      };
}
