import 'package:meta/meta.dart';

class DetectIntentRequest {
  /// The parameters of this query.
  final QueryParameters queryParams;

  /// The input specification. It can be set to:
  /// 1.  an audio config which instructs the speech recognizer how to process the speech audio,
  /// 2.  a conversational query in the form of text, or
  /// 3.  an event that specifies which intent to trigger.
  final QueryInput queryInput;

  /// The natural language speech audio to be processed. This field should be populated iff queryInput is set to an input audio config. A single request can contain up to 1 minute of speech audio data.
  /// A base64-encoded string.
  final String inputAudio;

  DetectIntentRequest({
    @required this.queryInput,
    this.queryParams,
    this.inputAudio,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'queryInput': queryInput == null ? null : queryInput.toJson(),
        'queryParams': queryParams == null ? null : queryParams.toJson(),
        'inputAudio': inputAudio
      };
}

/// An object representing a latitude/longitude pair. This is expressed as a pair of doubles representing degrees latitude and degrees longitude. Unless specified otherwise, this must conform to the WGS84 standard. Values must be within normalized ranges.
class LatLng {
  /// The latitude in degrees. It must be in the range [-90.0, +90.0].
  final double latitude;

  /// The longitude in degrees. It must be in the range [-180.0, +180.0].
  final double longitude;

  LatLng({this.latitude, this.longitude}) {
    assert(this.latitude >= -90.0 && this.latitude <= 90.0,
        'Latitude must be in the range [-90.0, +90.0]');
    assert(this.longitude >= -180.0 && this.longitude <= 180.0,
        'Longitude must be in the range [-180.0, +180.0]');
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'latitude': latitude,
        'longitude': longitude,
      };
}

/// Represents a context.
class Context {
  /// The unique identifier of the context. Format: projects/<Project ID>/agent/sessions/<Session ID>/contexts/<Context ID>.
  /// The Context ID is always converted to lowercase, may only contain characters in [a-zA-Z0-9_-%] and may be at most 250 bytes long.
  final String name;

  /// The number of conversational query requests after which the context expires. If set to 0 (the default) the context expires immediately. Contexts expire automatically after 20 minutes if there are no matching queries.
  final int lifespanCount;

  /// The collection of parameters associated with this context. Refer to [this doc](https://cloud.google.com/dialogflow-enterprise/docs/intents-actions-parameters) for syntax.
  final Map<String, dynamic> parameters;

  Context({
    @required this.name,
    this.lifespanCount,
    this.parameters,
  });

  static Context fromJson(Map<String, dynamic> json) => Context(
        name: json['name'],
        lifespanCount: json['lifespanCount'],
        parameters: json['parameters'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'lifespanCount': lifespanCount,
        'parameters': parameters,
      };
}

/// Represents a session entity type.
class SessionEntityType {
  ///The unique identifier of this session entity type. Format: projects/<Project ID>/agent/sessions/<Session ID>/entityTypes/<Entity Type Display Name>.
  /// <Entity Type Display Name> must be the display name of an existing entity type in the same agent that will be overridden or supplemented.
  final String name;

  /// Indicates whether the additional data should override or supplement the developer entity type definition. See [EntityOverrideMode].
  final String entityOverrideMode;

  /// The collection of entities associated with this session entity type.
  final List<Entity> entities;

  SessionEntityType({
    @required this.name,
    @required this.entityOverrideMode,
    @required this.entities,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'entityOverrideMode': entityOverrideMode,
        'entities':
            entities == null ? null : entities.map((e) => e.toJson()).toList(),
      };
}

/// An entity entry for an associated entity type.
class Entity {
  /// The primary value associated with this entity entry. For example, if the entity type is vegetable, the value could be scallions.
  ///
  /// For KIND_MAP entity types:
  /// - A canonical value to be used in place of synonyms.
  ///
  /// For KIND_LIST entity types:
  /// - A string that can contain references to other entity types (with or without aliases).
  final String value;

  /// A collection of value synonyms. For example, if the entity type is vegetable, and value is scallions, a synonym could be green onions.
  ///
  /// For KIND_LIST entity types:
  /// - This collection must contain exactly one synonym equal to value.
  final List<String> synonyms;

  Entity({
    @required this.value,
    @required this.synonyms,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'value': value,
        'synonyms': synonyms,
      };
}

// The types of modifications for a session entity type.
class EntityOverrideMode {
  /// Not specified. This value should be never used.
  static String unspecified = 'ENTITY_OVERRIDE_MODE_UNSPECIFIED';

  /// The collection of session entities overrides the collection of entities in the corresponding developer entity type.
  static String override = 'ENTITY_OVERRIDE_MODE_OVERRIDE';

  /// The collection of session entities extends the collection of entities in the corresponding developer entity type.
  static String supplement = 'ENTITY_OVERRIDE_MODE_SUPPLEMENT';
}

/// Represents the parameters of the conversational query.
class QueryParameters {
  /// The time zone of this conversational query from the time zone database, e.g., America/New_York, Europe/Paris. If not provided, the time zone specified in agent settings is used.
  final String timeZone;

  /// The geo location of this conversational query.
  final LatLng geoLocation;

  /// The collection of contexts to be activated before this query is executed.
  final List<Context> contexts;

  /// Specifies whether to delete all contexts in the current session before the new ones are activated.
  final bool resetContexts;

  /// Additional session entity types to replace or extend developer entity types with. The entity synonyms apply to all languages and persist for the session of this query.
  final List<SessionEntityType> sessionEntityTypes;

  /// This field can be used to pass custom data into the webhook associated with the agent. Arbitrary JSON objects are supported.
  final Map<String, dynamic> payload;

  QueryParameters({
    this.timeZone,
    this.geoLocation,
    this.contexts,
    this.resetContexts,
    this.sessionEntityTypes,
    this.payload,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'timeZone': timeZone,
        'geoLocation': geoLocation == null ? null : geoLocation.toJson(),
        'contexts':
            contexts == null ? null : contexts.map((c) => c.toJson()).toList(),
        'resetContexts': resetContexts,
        'sessionEntityTypes': sessionEntityTypes == null
            ? null
            : sessionEntityTypes.map((s) => s.toJson()).toList(),
        'payload': payload,
      };
}

/// Represents the query input. It can contain either:
/// 1.  an audio config which instructs the speech recognizer how to process the speech audio,
/// 2.  a conversational query in the form of text, or
/// 3.  an event that specifies which intent to trigger.
class QueryInput {
  /// Instructs the speech recognizer how to process the speech audio.
  final InputAudioConfig audioConfig;

  /// The natural language text to be processed.
  final TextInput text;

  /// The event to be processed.
  final EventInput event;

  QueryInput({
    this.audioConfig,
    this.text,
    this.event,
  }) {
    assert(
        (audioConfig != null && text == null && event == null) ||
            (audioConfig == null && text != null && event == null) ||
            (audioConfig == null && text == null && event != null),
        'Input can be only one of the following: audioConfig, text or event.');
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'text': text == null ? null : text.toJson(),
        'event': event == null ? null : event.toJson(),
        'audioConfig': audioConfig == null ? null : audioConfig.toJson(),
      };
}

/// Events allow for matching intents by event name instead of the natural language input. For instance, input <event: { name: "welcome_event", parameters: { name: "Sam" } }> can trigger a personalized welcome response. The parameter name may be used by the agent in the response: "Hello #welcome_event.name! What can I do for you today?".
class EventInput {
  /// The unique identifier of the event.
  final String name;

  ///  The collection of parameters associated with the event.
  final Map<String, dynamic> parameters;

  /// The language of this query. See (Language Support)[https://cloud.google.com/dialogflow-enterprise/docs/reference/language] for a list of the currently supported language codes. Note that queries in the same session do not necessarily need to specify the same language
  final String languageCode;

  EventInput({
    @required this.name,
    @required this.languageCode,
    this.parameters,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'languageCode': languageCode,
        'parameters': parameters,
      };
}

/// Audio encoding of the audio content sent in the conversational query request. Refer to the [Cloud Speech API documentation](https://cloud.google.com/speech-to-text/docs/basics) for more details.
class AudioEncoding {
  /// Not specified.
  static String unspecified = 'AUDIO_ENCODING_UNSPECIFIED';

  /// Uncompressed 16-bit signed little-endian samples (Linear PCM).
  static String linear16 = 'AUDIO_ENCODING_LINEAR_16';

  /// FLAC (Free Lossless Audio Codec) is the recommended encoding because it is lossless (therefore recognition is not compromised) and requires only about half the bandwidth of LINEAR16. FLAC stream encoding supports 16-bit and 24-bit samples, however, not all fields in STREAMINFO are supported.
  static String flac = 'AUDIO_ENCODING_FLAC';

  /// 8-bit samples that compand 14-bit audio samples using G.711 PCMU/mu-law.
  static String mulaw = 'AUDIO_ENCODING_MULAW';

  /// Adaptive Multi-Rate Narrowband codec. sampleRateHertz must be 8000.
  static String amr = 'AUDIO_ENCODING_AMR';

  /// Adaptive Multi-Rate Wideband codec. sampleRateHertz must be 16000.
  static String amrWb = 'AUDIO_ENCODING_AMR_WB';

  /// Opus encoded audio frames in Ogg container (OggOpus). sampleRateHertz must be 16000.
  static String oggOpus = 'AUDIO_ENCODING_OGG_OPUS';

  /// Although the use of lossy encodings is not recommended, if a very low bitrate encoding is required, OGG_OPUS is highly preferred over Speex encoding. The Speex encoding supported by Dialogflow API has a header byte in each block, as in MIME type audio/x-speex-with-header-byte. It is a variant of the RTP Speex encoding defined in RFC 5574. The stream is a sequence of blocks, one block per RTP packet. Each block starts with a byte containing the length of the block, in bytes, followed by one or more frames of Speex data, padded to an integral number of bytes (octets) as specified in RFC 5574. In other words, each RTP header is replaced with a single byte containing the block length. Only Speex wideband is supported. sampleRateHertz must be 16000.
  static String speexWithHeaderByte = 'AUDIO_ENCODING_SPEEX_WITH_HEADER_BYTE';
}

/// Represents the natural language text to be processed.
class TextInput {
  /// The UTF-8 encoded natural language text to be processed. Text length must not exceed 256 characters.
  final String text;

  /// The language of this conversational query. See [Language Support](https://cloud.google.com/dialogflow-enterprise/docs/reference/language) for a list of the currently supported language codes. Note that queries in the same session do not necessarily need to specify the same language.
  final String languageCode;

  TextInput({
    @required this.text,
    @required this.languageCode,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'text': text,
        'languageCode': languageCode,
      };
}

/// Instructs the speech recognizer how to process the audio content.
class InputAudioConfig {
  /// Audio encoding of the audio content to process. Use [AudioEncoding].
  final String audioEncoding;

  /// Sample rate (in Hertz) of the audio content sent in the query. Refer to [Cloud Speech API documentation](https://cloud.google.com/speech-to-text/docs/basics) for more details.
  final int sampleRateHertz;

  /// The language of the supplied audio. Dialogflow does not do translations. See [Language Support](https://cloud.google.com/dialogflow-enterprise/docs/reference/language) for a list of the currently supported language codes. Note that queries in the same session do not necessarily need to specify the same language.
  final String languageCode;

  /// The collection of phrase hints which are used to boost accuracy of speech recognition. Refer to [Cloud Speech API documentation](https://cloud.google.com/speech-to-text/docs/basics#phrase-hints) for more details.
  final List<String> phraseHints;

  InputAudioConfig({
    @required this.audioEncoding,
    @required this.sampleRateHertz,
    @required this.languageCode,
    this.phraseHints,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'audioEncoding': audioEncoding,
        'sampleRateHertz': sampleRateHertz,
        'languageCode': languageCode,
        'phraseHints': phraseHints
      };
}
