import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:wather_app/CustomWidget/Components/today_wather.dart';
import 'package:wather_app/model/WatherApiModel.dart';
import 'package:wather_app/utiltis/Colors.dart';
import 'package:wather_app/utiltis/TextStyle.dart';

class Futuredetails extends StatelessWidget {
  Forecastday? forecastday;
  Futuredetails({super.key, this.forecastday});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(color: AppColors.primery_Color.withOpacity(.5),
          borderRadius: BorderRadius.circular(25.r)),
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(

                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primery_Color
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https:${forecastday!.day!.condition!.icon.toString()}",
                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    HeddingFour(
                        text: DateFormat.MMMEd()
                            .format(DateTime.parse(forecastday!.date.toString())))
                  ],
                ),
                HeddingFour(text: forecastday!.day!.condition!.text.toString()),
                HeddingFour(
                    text:
                        "^${forecastday!.day!.maxtempC}/${forecastday!.day!.mintempC}")
              ],
            ),
          )),
    );
  }
}
