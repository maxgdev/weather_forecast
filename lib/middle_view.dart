import 'package:flutter/material.dart';
import './weather_model.dart';
import './forecast_util.dart';
import './convert_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget middleView(AsyncSnapshot<WeatherModel> snapshot) {
  var forecastList = snapshot.data.list;
  var city = snapshot.data.city.name;
  var country = snapshot.data.city.country;

  var formattedDate =
      new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
  // Multiply forecastList[0].dt by 1000 to get CORRECT date
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
          SizedBox(height: 10),
          //  Icon(FontAwesomeIcons.sun, size: 180, color: Colors.amber.shade800),
           getWeatherIcon(
             weatherDescription: forecastList[0].weather[0].description,
             size: 180,
             color: Colors.amber.shade800
           ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 22, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${forecastList[0].main.temp} ℉",
                  style: TextStyle(fontSize: 40),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text("${forecastList[0].weather[0].description}",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("${forecastList[0].wind.speed} m/h"),
                  SizedBox(height: 8),
                  // Icon(Icons.arrow_forward, size: 20, color: Colors.amber.shade800,),
                  Icon(FontAwesomeIcons.wind, size: 20, color: Colors.amber.shade800),
                ],
              ),
              Column(
                children: [
                  Text("${forecastList[0].main.humidity} %"),
                  SizedBox(height: 8),
                  // Icon(Icons.water_damage, size: 20, color: Colors.blueGrey),
                  Icon(FontAwesomeIcons.tint, size: 20, color: Colors.amber.shade800),
                ],
              ),
              Column(
                children: [
                  Text("${forecastList[0].main.tempMax.toStringAsFixed(0)} ℉"),
                  SizedBox(height: 8),
                  // Icon(Icons.wb_sunny_sharp, size: 20, color: Colors.amber),
                  Icon(FontAwesomeIcons.temperatureHigh, size: 20, color: Colors.amber.shade800),
                ],
              ),
            ],
          ),
          ),
        ],
      ),
    ),
  );
  return middleView;
}
