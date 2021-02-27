import 'package:flutter/material.dart';
import 'package:weather_forecast/weather_model.dart';
import './network.dart';

class WeatherForecast extends StatefulWidget {
  WeatherForecast({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  
  Future<WeatherModel> forecastObject;

  String _cityName = "London";
  @override
  void initState() {
    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityName);
    forecastObject.then((weather) => {
      print(weather.city.name)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Weather Forecast App',
            ),
          ],
        ),
      ),
    );
  }
}
