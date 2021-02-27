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
    // forecastObject.then((weather) => {
    //   print(weather.city.name)
    // });
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
                    // do something
                    return Text("Data found");
                  } else {
                    // do something else
                    return Container(
                        child: Center(
                      child: CircularProgressIndicator(),
                    ));
                  }
                },
              ),
            ),
          ],
        ));
  }
}

Widget textFieldView() {
  return Container(
    child: TextField(
      decoration: InputDecoration(
        hintText: "Enter City",
        prefix: Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.all(8),
      ),
      onSubmitted: (value) {
        // ToDO
      },
    ),
  );
}
