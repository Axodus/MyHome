import 'dart:convert';

import 'package:YourHome/config/config.dart';
import 'package:http/http.dart';

// Type is either lights or groups
// Action is either state (individual lights) or action (groups)
putRequest(username, bridgeIP, type, id, action, json) async {
  String url = 'http://$bridgeIP/api/$username/$type/$id/$action';

  Map<String, String> headers = {"Content-type": "application/json"};

  Response response = await put(url, headers: headers, body: json);

  int statusCode = response.statusCode;

  String body = response.body;

  print(statusCode);
  print(body);
}

// Type is either lights or groups
getRequest(username, bridgeIP, type) async {
  String url = 'http://$bridgeIP/api/$username/$type/';

  Response response = await get(url);

  int statusCode = response.statusCode;

  Map < String, String > headers = response.headers;

  String contentType = headers['content-type'];

  String json = response.body;

  print(statusCode);
  print(contentType);

  return json;
}

toggleAllLights(lightsToggle) async {
    // Making get request to hue
    var response = await getRequest(developerUsn, developerIP, 'lights');

    Map < String, dynamic > allLights = jsonDecode(response);
    print(allLights.length);

    for (int id = 1; id < allLights.length; id++) {
      
      String indLightTog = '{"on": $lightsToggle}';

      // Make put request to change state of light

      putRequest(developerUsn, developerIP, 'lights', id, 'state', indLightTog);
    }
  }