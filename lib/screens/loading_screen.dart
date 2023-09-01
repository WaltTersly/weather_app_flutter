import 'package:flutter/material.dart';
import 'package:climate_flutter/screens/location_screen.dart';
import 'package:climate_flutter/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    determinePosition();
  }

  Future determinePosition() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.determinePosition();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeatherData: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white38,
          size: 100.0,
        ),
      ),
    );
  }
}
