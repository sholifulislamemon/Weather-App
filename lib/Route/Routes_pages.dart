import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:wather_app/Route/route_names.dart';
import 'package:wather_app/Screens/Home_screen.dart';

class RoutesPages{

  static  List<GetPage<dynamic>>? routes= [
    GetPage(name: RoutesNames.home, page: () => HomeScreen(),),


  ];
}

