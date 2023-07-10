import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:weather_app/data/datasource/remote_datasource.dart';
import 'package:weather_app/data/entity/weather.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';
import 'package:weather_app/utils/failure.dart';

class WeatherRepositoryImpl implements WeatherRepository{
  final WeatherRemoteDatasource datasource;
  const WeatherRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName) async {
    try{
      final response = await datasource.getCurrentWeather(cityName);
      return Right(response.toEntity());
    }on SocketException{
      return Left(Failure());
    }on Exception{
      return Left(Failure());
    }

  }

}