import 'package:app/src/screens/weather_screens/widgets/build_weather.dart';
import 'package:app/src/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/main.dart';
import 'package:app/src/config/string_constants.dart' as string_constants;

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherBloc weatherBloc;

  @override
  Widget build(BuildContext context) {
    weatherBloc = BlocProvider.of<WeatherBloc>(context);
    TextEditingController _cityNameController = TextEditingController();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20.toWidth,
        vertical: 18.toHeight,
      ),
      child: ListView(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            style: Theme.of(context).textTheme.headline6,
            autofocus: false,
            textAlign: TextAlign.left,
            controller: _cityNameController,
            autocorrect: false,
            cursorColor: Theme.of(context).colorScheme.primary,
            decoration: InputDecoration(
              labelText: string_constants.enter_city_name,
              filled: true,
              isDense: true,
            ),
          ),
          SizedBox(height: 42.toHeight),
          SizedBox(
            height: 100.toHeight,
            width: 250.toWidth,
            child: RaisedButton(
              elevation: 3,
              onPressed: () {
                weatherBloc.add(
                  SearchClickedEvent(city: _cityNameController.text),
                );
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Text(string_constants.search),
            ),
          ),
          SizedBox(height: 40.toHeight),
          BlocBuilder<WeatherBloc, WeatherStates>(builder: (context, state) {
            if (state is SearchSuccessState)
              return BuildWeather(
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
