import 'package:flutter_calorie_app/DB/user_data/user_data.dart';
import 'package:flutter_calorie_app/pages/home_pages/current_settings_page/add_button_settings.dart';
import 'package:flutter_calorie_app/utils/library.dart';

import '../../../utils/dimensions_util.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_parameters.dart';
import '../main_app_page/main_app_page.dart';

class CurrentSettingsPage extends StatefulWidget {
  final String route = 'current settings page';
  final String label = 'Current parameters';
  const CurrentSettingsPage({Key? key}) : super(key: key);

  @override
  State<CurrentSettingsPage> createState() => _CurrentSettingsPageState();
}

class _CurrentSettingsPageState extends State<CurrentSettingsPage> {
  final String image = 'assets/редактирование списка.png';
  final textStyle = TextStyle(
      color: MyColors.whiteColor,
      fontSize: MyParameters.bigFontSize,
      fontWeight: MyParameters.boldFont);
  final List<String> listOfHints = [
    'Enter new height',
    'Enter new weight',
    'Enter new age',
  ];
  final List<TextEditingController> listOfTextControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamed(MainAppPage().route);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.mainColor200,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MainAppPage().route);
              },
              icon: MyParameters.backIcon),
          title: Padding(
            padding: EdgeInsets.only(left: Dimensions.width10 * 3.5),
            child: Text(widget.label),
          ),
        ),
        body: Center(
          child: Container(
            height: Dimensions.height10 * 12,
            width: Dimensions.width10 * 22,
            decoration: BoxDecoration(
                borderRadius: MyParameters.borderRadius20,
                color: MyColors.mainColor200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('Height: $currentUserHeight cm', style: textStyle,),
                SizedBox(height: Dimensions.height10/2,),
                Text('Weight: $currentUserWeight kg', style: textStyle,),
                SizedBox(height: Dimensions.height10/2,),
                Text('Age: $currentUserAge', style: textStyle,),
              ],
            ),
          ),
        ),
        floatingActionButton: buildFloatingActionButton(context),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: MyColors.mainColor200,
      onPressed: () {
    Navigator.of(context).pushNamed(AddButton().route);
  },
  child: SizedBox(
      height: Dimensions.height10*4,
      width: Dimensions.width10*4,
      child: Image.asset(image)),
  );
  }
}