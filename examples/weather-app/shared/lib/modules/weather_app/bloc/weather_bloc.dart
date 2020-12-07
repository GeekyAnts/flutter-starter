import 'package:bloc/bloc.dart';
import 'package:shared/main.dart';
import 'package:shared/modules/weather_app/resources/weather_api_provider.dart';

class WeatherBloc extends Bloc<WeatherEvents, WeatherStates> {
  WeatherBloc() : super(InitialSuccessState());
  WeatherApiProvider weatherApiProvider = WeatherApiProvider();

  @override
  Stream<WeatherStates> mapEventToState(WeatherEvents event) async* {
    if (event is SearchClickedEvent) {
      yield LoadingState();
      try {
        final response = await weatherApiProvider.fetchWeather(event.city);
        if (response["cod"] != 200) {
          yield FailureState(
            message: response['message'],
            cod: response['cod'],
          );
        } else {
          WeatherModel weatherModel = WeatherModel.fromJson(response);
          yield SearchSuccessState(weatherModel: weatherModel);
        }
      } catch (e) {
        FailureState(message: e);
      }
    }
  }
}
