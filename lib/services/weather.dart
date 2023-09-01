import 'package:climate_flutter/services/networking.dart';
import 'package:climate_flutter/services/location.dart';

const openWeatherApi = 'b812bc7c60ba86b62bf35e3ab826bcd6';
const openWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  late double Latitude;
  late double Longitude;

  Future<dynamic> getCityWeather(String cityName) async {
    var url = Uri.parse(
        '$openWeatherUrl?q=$cityName&appid=$openWeatherApi&units=metric');
    NetworkPortion networkPort = NetworkPortion(url: url);

    var weatherData = await networkPort.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  Future<dynamic> determinePosition() async {
    Location location = Location();
    await location.determinePosition();
    Latitude = location.latitude;
    Longitude = location.longitude;

    var url = Uri.parse(
        '$openWeatherUrl?lat=$Latitude&lon=$Longitude&appid=$openWeatherApi&units=metric');

    NetworkPortion networkPortion = NetworkPortion(url: url);

    var weatherData = await networkPortion.getData();
    return weatherData;
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
