part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}
class   GetdataFromWeatherApiLoadingStates extends WeatherState {}
class   GetdataFromWeatherApiErrorStates extends WeatherState {}
class   GetdataFromWeatherApiSuccessStates extends WeatherState {}