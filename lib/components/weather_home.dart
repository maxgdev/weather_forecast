import 'package:flutter/material.dart';
import 'package:weather_forecast/components/bottom_view.dart';
import 'package:weather_forecast/components/weather_model.dart';
import './network.dart';
import './middle_view.dart';

class WeatherForecast extends StatefulWidget {
  WeatherForecast({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherModel> forecastObject;

  String _cityName = "San Diego";

  @override
  void initState() {
    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            textFieldView(),
            Container(
              child: FutureBuilder<WeatherModel>(
                future: forecastObject,
                builder: (BuildContext context,
                    AsyncSnapshot<WeatherModel> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        middleView(snapshot),
                        bottomView(snapshot, context)
                      ],
                    );
                  } else {
                    // do something else
                    return Container(
                        child: Center(
                      child: CircularProgressIndicator(),
                    ));
                  }
                }, // AsyncSnapshot
              ),
            ),
          ],
        ));
  }

  Widget textFieldView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Enter City Name",
          prefix: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.all(8),
        ),
        onSubmitted: (value) {
          setState(() {
            _cityName = value;
            forecastObject = getWeather(cityName: _cityName);
          });
        },
      ),
    );
  }

  Future<WeatherModel> getWeather({String cityName}) =>
      Network().getWeatherForecast(cityName: cityName);
}
