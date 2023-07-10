import 'package:dartz/dartz.dart';

import '../../data/entity/weather.dart';
import '../../utils/failure.dart';

abstract class WeatherRepository{
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName);
}