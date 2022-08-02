import 'package:weather_app/screens/location.dart';
import 'package:weather_app/services/networking.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkLayer networkLayer = NetworkLayer(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=1afe39b32fe688ae12276690fe7f81df');

    var weatherData = await networkLayer.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getLocation();

    var latitude = location.latitude;
    var longitude = location.longitude;

    NetworkLayer networkHelper = NetworkLayer(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=1afe39b32fe688ae12276690fe7f81df');
    var weatherData = await networkHelper.getData();
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
