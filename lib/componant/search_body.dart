import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_api/blocs/Weatther/weather_cubit.dart';

class SearchBody extends StatelessWidget {
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = WeatherCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
controller: controller,

             onSubmitted:(value)=>cubit.getdataFromWeatherApi(value) ,

              decoration: InputDecoration(
                  filled: true,


                fillColor: Colors.white.withOpacity(0.5),
                  label: Text('Search'),
                  labelStyle: TextStyle(
                    fontSize: 30.sp
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)

                  ),
                suffixIcon: Icon(Icons.search),
              )

          ),
        );
      },
    );
  }
}
