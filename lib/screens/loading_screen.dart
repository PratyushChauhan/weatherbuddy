import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation();
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}

Future<void> getLocation() async {
  LocationPermission locationPermission = await Geolocator.requestPermission();
  if (locationPermission == LocationPermission.denied) {
    print('Location permission not granted by user.');
  } else if (locationPermission == LocationPermission.deniedForever) {
    print('Permission denied forever. Change from settings.');
  } else {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position);
  }
}
