// The types of modifications for a session entity type.
class EntityOverrideMode {
  /// Not specified. This value should be never used.
  static String unspecified = 'ENTITY_OVERRIDE_MODE_UNSPECIFIED';

  /// The collection of session entities overrides the collection of entities in the corresponding developer entity type.
  static String override = 'ENTITY_OVERRIDE_MODE_OVERRIDE';

  /// The collection of session entities extends the collection of entities in the corresponding developer entity type.
  static String supplement = 'ENTITY_OVERRIDE_MODE_SUPPLEMENT';
}
