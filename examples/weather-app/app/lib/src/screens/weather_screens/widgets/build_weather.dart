import 'package:flutter/material.dart';
import 'package:app/src/utils/size_utils.dart';
import 'package:shared/main.dart';
import 'package:app/src/config/string_constants.dart' as string_constants;

class BuildWeather extends StatelessWidget {
  final WeatherModel weatherModel;
  const BuildWeather({Key key, this.weatherModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${weatherModel.cityName},",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 50.toFont),
              ),
              Text(
                weatherModel.countryCode,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 50.toFont),
              ),
            ],
          ),
          SizedBox(height: 40.toHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.mainWeather,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 70.toFont),
              ),
              Image.network(
                string_constants.weather_image_const_1 +
                    weatherModel.icon +
                    string_constants.weather_image_const_2,
              ),
            ],
          ),
          Text(
            weatherModel.description,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontSize: 30.toFont),
          ),
          SizedBox(height: 40.toHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${weatherModel.temp}°",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 110.toFont),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Min: ${weatherModel.minTemp}°",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    "Max: ${weatherModel.maxTemp}°",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30.toHeight),
          Text(
            "Wind Speed : ${weatherModel.windSpeed}",
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
