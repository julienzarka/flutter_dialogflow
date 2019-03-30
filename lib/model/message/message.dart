import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';

/// Corresponds to the Response field in the Dialogflow console.
class Message {
  /// The platform that this message is intended for. See [Platform].
  final String platform; // TODO

  // String _type;

  // get type {
  //   switch (_type) {
  //     case 'text':
  //       return Text;
  //     case 'image':
  //       return Image;
  //     case 'quickReplies':
  //       return QuickReplies;
  //     case 'card':
  //       return Card;
  //     case 'map':
  //       return Map;
  //     case 'simpleResponses':
  //       return SimpleResponses;
  //     case 'basicCard':
  //       return BasicCard;
  //     case 'suggestions':
  //       return Suggestions;
  //     case 'linkOutSuggestion':
  //       return LinkOutSuggestion;
  //     case 'listSelect':
  //       return ListSelect;
  //     case 'carouselSelect':
  //       return CarouselSelect;
  //     default:
  //       throw TypeError();
  //   }
  // }

  /// The text response.
  Text _text;

  /// The image response.
  Image _image;

  /// The quick replies response.
  QuickReplies _quickReplies;

  /// The card response.
  Card _card;

  /// Returns a response containing a custom, platform-specific payload. See the Intent.Message.Platform type for a description of the structure that may be required for your platform.
  Map<String, dynamic> _payload; // TODO struct

  /// The voice and text-only responses for Actions on Google.
  SimpleResponses _simpleResponses;

  /// The basic card response for Actions on Google.
  BasicCard _basicCard;

  /// The suggestion chips for Actions on Google.
  Suggestions _suggestions;

  /// The link out suggestion chip for Actions on Google.
  LinkOutSuggestion _linkOutSuggestion;

  /// The list card response for Actions on Google.
  ListSelect _listSelect;

  /// The carousel card response for Actions on Google.
  CarouselSelect _carouselSelect;

  Message({
    this.platform,
    Text text,
    Image image,
    QuickReplies quickReplies,
    Card card,
    Map payload,
    SimpleResponses simpleResponses,
    BasicCard basicCard,
    Suggestions suggestions,
    LinkOutSuggestion linkOutSuggestion,
    ListSelect listSelect,
    CarouselSelect carouselSelect,
  }) {
    this._text = text;
    this._image = image;
    this._quickReplies = quickReplies;
    this._card = card;
    this._payload = payload;
    this._simpleResponses = simpleResponses;
    this._basicCard = basicCard;
    this._suggestions = suggestions;
    this._linkOutSuggestion = linkOutSuggestion;
    this._listSelect = listSelect;
    this._carouselSelect = carouselSelect;
  }

  static Message fromJson(Map<String, dynamic> json) => Message(); // TODO

  Map<String, dynamic> toJson() => <String, dynamic>{
        'platform': platform,
        'text': _text == null ? null : _text.toJson(),
        'image': _image == null ? null : _image.toJson(),
        'quickReplies': _quickReplies == null ? null : _quickReplies.toJson(),
        'card': _card == null ? null : _card.toJson(),
        'payload': _payload,
        'simpleResponses':
            _simpleResponses == null ? null : _simpleResponses.toJson(),
        'basicCard': _basicCard == null ? null : _basicCard.toJson(),
        'suggestions': _suggestions == null ? null : _suggestions.toJson(),
        'linkOutSuggestion':
            _linkOutSuggestion == null ? null : _linkOutSuggestion.toJson(),
        'listSelect': _listSelect == null ? null : _listSelect.toJson(),
        'carouselSelect':
            _carouselSelect == null ? null : _carouselSelect.toJson(),
      };
}
