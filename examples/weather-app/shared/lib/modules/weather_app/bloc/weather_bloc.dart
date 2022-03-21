import 'package:bloc/bloc.dart';
import 'package:shared/main.dart';
import 'package:shared/modules/weather_app/resources/weather_resources.dart';

class WeatherBloc extends Bloc<WeatherEvents, WeatherStates> {
  WeatherApiRepository weatherApiRepository = WeatherApiRepository();
  WeatherBloc() : super(InitialSuccessState()) {
    on<SearchClickedEvent>(onSearchClickedEvent);
  }

  onSearchClickedEvent(
      SearchClickedEvent event, Emitter<WeatherStates> emit) async {
    emit(LoadingState());
    try {
      final response = await weatherApiRepository.fetchWeather(event.city);
      if (response["cod"] != 200) {
        emit(FailureState(
          message: response['message'],
          cod: response['cod'],
        ));
      } else {
        WeatherModel weatherModel = WeatherModel.fromJson(response);
        emit(SearchSuccessState(weatherModel: weatherModel));
      }
    } catch (e) {
      FailureState(message: e);
    }
  }
}
