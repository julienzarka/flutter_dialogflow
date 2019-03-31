import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

dynamic messageFromJson(Map<String, dynamic> json) {
  if (json['text'] != null) return Text.fromJson(json);
  if (json['image'] != null) return Image.fromJson(json);
  if (json['quickReplies'] != null) return QuickReplies.fromJson(json);
  if (json['card'] != null) return Card.fromJson(json);
  if (json['payload'] != null) return Payload.fromJson(json);
  if (json['simpleResponses'] != null) return SimpleResponses.fromJson(json);
  if (json['basicCard'] != null) return BasicCard.fromJson(json);
  if (json['suggestions'] != null) return Suggestions.fromJson(json);
  if (json['linkOutSuggestion'] != null)
    return LinkOutSuggestion.fromJson(json);
  if (json['listSelect'] != null) return ListSelect.fromJson(json);
  if (json['carouselSelect'] != null) return CaruselSelect.fromJson(json);
}
