import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_api/blocs/Weatther/weather_cubit.dart';
import 'package:weather_api/componant/details_componant.dart';
import 'package:weather_api/map/weather_map.dart';
import 'package:weather_api/service/Nafigator.dart';
import 'package:weather_api/componant/search_body.dart';

class MainScrean extends StatelessWidget {
  const MainScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {

      },
      builder: (context, state) {

        var cubit=WeatherCubit.get(context);
        return cubit.weatherModel==null?Center(child: CircularProgressIndicator()):
        Scaffold(
          body:  Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(weatherImages[cubit.weatherModel!.current!.condition!.text!]!),
                fit: BoxFit.cover,
              ),
            ),
            width: width,
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),

                  SizedBox(
                    width: 450.w,
                    child: Text('weather app',style: TextStyle(
                        fontSize: 30.sp
                    ),),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SearchBody(),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cubit.weatherModel!.location!.name! + ' ,  ' +cubit.weatherModel!.location!.country!  ,style: TextStyle(
                              fontSize: 20.sp
                          )),
                          SizedBox(
                            height: 20.sp,
                          ),
                          Text('${cubit.weatherModel!.current!.tempC!}\u00b0',style: TextStyle(
                              fontSize:80.sp
                          )),
                          Row(
                            children: [

                              Image.network("https:${cubit.weatherModel!.current!.condition!.icon!}"),
                              Text(cubit.weatherModel!.current!.isDay! ==1?"Day":'Night',style: TextStyle(
                                  fontSize:20.sp
                              ))
                            ],
                          )

                        ],
                      ),
                      Expanded(
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Text(cubit.weatherModel!.current!.condition!.text!,style: TextStyle(
                              fontSize: 20.sp
                          )),
                        ),
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DetailsComponant(),
                  )

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}