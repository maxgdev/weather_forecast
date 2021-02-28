import 'package:flutter/material.dart';
import './weather_model.dart';
import './forecast_util.dart';
import './convert_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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
              Icon(FontAwesomeIcons.thermometerQuarter , size: 16, color: Colors.black87),
              // Text("Temp: ${forecastList[0].main.temp} ℉"),
              Text(" Hum: ${forecastList[0].main.humidity} %"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.thermometerFull , size: 16, color: Colors.black87),
              Text("Max:${forecastList[0].main.tempMax} ℉"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.tint, size: 16, color: Colors.black87),
              Text("Temp: ${forecastList[0].main.temp} ℉"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.wind, size: 16, color: Colors.black87),
              Text(" Wind: ${forecastList[0].wind.speed} m/h"),
            ],
          ),
        ],
      )
    ],
  );
}
