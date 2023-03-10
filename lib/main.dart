import 'package:flutter_calorie_app/DB/models/user_data_model.dart';
import 'package:flutter_calorie_app/pages/app_home_page.dart';
import 'package:flutter_calorie_app/pages/home_pages/current_settings_page/add_button_settings.dart';
import 'package:flutter_calorie_app/pages/home_pages/current_settings_page/current_settings.dart';
import 'package:flutter_calorie_app/pages/home_pages/food_page/add_button_food.dart';
import 'package:flutter_calorie_app/pages/home_pages/food_page/food_page.dart';
import 'package:flutter_calorie_app/pages/home_pages/main_app_page/main_app_page.dart';
import 'package:flutter_calorie_app/pages/home_pages/profile_page/profile_page.dart';
import 'package:flutter_calorie_app/pages/home_pages/statistics_page/statistics_page.dart';
import 'package:flutter_calorie_app/riverpod/riverpod.dart';
import 'package:flutter_calorie_app/utils/library.dart';
import 'package:flutter_calorie_app/pages/home_pages/user_data_start_page/user_data_start_page.dart';

import 'DB/db_helper/db_helper.dart';
import 'DB/user_data/user_data.dart';

final container = ProviderContainer();
int appHomePageIndex = 0;

void main() async{
  /// Check initialization
  WidgetsFlutterBinding.ensureInitialized();
  /// Read user start data
  var startData = await DBHelper.instance.readUserData(tableUserDataStart, 1);
  var currentData = await DBHelper.instance.readAllUserData();
  if(startData?.id != null) {
    appHomePageIndex = 1;
    startUserGenger = startData!.isMale;
    startUserHeight = startData!.height;
    startUserWeight = startData!.weight;
    startUserAge = startData!.age;
  }
  if(currentData.isNotEmpty) {
    currentUserHeight = currentData.last.height;
    currentUserWeight = currentData.last.weight;
    currentUserAge = currentData.last.age;
  }
  // print(startData.id);
  // print('${startData!.weight}');
  runApp(const ProviderScope(child: MyApp()));
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
      initialRoute: const AppHomePage().route,
      routes: {
        const UserDataStartPage().route: (context) => const UserDataStartPage(),
        const MainAppPage().route: (context) => const MainAppPage(),
        const FoodPage().route: (context) => const FoodPage(),
        const ProfilePage().route: (context) => const ProfilePage(),
        const CurrentSettingsPage().route: (context) => const CurrentSettingsPage(),
        const StatisticsPage().route: (context) => const StatisticsPage(),
        const AppHomePage().route: (context) => const AppHomePage(),
        const AddButton().route: (context) => const AddButton(),
        const FoodPage().route: (context) => const FoodPage(),
        const AddButtonFood().route: (context) => const AddButtonFood(),
      },
    );
  }
}
