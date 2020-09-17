import '../services/location.dart';
import '../services/networking.dart';

const apiKey = '315bdb224353a7dffae72cc58336c3d2';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
      '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric',
    );

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getLocationImage(int condition) {
    if (condition < 300) {
      return 'assets/images/thunderstorm.jpg';
    } else if (condition < 400) {
      return 'assets/images/Rainy.jpg';
    } else if (condition < 600) {
      return 'assets/images/umbrella.jpg';
    } else if (condition < 700) {
      return 'assets/images/Snow.jpg';
    } else if (condition < 800) {
      return 'assets/images/Default.jpg';
    } else if (condition == 800) {
      return 'assets/images/Sunny.jpg';
    } else if (condition == 804) {
      return 'assets/images/ClearSky.jpg';
    } else if (condition < 804) {
      return 'assets/images/Winter.jpg';
    } else {
      return 'assets/images/Appentercity.jpg';
    }
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
