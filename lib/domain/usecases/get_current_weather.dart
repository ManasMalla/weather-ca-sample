import 'package:dartz/dartz.dart';
import 'package:weather_app/data/entity/weather.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';
import 'package:weather_app/utils/failure.dart';

class GetCurrentWeather{
  final WeatherRepository weatherRepository;
  const GetCurrentWeather(this.weatherRepository);

  Future<Either<Failure, Weather>> execute(String cityName) {
    return weatherRepository.getCurrentWeather(cityName);
  }
}