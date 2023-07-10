import 'package:equatable/equatable.dart';

class Weather extends Equatable{
  const Weather({required this.main, required this.temperature});
  final double temperature;
  final String main;
  @override
  List<Object?> get props => [main, temperature];
}