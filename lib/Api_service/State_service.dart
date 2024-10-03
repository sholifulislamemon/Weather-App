import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wather_app/Api_service/ApiUrl.dart';

import '../model/WatherApiModel.dart';

class Api_Service{


  Future<WeatherApiModel> GetWatherApi( String SearchText) async{

    String url = "${ApiUrl.base_url}&q=${SearchText}&days=10";

    try{
       final response = await http.get(Uri.parse(url));
      if ( response.statusCode == 200){

        Map < String,dynamic>json = jsonDecode(response.body);
        WeatherApiModel watherApiModel= WeatherApiModel.fromJson(json);
        return watherApiModel;

      }
      else {
        print("=======================================......no data found");
        throw ( " no data found");
      }
    }catch(e){
      print(e.toString());
      throw e.toString();
    }

  }

}