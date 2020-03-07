/*
WeatherEmpty -  Start Non data !
WeatherLoading - when user searching 
WeatherLoaded - when user search sucessly
WeatherError - when user unable search city
 */

import 'package:equatable/equatable.dart';
import 'package:new_app/models/weather_model/weather.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded(this.weather);


/* Use when debug
  // const WeatherLoaded({@required this.weather}) : assert(weather != null);
*/

  @override
  List<Object> get props => [weather];
}

class WeatherError extends WeatherState {}
