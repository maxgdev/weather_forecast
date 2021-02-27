import 'package:flutter/material.dart';
import './weather_model.dart';
import './forecast_util.dart';

Widget middleView(AsyncSnapshot<WeatherModel> snapshot) {
  var forecastList = snapshot.data.list;
  var city = snapshot.data.city.name;
  var country = snapshot.data.city.country;

  var formattedDate =
      new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt);
  Container middleView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "$city, $country",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          Text("${Util.getFormattedDate(formattedDate)}"),
        ],
      ),
    ),
  );
  return middleView;
}
