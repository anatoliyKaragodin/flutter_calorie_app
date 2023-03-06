import 'package:flutter_calorie_app/pages/home_pages/food_page/add_button.dart';
import 'package:flutter_calorie_app/pages/home_pages/food_page/list_of_products_widget.dart';
import 'package:flutter_calorie_app/pages/home_pages/main_app_page/main_app_page.dart';
import 'package:flutter_calorie_app/utils/dimensions_util.dart';
import 'package:flutter_calorie_app/utils/library.dart';
import 'package:flutter_calorie_app/utils/my_parameters.dart';

import '../../../utils/my_colors.dart';
import 'list_of_days_widget.dart';

class FoodPage extends StatefulWidget {
  final String route = 'food page';
  final String label = 'Food';
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MainAppPage().route);
            },
            icon: MyParameters.backIcon),
        title: Padding(
          padding: EdgeInsets.only(left: Dimensions.width10 * 8),
          child: Text(widget.label),
        ),
      ),
      body: Column(
        children: [
          ListOfDaysWidget(),
          Container(
            decoration: BoxDecoration(
                color: MyColors.mainColor,
                // borderRadius: MyParameters.borderRadius20
            ),
            height: Dimensions.height10 * 3,
            width: Dimensions.screenWidth,
            child: Center(child: Text('Products list')),
          ),
          ListOfProductsWidget()
        ],
      ),
      floatingActionButton: AddButton(),
    );
  }
}
