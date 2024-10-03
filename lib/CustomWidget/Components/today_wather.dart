import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:wather_app/model/WatherApiModel.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:wather_app/utiltis/Colors.dart';
import 'package:wather_app/utiltis/TextStyle.dart';

class TodayWather extends StatelessWidget {
  WeatherApiModel? watherApiModel;
  TodayWather({super.key, this.watherApiModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),

          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: SizedBox(
              height: 320.h,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.White.withOpacity(.5),
                        borderRadius: BorderRadius.circular(25.r)),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Heddingtwo(
                                text:
                                    watherApiModel!.location!.name.toString() ??
                                        " ",
                                TextColor: AppColors.secoderyColor),
                            Icon(Icons.location_pin)
                          ],
                        ),
                        HeddingThree(
                            text: DateFormat.jm().format(
                              DateTime.now(),
                            ),
                            TextColor: AppColors.secoderyColor),
                        HeddingThree(
                            text: DateFormat.yMMMMEEEEd().format(
                              DateTime.parse(watherApiModel!
                                      .current!.lastUpdated
                                      .toString() ??
                                  ""),
                            ),
                            TextColor: AppColors.secoderyColor)
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 5,
                                color: AppColors.primery_Color.withOpacity(.7)),
                            color: AppColors.White.withOpacity(.2)),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https:${watherApiModel!.current!.condition!.icon.toString()}",
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          width: 70.w,
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Heddingone(
                                  text:
                                      "${watherApiModel!.current!.tempC!.round().toString()}" ??
                                          "",
                                  fontSize: 60.sp),
                              Text(
                                "o",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          HeddingThree(
                              text: watherApiModel!.current!.condition!.text
                                  .toString())
                        ],
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(25.r)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                HeddingThree(text: "Feel Like"),
                                HeddingThree(
                                    text: watherApiModel!.current!.feelslikeC!
                                        .round()
                                        .toString()),
                              ],
                            ),
                            Column(
                              children: [
                                HeddingThree(text: "Wind"),
                                HeddingThree(
                                    text:
                                        "${watherApiModel!.current!.windKph!.round().toString()} km/h"),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                HeddingThree(text: "Humidity"),
                                HeddingThree(
                                    text:
                                        "${watherApiModel!.current!.humidity!.round().toString()}%"),
                              ],
                            ),
                            Column(
                              children: [
                                HeddingThree(text: "Visibility"),
                                HeddingThree(
                                    text:
                                        "${watherApiModel!.current!.visKm!.round().toString()} km"),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
