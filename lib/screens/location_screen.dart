import 'package:flutter/material.dart';
import 'package:weatherbuddy/utilities/constants.dart';
import 'package:weatherbuddy/services/weather.dart' as weather;

weather.WeatherModel weatherModel = weather.WeatherModel();

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeatherData});
  final locationWeatherData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String message = 'Error';
  String weatherIcon = '';
  var cityName = '';
  int temperature = 0;

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        message = 'ERROR';
        cityName = '';
        weatherIcon = '';
        return;
      }

      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      message = weatherModel.getMessage(temperature);

      cityName = 'in ' + weatherData['name'];

      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      try {
                        dynamic weatherData =
                            await weatherModel.getWeatherData();
                        updateUI(weatherData);
                      } catch (e) {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Error'),
                            content: Text('$e'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  message + ' $cityName!',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
