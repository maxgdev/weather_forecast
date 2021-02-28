import 'package:flutter/material.dart';
import './weather_model.dart';
import './forecast_util.dart';
import './convert_icon.dart';


Widget forecastCard(AsyncSnapshot<WeatherModel> snapshot, int index) {
  var forecastList = snapshot.data.list;
  var dayOfWeek = "";
  print("Before assignment: $dayOfWeek");
  var date =
      new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0];
  print("After assignment: $dayOfWeek");
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(padding: EdgeInsets.only(top: 3)),
      Center(child: Text(dayOfWeek)),
      SizedBox(height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            // {String weatherDescription, Color color, double size}
            child: getWeatherIcon(
              weatherDescription: forecastList[index].weather[0].main,
              color: Colors.amber,
              size: 35
              ),
          ),
        ],
      ),
      SizedBox(height: 5),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Temp: 54 ℉"),
              Icon(Icons.thermostat_rounded , size: 16, color: Colors.black87),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Max: 59 ℉"),
              Icon(Icons.thermostat_outlined , size: 16, color: Colors.black87),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hum: 60 %"),
              Icon(Icons.water_damage_outlined , size: 16, color: Colors.black87),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Wind: 5 m/h"),
              Icon(Icons.waves_outlined , size: 16, color: Colors.black87),
            ],
          ),
        ],
      )
    ],
  );
}
