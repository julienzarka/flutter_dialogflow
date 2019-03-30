/// The image response message.
class Image {
  /// The public URI to an image file.
  final String imageUri;

  /// A text description of the image to be used for accessibility, e.g., screen readers.
  final String accessibilityText;

  Image({
    this.imageUri,
    this.accessibilityText,
  });

  static Image fromJson(Map<String, dynamic> json) => Image(
        imageUri: json['imageUri'],
        accessibilityText: json['accessibilityText'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'imageUri': imageUri,
        'accessibilityText': accessibilityText,
      };
}
