import 'package:flutter/material.dart';
import 'weather_model.dart';
import './forecast_card.dart';

Widget bottomView(AsyncSnapshot<WeatherModel> snapshot, BuildContext context) {
  var forecastList = snapshot.data.list;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text("7-Day Weather Forecast", 
      style: TextStyle(
        fontSize: 18,
        color: Colors.black87
        ),),
      Container(
        height: 180,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView.separated(
          separatorBuilder: (context, index)=> SizedBox(width: 8), 
          itemCount: forecastList.length,
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: MediaQuery.of(context).size.width /2.7,
              height: 160,
              child: foreCastCard(snapshot, index),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.amber.shade800, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                )
              ),
            ),
          )
          )
      ),
    ],
  );
}