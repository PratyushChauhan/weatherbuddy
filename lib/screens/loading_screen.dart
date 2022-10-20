import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherbuddy/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:weatherbuddy/utilities/alerts.dart' as alerts;

import 'location_screen.dart';

WeatherModel weatherModel = WeatherModel();

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    try {
      var weatherData = await weatherModel.getWeatherData();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(
          locationWeatherData: weatherData,
        );
      }));
    } catch (e) {
      alerts.popupError(context, e.toString(), SystemNavigator.pop, null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          size: 100.0,
          color: Colors.grey,
        ),
      ),
    );
  }
}
