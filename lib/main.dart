import 'package:flutter_calorie_app/DB/models/user_data_model.dart';
import 'package:flutter_calorie_app/pages/app_home_page.dart';
import 'package:flutter_calorie_app/pages/home_page.dart';
import 'package:flutter_calorie_app/pages/home_page_web.dart';
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
import 'data/get_adv_id_and_tz.dart';
import 'data/get_url.dart';
import 'data/shared_preferences.dart';

final container = ProviderContainer();
int appHomePageIndex = 0;
/// Webview
String url = '';
String? advertisingId = '';
String timezone = 'Unknown';
int homePageIndex = 2;
String userAgent = 'unknown';

void main() async{
  /// Check initialization
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterUserAgent.init();
  var webViewUserAgent = FlutterUserAgent.webViewUserAgent;
  userAgent = webViewUserAgent!;
  print(userAgent);
  // await FlutterDownloader.initialize(
  //     debug: true, // optional: set false to disable printing logs to console
  //     ignoreSsl: true);
  /// Permission
  await Permission.storage.request();
  await Permission.camera.request();
  await Permission.photos.request();
  await Permission.photosAddOnly.request();
  await Permission.mediaLibrary.request();
  await Permission.manageExternalStorage.request();
  /// Load url
  url = await LocalData().getUrl();
  if (url != '') {
    /// HOME PAGE
    homePageIndex = 1;
  }
  container.read(homePageProvider.notifier).update((state) => 1);
  print('${container.read(homePageProvider)}');
  print('LOAD URL: $url');

  /// Get url from server
  if (url == '') {
    await GetAdvIdAndTZ().initPlatformState();
    await GetAdvIdAndTZ().initTimeZone();
    url = (await GetUrl()
        .getHttp(advertisingId: advertisingId!, timezone: timezone))!;
    await LocalData().setUrl(url);
    if (url != '') {
      homePageIndex = 1;
    } else {
      /// CHANGE TO 0
      homePageIndex = 0;
    }
  }

  /// Read user start data
  var startData = await DBHelper.instance.readUserData(tableUserDataStart, 1);
  var currentData = await DBHelper.instance.readAllUserData();
  /// Read all products
  ProductsData.listProducts = await DBHelper.instance.readAllProductData();
  ProductsData().calcByDay();
  /// Read all user weights
 UserData().sortUserWeightsPerMonth(Jiffy().month);

  if(startData?.id != null) {
    appHomePageIndex = 1;
    startUserGenger = startData!.isMale;
    startUserHeight = startData.height;
    startUserWeight = startData.weight;
    startUserAge = startData.age;
  }
  if(currentData.isNotEmpty) {
    currentUserHeight = currentData.last.height;
    currentUserWeight = currentData.last.weight;
    currentUserAge = currentData.last.age;
  }
  /// Portrait orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const ProviderScope(child: MyApp())));

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: const HomePage().route,
      routes: {
        const HomePage().route: (context) => const HomePage(),
        const HomePageWeb().route: (context) => const HomePageWeb(),
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
