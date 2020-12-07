import 'package:bloc/bloc.dart';
import 'package:shared/main.dart';
import 'package:shared/modules/weather_app/resources/weather_resources.dart';

class WeatherBloc extends Bloc<WeatherEvents, WeatherStates> {
  WeatherBloc() : super(InitialSuccessState());
  WeatherApiRepository weatherApiRepository = WeatherApiRepository();

  @override
  Stream<WeatherStates> mapEventToState(WeatherEvents event) async* {
    if (event is SearchClickedEvent) {
      yield LoadingState();
      try {
        final response = await weatherApiRepository.fetchWeather(event.city);
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
