import 'package:equatable/equatable.dart';
import 'package:new_app/models/weather_model/weathercondiiton.dart';

class Weather extends Equatable {
  /*
    Dieu kien thoi tiet 
    nhiet do min
    nhiet do max
    nhiet do
    vi tri dia diem
    Khoi tao
    Thoi gian update cuoi
    vi tri 
   */
  final WeatherCondition condition;
  final String formattedCondition;
  final double minTemp;
  final double temp;
  final double maxTemp;
  final int locationId;
  final String created;
  final DateTime lastUpdated;
  final String location;

  Weather({
    this.condition,
    this.formattedCondition,
    this.minTemp,
    this.temp,
    this.maxTemp,
    this.locationId,
    this.created,
    this.lastUpdated,
    this.location,
  });

  @override
  List<Object> get props => [
        condition,
        formattedCondition,
        minTemp,
        temp,
        maxTemp,
        locationId,
        created,
        lastUpdated,
        location,
      ];

  /*
    Check and weather in Ho Chi Minh Json from API
    https://www.metaweather.com/api/location/1252431/

  */

  static Weather fromJson(dynamic json) {
    final consolidatedWeather = json['consolidated_weather'][0];
    return Weather(
      condition: _mapStringToWeatherCondition(consolidatedWeather['weather_state_abbr']), // 1 2 chu viet tat trang thai thoi tiet
      formattedCondition: consolidatedWeather['weather_state_name'], // Trang thai thoi tiet 
      minTemp: consolidatedWeather['min_temp'] as double, // nhiet do nho nhat
      temp: consolidatedWeather['the_temp'] as double,    // nhiet do hien tai
      maxTemp: consolidatedWeather['max_temp'] as double, // nhiet do lon nhat
      /*
          Khuc nay sao khong vao parent???
       */
      locationId: json['woeid'] as int,                   // Id cua vi tri
      created: consolidatedWeather['created'],            // Lay thoi gian khoi tao
      lastUpdated: DateTime.now(),                        // Lay thoi gian hien tai
      location: json['title'],                            // Lay ten khu vuc
    );
  }

  /* Convert String to Weather icon 
     Check in here 
     https://www.metaweather.com/api/
  */
  static WeatherCondition _mapStringToWeatherCondition(String input) {
    WeatherCondition state;
    switch (input) {
      case 'sn':
        state = WeatherCondition.snow;
        break;
      case 'sl':
        state = WeatherCondition.sleet;
        break;
      case 'h':
        state = WeatherCondition.hail;
        break;
      case 't':
        state = WeatherCondition.thunderstorm;
        break;
      case 'hr':
        state = WeatherCondition.heavyRain;
        break;
      case 'lr':
        state = WeatherCondition.lightRain;
        break;
      case 's':
        state = WeatherCondition.showers;
        break;
      case 'hc':
        state = WeatherCondition.heavyCloud;
        break;
      case 'lc':
        state = WeatherCondition.lightCloud;
        break;
      case 'c':
        state = WeatherCondition.clear;
        break;
      default:
        state = WeatherCondition.unknown;
    }
    return state;
  }
}
