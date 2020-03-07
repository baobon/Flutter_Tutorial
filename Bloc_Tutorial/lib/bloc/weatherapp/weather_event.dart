/*
Khi nguoi dung them vao mot su kien tim kiem
Khoi nay se chiu trach nhiem tim kiem dia diem do 
-> va se tra ve WeatherState
 */

import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetWeather extends WeatherEvent {
  final String city;

  GetWeather(this.city);

  @override
  List<Object> get props => [city];
}

class RefreshWeather extends WeatherEvent {
  final String city;

  RefreshWeather(this.city);

  // const RefreshWeather({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}
