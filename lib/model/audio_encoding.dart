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
