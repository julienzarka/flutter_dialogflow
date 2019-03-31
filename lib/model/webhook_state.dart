/// Represents the different states that webhooks can be in.
class WebhookState {
  /// Webhook is disabled in the agent and in the intent.
  static String unspecified = 'WEBHOOK_STATE_UNSPECIFIED';

  /// Webhook is enabled in the agent and in the intent.
  static String enabled = 'WEBHOOK_STATE_ENABLED';

  /// Webhook is enabled in the agent and in the intent. Also, each slot filling prompt is forwarded to the webhook.
  static String enabledForSlotFilling =
      'WEBHOOK_STATE_ENABLED_FOR_SLOT_FILLING';
}
