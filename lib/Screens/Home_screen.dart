import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';
import 'package:get/get.dart';
import 'package:wather_app/Api_service/FutureDetails.dart';
import 'package:wather_app/Api_service/State_service.dart';
import 'package:wather_app/CustomWidget/Components/today_wather.dart';
import 'package:wather_app/CustomWidget/Components/weatherByHour.dart';
import 'package:wather_app/model/WatherApiModel.dart';
import 'package:wather_app/utiltis/Colors.dart';
import 'package:wather_app/utiltis/TextStyle.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  WeatherType GetWatherType(Current? current) {
    if (current?.isDay == 0) {
      if (current?.condition?.text == "Sunny") {
        return WeatherType.sunny;
      } else if (current?.condition?.text == "Overcast") {
        return WeatherType.overcast;
      } else if (current?.condition?.text == "Partly cloudy") {
        return WeatherType.cloudy;
      } else if (current?.condition?.text == "Cloudy") {
        return WeatherType.cloudy;
      } else if (current?.condition?.text == "Clear") {
        return WeatherType.sunny;
      } else if (current?.condition?.text == "Mist") {
        return WeatherType.lightSnow;
      } else if (current!.condition!.text!.contains("thunder")) {
        return WeatherType.thunder;
      } else if (current.condition!.text!.contains("showers")) {
        return WeatherType.middleSnow;
      } else if (current.condition!.text!.contains("rain")) {
        return WeatherType.heavyRainy;
      }
    } else {
      if (current?.condition?.text == "Sunny") {
        return WeatherType.sunny;
      } else if (current?.condition?.text == "Overcast") {
        return WeatherType.overcast;
      } else if (current?.condition?.text == "Partly cloudy") {
        return WeatherType.cloudyNight;
      } else if (current?.condition?.text == "Cloudy") {
        return WeatherType.cloudyNight;
      } else if (current?.condition?.text == "Clear") {
        return WeatherType.sunnyNight;
      } else if (current?.condition?.text == "Mist") {
        return WeatherType.lightSnow;
      } else if (current!.condition!.text!.contains("thunder")) {
        return WeatherType.thunder;
      } else if (current.condition!.text!.contains("showers")) {
        return WeatherType.middleSnow;
      } else if (current.condition!.text!.contains("rain")) {
        return WeatherType.heavyRainy;
      }
    }
    return WeatherType.middleRainy;
  }

  Api_Service api_service = Api_Service();
  final textfildcontroller = TextEditingController();
  String searchText = "auto:ip";

  showAlartDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" Search your location "),
            content: TextField(
              controller: textfildcontroller,
              decoration: const InputDecoration(
                hintText: " input your city ",
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("cence")),
              ElevatedButton(
                  onPressed: () {
                    if (textfildcontroller.text.isEmpty) {
                      return;
                    }
                    Navigator.pop(context, textfildcontroller.text);
                  },
                  child: Text("city")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: AppColors.White.withOpacity(.8),
        body: SafeArea(
            child: FutureBuilder(
          future: api_service.GetWatherApi(searchText),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WeatherApiModel? watherapimodel = snapshot.data;
              return Stack(
                children: [
                  WeatherBg(
                    weatherType:GetWatherType(watherapimodel!.current),
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                  ),


                  Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       const SizedBox(),
                        Heddingone(
                            text: "Weather App",
                            TextColor: AppColors.White),
                        Row(
                          children: [
                            Container(
                                margin: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white12),
                                child: IconButton(
                                  onPressed: () async {
                                    textfildcontroller.clear();
                                    String text = await showAlartDialog(context);
                                    setState(() {
                                      searchText = text;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                )),
                            Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white12),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      searchText = "auto:ip" ;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.location_city,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                    TodayWather(watherApiModel: watherapimodel),
                    Container(width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.White.withOpacity(.5),
                          borderRadius: BorderRadius.circular(25.r)
                      ),
                      child: Heddingtwo(
                          text: " Weather by hour ",
                          TextColor: AppColors.secoderyColor),
                    ),
                    SizedBox(
                        height: 164.h,
                        child: ListView.builder(
                          itemCount: watherapimodel
                              .forecast!.forecastday![0].hour!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            Hour hour = watherapimodel
                                .forecast!.forecastday![0].hour![index];
                            return Weatherbyhour(hour: hour);
                          },
                        )),
                    Container(width: double.infinity,
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.White.withOpacity(.5),
                        borderRadius: BorderRadius.circular(25.r)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Heddingtwo(
                            text: " Next 10 days details ",
                            TextColor: AppColors.secoderyColor),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemCount: watherapimodel.forecast!.forecastday!.length,
                      itemBuilder: (context, index) {
                        Forecastday forcastday =
                            watherapimodel.forecast!.forecastday![index];
                        return Futuredetails(
                          forecastday: forcastday,
                        );
                      },
                    ))
                  ],
                                        ),]
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" Your city name is incorected press the back button",style: TextStyle( fontWeight: FontWeight.w700,fontSize: 25),textAlign: TextAlign.center,),
                    ElevatedButton(onPressed: (){
                      Get.to(HomeScreen());
                    }, child: Text(" Back",style:TextStyle( color: AppColors.White,fontSize: 20),),style:ElevatedButton.styleFrom( backgroundColor: AppColors.primery_Color, ))
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator(color: Colors.cyanAccent,strokeWidth: 5,));
          },
        )));
  }
}
