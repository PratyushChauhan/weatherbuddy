import 'package:weatherbuddy/services/location.dart';
import 'package:flutter/material.dart';
import 'package:weatherbuddy/services/networking.dart';

const String apiKey = '4d8588fe0bf4c9baba28dc8440dc24b7';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat = 75;
  double lon = 25;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  //use location to get weather

  //location getter
  Future getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    lat = location.latitude;
    lon = location.longitude;
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    dynamic weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
