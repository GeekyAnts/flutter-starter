class WeatherModel {
  dynamic lon;
  dynamic lat;
  String mainWeather;
  String description;
  String temp;
  String minTemp;
  String maxTemp;
  dynamic windSpeed;
  String countryCode;
  String cityName;
  String icon;

  WeatherModel.fromJson(Map<String, dynamic> parsedJson)
      : lon = parsedJson['coord']['lon'],
        lat = parsedJson['coord']['lat'],
        mainWeather = parsedJson['weather'][0]['main'],
        description = parsedJson['weather'][0]['description'],
        temp = (parsedJson['main']['temp'] - 273.15).toStringAsFixed(2),
        minTemp = (parsedJson['main']['temp_min'] - 273.15).toStringAsFixed(2),
        maxTemp = (parsedJson['main']['temp_max'] - 273.15).toStringAsFixed(2),
        windSpeed = parsedJson['wind']['speed'],
        countryCode = parsedJson['sys']['country'],
        cityName = parsedJson['name'],
        icon = parsedJson["weather"][0]["icon"];
}
