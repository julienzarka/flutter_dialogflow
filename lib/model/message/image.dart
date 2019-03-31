import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// The image response message.
class Image extends Message {
  /// The public URI to an image file.
  final String imageUri;

  /// A text description of the image to be used for accessibility, e.g., screen readers.
  final String accessibilityText;

  Image({
    String platform,
    this.imageUri,
    this.accessibilityText,
  }) : super(platform: platform);

  static Image fromJson(Map<String, dynamic> json) => Image(
        platform: json['platform'],
        imageUri: json['image']['imageUri'],
        accessibilityText: json['image']['accessibilityText'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'platform': platform,
        'image': {
          'imageUri': imageUri,
          'accessibilityText': accessibilityText,
        }
      };
}
