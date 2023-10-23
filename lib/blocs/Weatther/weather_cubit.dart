

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_api/model/weather_model.dart';
import 'package:weather_api/service/dio.dart';


part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  static WeatherCubit get(context)=>BlocProvider.of(context);
  String apiKey='d247c5e8902c46888b5141205231810';

  WeatherModel? weatherModel;

  getdataFromWeatherApi(String location){
    emit(GetdataFromWeatherApiLoadingStates());
    DioHelper.getData(url: "current.json",query: {
      "key":apiKey,
      "q":location,


    }).then((
        value) {
       print(value.data);
      // jsonDecode(value.data);
       emit(GetdataFromWeatherApiSuccessStates());
      weatherModel=WeatherModel.fromJson(value.data);
     print( weatherModel!.location!.name!);




    }
    ).catchError(
        (error){
          emit(GetdataFromWeatherApiErrorStates());
        print(error);

        }
    );



  }

}
