import 'dart:convert';
import 'dart:io';
import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart';
import 'package:meta/meta.dart';

class Dialogflow {
  final AuthGoogle authGoogle;

  String sessionId;

  // TODO check this
  Dialogflow({
    @required this.authGoogle,
    this.sessionId,
  });

  String _getUrl() {
    return 'https://dialogflow.googleapis.com/v2/projects/${authGoogle.getProjectId}/agent/sessions/$sessionId:detectIntent';
  }

  Future<DetectIntentResponse> detectIntent(DetectIntentRequest params) async {
    var response = await authGoogle.post(
      _getUrl(),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${authGoogle.getToken}"
      },
      body: json.encode(params.toJson()),
    );
    return DetectIntentResponse.fromJson(json.decode(response.body));
  }

  Future<DetectIntentResponse> detectIntentFromText(
    String query,
    String languageCode,
  ) =>
      detectIntent(
        DetectIntentRequest(
          queryInput: QueryInput(
            text: TextInput(
              text: query,
              languageCode: languageCode,
            ),
          ),
        ),
      );
}
