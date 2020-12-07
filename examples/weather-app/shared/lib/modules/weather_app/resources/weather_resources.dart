import 'package:api_sdk/main.dart';

class WeatherApiProvider {
  Future fetchWeather(String city) async {
    final response = await ApiSdk.getWeatherforCity(city);
    return response;
  }
}
