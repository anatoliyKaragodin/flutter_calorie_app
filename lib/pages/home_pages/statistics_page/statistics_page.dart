import 'package:flutter_calorie_app/pages/home_pages/statistics_page/mixed_graphic_widget.dart';
import 'package:flutter_calorie_app/pages/home_pages/statistics_page/weight_graphic_widget.dart';
import 'package:flutter_calorie_app/utils/library.dart';

import '../../../utils/dimensions_util.dart';

import '../../../utils/my_parameters.dart';
import '../main_app_page/main_app_page.dart';

class StatisticsPage extends StatefulWidget {
  final String route = 'statistics page';
  final String label = 'Statistics';
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
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
          padding: EdgeInsets.only(left: Dimensions.width10 * 6),
          child: Text(widget.label),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: Dimensions.height10 * 2,
          ),

          /// Weight graphic
          WeightGraphicWidget(),
          SizedBox(
            height: Dimensions.height10 * 3,
          ),

          /// Mixed graphic
          MixedGraphicWidget(),
        ],
      ),
    );
  }
}
