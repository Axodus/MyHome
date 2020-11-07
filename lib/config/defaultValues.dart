import 'dart:convert';
import 'package:YourHome/helpers/hue.dart';
import 'package:YourHome/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

getLightsStatus() async{
  SharedPreferences storage = await SharedPreferences.getInstance();
  
  var response = await getRequest(developerUsn, developerIP, "lights");

  Map < String, dynamic > lights = jsonDecode(response); 

  for (int i = 1; i < lights.length + 1; i++) {
    var individualLight = lights[("$i")];
    var lightState = individualLight["state"]["on"];
    print(lightState);
  }
}