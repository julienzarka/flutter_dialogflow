/// An object representing a latitude/longitude pair. This is expressed as a pair of doubles representing degrees latitude and degrees longitude. Unless specified otherwise, this must conform to the WGS84 standard. Values must be within normalized ranges.
class LatLng {
  /// The latitude in degrees. It must be in the range [-90.0, +90.0].
  final num latitude;

  /// The longitude in degrees. It must be in the range [-180.0, +180.0].
  final num longitude;

  LatLng({this.latitude, this.longitude}) {
    assert(this.latitude >= -90.0 && this.latitude <= 90.0,
        'Latitude must be in the range [-90.0, +90.0]');
    assert(this.longitude >= -180.0 && this.longitude <= 180.0,
        'Longitude must be in the range [-180.0, +180.0]');
  }

  static LatLng fromJson(Map<String, dynamic> json) => LatLng(
        latitude: json['latitude'],
        longitude: json['longitude'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'latitude': latitude,
        'longitude': longitude,
      };
}
