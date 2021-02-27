import 'dart:convert';
import './weather_model.dart';
import './forecast_util.dart';
import 'package:http/http.dart';

class Network {
   Future<WeatherModel> getWeatherForecast({String cityName}) async{
    //  var finalUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?q="+cityName+
    //      "&appid="+Util.appId+"&units=imperial"; //change to metric or imperial

    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast?q="+cityName+"&appid="+Util.appId+"&cnt=7";
    
     final response = await get(Uri.encodeFull(finalUrl));
    //  print("URL: ${Uri.encodeFull(finalUrl)}");

     if (response.statusCode == 200) {
       // we get the actual mapped model ( dart object )
      //  print("weather data: ${response.body}");
         return WeatherModel.fromJson(json.decode(response.body));
     }else {
       throw Exception("Error getting weather forecast");
    
     }


   }
}