import 'package:meta/meta.dart';

/// Represents intent parameters.
class Parameter {
  /// The unique identifier of this parameter.
  final String name;

  /// The name of the parameter.
  final String displayName;

  /// The definition of the parameter value. It can be: - a constant string, - a parameter value defined as $parameterName, - an original parameter value defined as $parameterName.original, - a parameter value from some context defined as #contextName.parameter_name.
  final String value;

  /// The default value to use when the value yields an empty result. Default values can be extracted from contexts by using the following syntax: #contextName.parameter_name.
  final String defaultValue;

  /// The name of the entity type, prefixed with @, that describes values of the parameter. If the parameter is required, this must be provided.
  final String entityTypeDisplayName;

  /// Indicates whether the parameter is required. That is, whether the intent cannot be completed without collecting the parameter value.
  final bool mandatory;

  /// The collection of prompts that the agent can present to the user in order to collect value for the parameter.
  final List<String> prompts;

  /// Indicates whether the parameter represents a list of values.
  final bool isList;

  Parameter({
    this.name,
    @required this.displayName,
    this.value,
    this.defaultValue,
    this.entityTypeDisplayName,
    this.mandatory,
    this.prompts,
    this.isList,
  });

  static Parameter fromJson(Map<String, dynamic> json) => Parameter(
        name: json['name'],
        displayName: json['displayName'],
        value: json['value'],
        defaultValue: json['defaultValue'],
        entityTypeDisplayName: json['entityTypeDisplayName'],
        mandatory: json['mandatory'],
        prompts: json['prompts'] == null ? null : List.from(json['prompts']),
        isList: json['isList'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'displayName': displayName,
        'value': value,
        'defaultValue': defaultValue,
        'entityTypeDisplayName': entityTypeDisplayName,
        'mandatory': mandatory,
        'prompts': prompts,
        'isList': isList,
      };
}
