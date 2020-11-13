import 'package:YourHome/config/config.dart';
import 'package:YourHome/helpers/hue.dart';
import 'package:flutter/material.dart';
import 'package:YourHome/config/colors.dart';

groupCard(context, groupName, state, lGrBri, groupLightState, id, type, action) {
  return Container(
    child: new Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                    contentPadding: EdgeInsets.all(0),
                    content: Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            color: compl2,
                            borderRadius: BorderRadius.circular(40)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(25.0),
                                child: Text(
                                  "Brightness:",
                                  style: TextStyle(
                                    fontFamily: 'DinNext',
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(25.0),
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: Colors.red[700],
                                    inactiveTrackColor: Colors.red[100],
                                    trackShape: RoundedRectSliderTrackShape(),
                                    trackHeight: 10.0,
                                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                                    thumbColor: Colors.redAccent,
                                    overlayColor: Colors.red.withAlpha(32),
                                    overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                                    tickMarkShape: RoundSliderTickMarkShape(),
                                    activeTickMarkColor: Colors.red[700],
                                    inactiveTickMarkColor: Colors.red[100],
                                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                                    valueIndicatorColor: Colors.redAccent,
                                  ),
                                  child: Slider(
                                    value: lGrBri,
                                    min: 0.0,
                                    max: 254.0,
                                    divisions: 254,
                                    onChanged: (value) {

                                      setState(() {
                                        lGrBri = value;
                                      });

                                      var jsonFriendlyBri = lGrBri.toInt();

                                      String lightBri = '{"on": true, "bri": $jsonFriendlyBri}';
                                      String lightOff = '{"on": false}';

                                      if (groupLightState == true) {
                                        putRequest(developerUsn, developerIP, type, id, action, lightBri);
                                      }

                                      if (jsonFriendlyBri == 0) {
                                        putRequest(developerUsn, developerIP, type, id, action, lightOff);
                                      }

                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    )
                  );
                }
              );
            }
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
          ),
          elevation: 12,
          color: secondary1,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    groupName,
                    style: TextStyle(
                      fontFamily: 'DinNext',
                      fontSize: 22,
                    ),
                  ),
                ),
              ),

              new Padding(
                padding: EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 45,
                    height: 50,
                    decoration: BoxDecoration(
                      color: state ? Colors.green[900] : compl1,
                      borderRadius: BorderRadius.circular(100)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ),
    height: MediaQuery.of(context).size.height * 0.1,
  );
}