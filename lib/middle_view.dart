import 'package:flutter/material.dart';
import './weather_model.dart';

Widget middleView(AsyncSnapshot<WeatherModel> snapshot) {
  var forecastList = snapshot.data.list;
  var city = snapshot.data.city.name;
  var country = snapshot.data.city.country;

  Container middleView = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [Text("$city, $country")],
    ),
  );
  return middleView;
}
