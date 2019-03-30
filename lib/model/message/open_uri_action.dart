import 'package:meta/meta.dart';

/// Opens the given URI.
class OpenUriAction {
  /// The HTTP or HTTPS scheme URI.
  final String uri;

  OpenUriAction({
    @required this.uri,
  });

  static OpenUriAction fromJson(Map<String, dynamic> json) => OpenUriAction(
        uri: json['uri'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'uri': uri,
      };
}
