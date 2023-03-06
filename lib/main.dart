import 'package:flutter_calorie_app/pages/home_pages/current_settings_page/current_settings.dart';
import 'package:flutter_calorie_app/pages/home_pages/food_page/food_page.dart';
import 'package:flutter_calorie_app/pages/home_pages/main_app_page/main_app_page.dart';
import 'package:flutter_calorie_app/pages/home_pages/profile_page/profile_page.dart';
import 'package:flutter_calorie_app/pages/home_pages/statistics_page/statistics_page.dart';
import 'package:flutter_calorie_app/utils/library.dart';
import 'package:flutter_calorie_app/pages/home_pages/user_data_start_page/user_data_start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: FoodPage().route,
      routes: {
        const UserDataStartPage().route: (context) => const UserDataStartPage(),
        const MainAppPage().route: (context) => const MainAppPage(),
        const FoodPage().route: (context) => const FoodPage(),
        const ProfilePage().route: (context) => const ProfilePage(),
        const CurrentSettingsPage().route: (context) => const CurrentSettingsPage(),
        const StatisticsPage().route: (context) => const StatisticsPage(),
      },
    );
  }
}
