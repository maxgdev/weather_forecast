import 'package:flutter/material.dart';
import './weather_model.dart';
import './forecast_util.dart';

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
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(padding: EdgeInsets.symmetric(vertical: 3)),
      Center(child: Text(dayOfWeek)),
    ],
  );
}
