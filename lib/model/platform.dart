/// Represents different platforms that a rich message can be intended for.
class Platform {
  ///Not specified.
  static String unspecified = 'PLATFORM_UNSPECIFIED';

  /// Facebook.
  static String facebook = 'FACEBOOK';

  /// Slack.
  static String slack = 'SLACK';

  /// Telegram.
  static String telegram = 'TELEGRAM';

  /// Kik.
  static String kik = 'KIK';

  /// Skype.
  static String skype = 'SKYPE';

  /// Line.
  static String line = 'LINE';

  /// Viber.
  static String viber = 'VIBER';

  /// Actions on Google. When using Actions on Google, you can choose one of the specific Intent.Message types that mention support for Actions on Google, or you can use the advanced Intent.Message.payload field. The payload field provides access to AoG features not available in the specific message types. If using the Intent.Message.payload field, it should have a structure similar to the JSON message shown here. For more information, see [Actions on Google Webhook Format](https://developers.google.com/actions/build/json/dialogflow-webhook-json)
  static String actionsOnGoogle = 'ACTIONS_ON_GOOGLE';
}
