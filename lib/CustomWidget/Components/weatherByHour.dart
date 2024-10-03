import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:wather_app/model/WatherApiModel.dart';
import 'package:wather_app/utiltis/Colors.dart';
import 'package:wather_app/utiltis/TextStyle.dart';

class Weatherbyhour extends StatelessWidget {
   final Hour? hour;
  Weatherbyhour({super.key, this.hour});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          Container(
            margin:EdgeInsets.only(right: 10) ,
            padding: EdgeInsets.only(right: 10),
            width: 120,
            decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(25.r),
              color: Colors.black12,
              boxShadow: [
                // BoxShadow(
                //   color: Colors.white70,
                //   spreadRadius: .5,
                //   offset: Offset(5, 5),
                // )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.only( top: 10,bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Heddingtwo(text:hour!.tempC!.round().toString()),
                      HeddingThree(text: "o"),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.primery_Color,
                      shape: BoxShape.circle,

                    ),
                    child: CachedNetworkImage(
                      imageUrl: "https:${hour!.condition!.icon.toString()}",
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),

                  ),
                  HeddingThree(text: DateFormat.j().format(DateTime.parse(hour!.time.toString())))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


