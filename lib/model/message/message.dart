/// Corresponds to the Response field in the Dialogflow console.
abstract class Message {
  /// The platform that this message is intended for. See [Platform].
  final String platform;

  Message({
    this.platform,
  });

  static Message fromJson(Map<String, dynamic> json) => null;

  Map<String, dynamic> toJson();
}
