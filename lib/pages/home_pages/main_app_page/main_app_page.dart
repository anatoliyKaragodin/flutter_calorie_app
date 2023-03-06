import 'package:flutter_calorie_app/utils/dimensions_util.dart';
import 'package:flutter_calorie_app/utils/library.dart';
import 'package:flutter_calorie_app/utils/my_borders.dart';

import '../current_settings_page/current_settings.dart';
import '../food_page/food_page.dart';
import '../profile_page/profile_page.dart';
import '../statistics_page/statistics_page.dart';

class MainAppPage extends StatefulWidget {
  final String route = 'main app page';
  const MainAppPage({Key? key}) : super(key: key);

  @override
  State<MainAppPage> createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  final List pages = [
    FoodPage(),
    ProfilePage(),
    StatisticsPage(),
    CurrentSettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: Dimensions.width10 * 15,
          height: Dimensions.height10 * 25,
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: MyBorders.borderRadius20,
                  ))),
                  onPressed: () {
                    Navigator.of(context).pushNamed(pages[index].route);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.accessibility_new_rounded),
                      Text('data $index')
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
