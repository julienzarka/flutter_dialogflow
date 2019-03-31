/// Represents different types of training phrases.
class Type {
  /// Not specified. This value should never be used.
  static String unspecified = 'TYPE_UNSPECIFIED';

  /// Examples do not contain @-prefixed entity type names, but example parts can be annotated with entity types.
  static String example = 'EXAMPLE';

  /// Templates are not annotated with entity types, but they can contain @-prefixed entity type names as substrings. Template mode has been deprecated. Example mode is the only supported way to create new training phrases. If you have existing training phrases that you've created in template mode, those will continue to work.
  static String template = 'TEMPLATE';
}
