import 'package:app/src/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/main.dart';

// ignore: must_be_immutable
class WeatherPage extends StatelessWidget {
  WeatherBloc weatherBloc;
  @override
  Widget build(BuildContext context) {
    weatherBloc = BlocProvider.of<WeatherBloc>(context);
    TextEditingController cityNameController = TextEditingController();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20.toWidth,
        vertical: 18.toHeight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            keyboardType: TextInputType.text,
            style: Theme.of(context).textTheme.headline6,
            autofocus: false,
            textAlign: TextAlign.left,
            controller: cityNameController,
            autocorrect: false,
            cursorColor: Theme.of(context).colorScheme.primary,
            decoration: InputDecoration(
              labelText: 'Enter City Name Here',
              filled: true,
              isDense: true,
            ),
          ),
          SizedBox(height: 42.toHeight),
          SizedBox(
            height: 80.toHeight,
            width: 250.toWidth,
            child: RaisedButton(
              elevation: 3,
              onPressed: () {
                weatherBloc.add(
                  SearchClickedEvent(city: cityNameController.text),
                );
              },
              child: Text("Search"),
            ),
          ),
          SizedBox(height: 40.toHeight),
          BlocBuilder<WeatherBloc, WeatherStates>(builder: (context, state) {
            if (state is SearchSuccessState)
              return _buildWeather(
                context: context,
                weatherModel: state.weatherModel,
              );
            else if (state is InitialSuccessState)
              return Container();
            else if (state is LoadingState)
              return _buildLoadingScreen();
            else if (state is FailureState)
              return _buildErrorPage(state.message, state.cod);
            else
              return Container();
          }),
        ],
      ),
    );
  }

  Widget _buildWeather({BuildContext context, WeatherModel weatherModel}) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${weatherModel.cityName}, ${weatherModel.countryCode}",
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontSize: 50.toFont),
          ),
          SizedBox(height: 40.toHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${weatherModel.mainWeather}",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 70.toFont),
              ),
              Image.network(
                  "http://openweathermap.org/img/wn/${weatherModel.icon}@2x.png"),
            ],
          ),
          Text(
            "${weatherModel.description}",
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

  Widget _buildLoadingScreen() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorPage(String message, String code) {
    return Center(
      child: code == null ? Text("$message") : Text("$message : $code"),
    );
  }
}
