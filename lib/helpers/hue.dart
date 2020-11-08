import 'dart:convert';

import 'package:YourHome/config/config.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Type is either lights or groups
// Action is either state (individual lights) or action (groups)
putRequest(username, bridgeIP, type, id, action, json) async {
  String url = 'http://$bridgeIP/api/$username/$type/$id/$action';

  Map < String, String > headers = {
    "Content-type": "application/json"
  };

  Response response = await put(url, headers: headers, body: json);

  int statusCode = response.statusCode;

  String body = response.body;

  print("CHANGED SOMETHING");
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