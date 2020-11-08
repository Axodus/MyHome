import 'dart:convert';
import 'package:YourHome/helpers/hue.dart';
import 'package:YourHome/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

toggleAllLights(lightsToggle) async {
  // Making get request to hue
  var response = await getRequest(developerUsn, developerIP, 'lights');

  Map < String, dynamic > allLights = jsonDecode(response);
  print(allLights.length);

  for (int id = 1; id < allLights.length + 1; id++) {

    // Make put request to change state of light
    putRequest(developerUsn, developerIP, 'lights', id, 'state', lightsToggle);
  }
}

getAllLightsState() async {
  SharedPreferences storage = await SharedPreferences.getInstance();

  var response = await getRequest(developerUsn, developerIP, 'lights');

  Map < String, dynamic > totalLights = jsonDecode(response);
  
  var noOfLights = totalLights.length;

  int lightsOn = 1;
  int lightsCounted = 1;

  for (int i = 1; i < noOfLights; i++) {
    var individualLight = totalLights[("$i")];
    var lightState = individualLight["state"]["on"];

    if (lightState == true) {
      lightsOn++;
      lightsCounted++;
    } else lightsCounted++;

    if (lightsCounted == noOfLights) {
      print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`");
      print("\n\n");
      print("No. of lights: $noOfLights");
      print("No. of lights counted: $lightsCounted");
      print("No. of lights on: $lightsOn");
      print("\n\n");
      print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`");
    }
    
    if (lightsOn == noOfLights && lightsCounted == noOfLights) {
      storage.setBool('allLightsOn', true);
      return;
    } else if (lightsOn != noOfLights && lightsCounted == noOfLights) {
      storage.setBool('allLightsOn', false);
      return;
    }
  }
}

