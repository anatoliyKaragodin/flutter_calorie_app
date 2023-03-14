import 'package:flutter_calorie_app/DB/user_data/user_data.dart';
import 'package:flutter_calorie_app/riverpod/riverpod.dart';
import 'package:flutter_calorie_app/utils/dimensions_util.dart';
import 'package:flutter_calorie_app/utils/library.dart';
import 'package:flutter_calorie_app/utils/my_parameters.dart';

import '../../../utils/my_colors.dart';
import '../current_settings_page/current_settings.dart';
import '../food_page/food_page.dart';
import '../profile_page/profile_page.dart';
import '../statistics_page/statistics_page.dart';

class MainAppPage extends ConsumerStatefulWidget {
  final String route = 'main app page';
  const MainAppPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MainAppPage> createState() => _MainAppPageState();
}

class _MainAppPageState extends ConsumerState<MainAppPage> {
  final List pages = [
    FoodPage(),
    ProfilePage(),
    StatisticsPage(),
    CurrentSettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    final selectedDay = ref.watch(selectedDayProvider);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: Dimensions.width10 * 23,
          height: Dimensions.height10 * 28,
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(Dimensions.height10/2),
                  child: ElevatedButton(
                    style: ButtonStyle(

                        backgroundColor:
                        MaterialStatePropertyAll(MyColors.mainColor200),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: MyParameters.borderRadius20,
                          ),
                        )),
                    onPressed: () async {
                      var products = await ProductsData().sortByDay(selectedDay);
                      ref.read(selectedDayProductsProvider.notifier).update((state) => products);
                      Navigator.of(context).pushNamed(pages[index].route);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.accessibility_new_rounded),
                        SizedBox(width: Dimensions.width10,),
                        Text(pages[index].label, style: TextStyle(
                            fontSize: MyParameters.bigFontSize,
                            fontWeight: MyParameters.boldFont))
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
