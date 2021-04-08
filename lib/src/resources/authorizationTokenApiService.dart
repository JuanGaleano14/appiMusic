import 'dart:async';
import 'package:alarmfy/src/models/authorization_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class AuthorizationTokenApiProvider {
  Client client = Client();
  static String client_id = "c84a6e893ab6446a9b155d9f0c04f12c";
  static String client_secret = "15ff9e02ab7645d1a600857d1af6f72b";

  static String AuthorizationStr = "$client_id:$client_secret";
  static var bytes = utf8.encode(AuthorizationStr);
  static var base64Str = base64.encode(bytes);

  String Authorization = 'Basic ' + base64Str;

  var urlToToken = 'https://accounts.spotify.com/api/token';

  Future<AuthorizationModel> fetchToken(String code) async {
    var response = await client.post(urlToToken, body: {
      'grant_type': "authorization_code",
      'code': code,
      'redirect_uri': 'alarmfy:/'
    }, headers: {
      'Authorization': Authorization
    });

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return AuthorizationModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
