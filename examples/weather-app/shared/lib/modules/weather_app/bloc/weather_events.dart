import 'package:equatable/equatable.dart';

abstract class WeatherEvents extends Equatable {
  @override
  List<Object> get props => throw UnimplementedError();
}

class SearchClickedEvent extends WeatherEvents {
  final String city;

  SearchClickedEvent({this.city});
}
