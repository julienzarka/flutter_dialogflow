import 'package:meta/meta.dart';
import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// Represents a session entity type.
class SessionEntityType {
  ///The unique identifier of this session entity type. Format: projects/<Project ID>/agent/sessions/<Session ID>/entityTypes/<Entity Type Display Name>.
  /// <Entity Type Display Name> must be the display name of an existing entity type in the same agent that will be overridden or supplemented.
  final String name;

  /// Indicates whether the additional data should override or supplement the developer entity type definition. See [EntityOverrideMode].
  final String entityOverrideMode;

  /// The collection of entities associated with this session entity type.
  final List<Entity> entities;

  SessionEntityType({
    @required this.name,
    @required this.entityOverrideMode,
    @required this.entities,
  });

  static SessionEntityType fromJson(Map<String, dynamic> json) =>
      SessionEntityType(
        name: json['name'],
        entityOverrideMode: json['entityOverrideMode'],
        entities: json['entities'] == null
            ? null
            : List.from(json['entities'])
                .map((e) => Entity.fromJson(e))
                .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'entityOverrideMode': entityOverrideMode,
        'entities':
            entities == null ? null : entities.map((e) => e.toJson()).toList(),
      };
}
