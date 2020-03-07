import 'package:new_app/repositories/weather_repositori/weather_api_client.dart';
import 'package:new_app/models/weather_model/models.dart';


class WeatherRepository {
  final WeatherAPIClient weatherApiClient;

  WeatherRepository(this.weatherApiClient);

/* Only help debug
   WeatherRepository({@required this.weatherApiClient})
    : assert(weatherApiClient != null);
*/
  Future<Weather> getWeather(String city) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}