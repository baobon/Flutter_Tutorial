import 'package:bloc/bloc.dart';
import 'package:new_app/bloc/weatherapp/weather_event.dart';
import 'package:new_app/bloc/weatherapp/weather_state.dart';
import 'package:new_app/models/weather_model/weather.dart';
import 'package:new_app/repositories/weather_repositori/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository);

/* Use when debug
  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null);
*/
  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is GetWeather) {
      yield WeatherLoading();
      try {
        final Weather weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoaded(weather);
      } catch (_) {
        yield WeatherError();
      }
    } else if (event is RefreshWeather) {
      try {
        final Weather weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoaded(weather);
      } catch (_) {
        yield state;
      }
    }
  }
}


