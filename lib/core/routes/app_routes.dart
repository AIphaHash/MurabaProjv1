import 'package:flutter_application_5/featureDocView/presentation/pages/HomeScreen.dart';
import 'package:flutter_application_5/featureDocView/presentation/pages/Login.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String login = '/login';
  static const String HomePage = '/HomePage';


static List<GetPage> pages = [
  GetPage(name: login, page: () => Login()),
  GetPage(name: HomePage, page: () => Homescreen(fetchUsers: Get.arguments))
];
}