/// The Status type defines a logical error model that is suitable for different programming environments, including REST APIs and RPC APIs. It is used by gRPC. The error model is designed to be:
///
/// - Simple to use and understand for most users
/// - Flexible enough to meet unexpected needs
class Status {
  /// The status code, which should be an enum value of google.rpc.Code.
  final int code;

  /// A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.
  final String message;

  ///A list of messages that carry the error details. There is a common set of message types for APIs to use.
  ///
  /// An object containing fields of an arbitrary type. An additional field "@type" contains a URI identifying the type. Example: { "id": 1234, "@type": "types.example.com/standard/id" }.
  final List<Map<String, dynamic>> details;

  Status({
    this.code,
    this.message,
    this.details,
  });

  static Status fromJson(Map<String, dynamic> json) => json == null
      ? null
      : Status(
          code: json['code'],
          message: json['message'],
          details: json['details'] == null ? null : List.from(json['details']),
        );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'message': message,
        'details': details,
      };
}
