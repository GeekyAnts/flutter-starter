import 'package:equatable/equatable.dart';
import 'package:shared/modules/weather_app/models/weather_model.dart';

abstract class WeatherStates extends Equatable {
  @override
  List<Object> get props => throw UnimplementedError();
}

class InitialSuccessState extends WeatherStates {}

class SearchSuccessState extends WeatherStates {
  final WeatherModel weatherModel;
  SearchSuccessState({this.weatherModel});
}

class LoadingState extends WeatherStates {}

class FailureState extends WeatherStates {
  final dynamic message;
  final String cod;
  FailureState({this.message, this.cod});
}
