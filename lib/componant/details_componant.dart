import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_api/blocs/Weatther/weather_cubit.dart';

class DetailsComponant extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=WeatherCubit.get(context);
        return Container(
          width: 400.w,
          height: 50.h,

          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              border: Border.all(color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(10))

          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('${cubit.weatherModel!.current!.humidity!}'),
                  Text('humidity'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Text('${cubit.weatherModel!.current!.visKm!}'),
                  Text('Visibility'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Text('${cubit.weatherModel!.current!.uv!}'),
                  Text('UV Index'),
                ],
              ),


            ],
          ),
        );
      },
    );
  }
}
