
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/entity/weather.dart';

class WeatherModel extends Equatable{
  final String main;
  final double temperature;

  const WeatherModel({required this.main, required this.temperature});
  
  @override
  List<Object?> get props => [main, temperature];

  Weather toEntity() => Weather(main: main, temperature: temperature);

  factory WeatherModel.fromJSON(Map<String, dynamic> jsonData) => WeatherModel(main: jsonData['weather'][0]['main'], temperature: jsonData['main']['temp']);

  Map<String, dynamic> toJSON() => {'main': main, 'temp': temperature};

}