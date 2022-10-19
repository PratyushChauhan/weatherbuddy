import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherbuddy/services/location.dart';
import 'package:flutter/material.dart';
import 'package:weatherbuddy/services/networking.dart';
import 'location_screen.dart';

const String apiKey = '4d8588fe0bf4c9baba28dc8440dc24b7';

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

  Future getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    dynamic weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeatherData: weatherData,
      );
    }));
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
